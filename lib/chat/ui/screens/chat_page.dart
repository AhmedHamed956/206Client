import 'dart:developer';
import 'dart:ffi';
import 'dart:io';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:project/Ui/home/Cubit.dart';
import 'package:project/Ui/home/states.dart';
import 'package:project/chat/ui/screens/full_image_view.dart';
import 'package:project/chat/ui/widget/common_widgets.dart';
import 'package:project/network/remote/endPoint.dart';

import '../../../Shared/constant.dart';
import '../../../components/component.dart';
import '../../../network/local/cache-helper.dart';
import '../../constants/firestore_constants.dart';
import '../../constants/size_constants.dart';
import '../../model/chat_messages.dart';
import '../../repo/chat_provider.dart';

class ChatPage extends StatefulWidget {
  final String branchID;
  final String peerNickname;
  String? fcmToken;
  String? image;
  String? shopname;

  ChatPage(
      {Key? key,
      required this.peerNickname,
      required this.branchID,
      required this.image,
      required this.shopname,
      this.fcmToken})
      : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
} //01016118790

class _ChatPageState extends State<ChatPage> {
  late String currentUserId;

  List<QueryDocumentSnapshot> listMessages = [];

  int _limit = 20;
  final int _limitIncrement = 20;
  String groupChatId = '';
  late final FirebaseFirestore firebaseFirestore;
  int? orderID;
  File? imageFile;
  bool isLoading = false;
  bool isShowSticker = false;
  String imageUrl = '';
  int? endcall;

  final TextEditingController textEditingController = TextEditingController();
  final ScrollController scrollController = ScrollController();
  final FocusNode focusNode = FocusNode();

  late ChatProvider chatProvider;

  @override
  void initState() {
    super.initState();
    chatProvider = context.read<ChatProvider>();

    focusNode.addListener(onFocusChanged);
    scrollController.addListener(_scrollListener);
    readLocal();
  }

  Future<bool> exitConfirm() async {
    return await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            content: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Do you want to exit call?',
                  style: TextStyle(color: appbarTextcolor, fontSize: 16),
                ),
              ],
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    child: Text('Yes'),
                    onPressed: () async {
                      await HomeCubit.get(context)
                          .endCall(orderID.toString(), '70', endcall.toString())
                          .then((value) => Navigator.of(context).pop(true));
                    },
                    style: ElevatedButton.styleFrom(
                        primary: button1color,
                        textStyle: TextStyle(
                          fontSize: 12,
                        )),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                    child: Text('no'),
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                    style: ElevatedButton.styleFrom(
                        primary: button1color,
                        textStyle: TextStyle(
                          fontSize: 12,
                        )),
                  ),
                ],
              )
            ],
          ),
        ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeAppState>(
      listener: (context, state) {
        if (state is EndCallSuccessStates) {
          Navigator.of(context).pop(true);
        }
      },
      builder: (context, state) {
        return WillPopScope(
          onWillPop: exitConfirm,
          child: Scaffold(
              // appBar: AppBar(),
              body: SafeArea(
                  child: StreamBuilder<QuerySnapshot>(
                      stream: chatProvider.call(),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        for (int i = 0; i < snapshot.data!.docs.length; i++) {
                          if (snapshot.data?.docs[i].get('user_id') ==
                                  userId.toString() &&
                              snapshot.data?.docs[i].get('branch_id') ==
                                  widget.branchID) {
                            // setState(() {
                            orderID = snapshot.data?.docs[i].get('id');
                            endcall = int.parse(
                                snapshot.data?.docs[i].get('call_end'));

                            if (endcall == 0) {
                              endcall = (endcall! + 1);
                            }

                            if (snapshot.data?.docs[i].get('call_end') == '1') {
                              if (snapshot.data?.docs[i].get('cashier_id') ==
                                  null) {
                                endcall = 2;
                                // HomeCubit.get(context)
                                //     .endCall(orderID.toString(), '70',
                                //         endcall.toString())
                                //     .then((value) =>
                                //         Navigator.of(context).pop(true));
                              }

                              // if(snapshot.data?.docs[i].get('cashier_id') !=
                              //     null){

                              //     }
                              // endcall = (endcall! + 1);

                            }
                            if (snapshot.data?.docs[i].get('call_end') == '0') {
                              if (snapshot.data?.docs[i].get('cashier_id') ==
                                  null) {
                                endcall = 2;
                              }

                              // if(snapshot.data?.docs[i].get('cashier_id') !=
                              //     null){

                              //     }
                              // endcall = (endcall! + 1);

                            }

                            if (snapshot.data?.docs[i].get('call_end') == '0') {
                              if (snapshot.data?.docs[i].get('cashier_id') !=
                                  null) {
                                endcall = 1;
                              }

                              // if(snapshot.data?.docs[i].get('cashier_id') !=
                              //     null){

                              //     }
                              // endcall = (endcall! + 1);

                            }

                            if (snapshot.data?.docs[i].get('call_end') == '1') {
                              endcall = (endcall! + 1);
                              HomeCubit.get(context).endCall(
                                  orderID.toString(), '70', endcall.toString());
                              // .then((value) =>
                              //     Navigator.of(context).pop(true));
                            }

                            print(endcall);
                            // });
                          }
                        }
                        return Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: Sizes.dimen_8),
                          child: Column(
                            children: [
                              Container(
                                child: Row(
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          exitConfirm();
                                        },
                                        icon: Icon(Icons.arrow_back_ios)),

                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: Container(
                                          height: 48,
                                          width: 48,
                                          child:
                                              Image.network('${widget.image}')),
                                    ),
                                    SizedBox(
                                      width: 12,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          widget.shopname.toString(),
                                          style: TextStyle(
                                              color: otpTexecolor,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          'نشط',
                                          style: TextStyle(
                                            color: greencolor,
                                            fontSize: 12,
                                          ),
                                        )
                                      ],
                                    )
                                    // Text('aaaa'),
                                  ],
                                ),
                              ),
                              buildListMessage(),
                              for (int i = 0;
                                  i < snapshot.data!.docs.length;
                                  i++)
                                if (snapshot.data?.docs[i].get('is_waiting') ==
                                        true &&
                                    snapshot.data?.docs[i].get('user_id') ==
                                        userId.toString() &&
                                    snapshot.data?.docs[i].get('branch_id') ==
                                        widget.branchID)
                                  Container(
                                      decoration: const BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(25),
                                              topRight: Radius.circular(25))),
                                      width: MediaQuery.of(context).size.width,
                                      height: 99.0,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'الكاشير معه مكالمة, حاول مرة اخري',
                                            style: TextStyle(
                                                color: accountItemsListColors,
                                                fontSize: 16),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            '(${snapshot.data?.docs[i].get('num_of_waiting')}) قائمة الانتظار',
                                            style: TextStyle(
                                                color: resendTextcolor,
                                                fontSize: 16),
                                          ),
                                        ],
                                      )),
                              for (int i = 0;
                                  i < snapshot.data!.docs.length;
                                  i++)
                                if (snapshot.data?.docs[i].get('hasFatora') ==
                                    true)
                                  StreamBuilder<QuerySnapshot>(
                                    stream: chatProvider.invoice(),
                                    builder: (BuildContext context,
                                        AsyncSnapshot<QuerySnapshot> snapshot) {
                                      for (int i = 0;
                                          i < snapshot.data!.docs.length;
                                          i++) {
                                        if (snapshot.data?.docs[i]
                                                    .get('user_id')
                                                    .toString() ==
                                                userId.toString() &&
                                            snapshot.data?.docs[i]
                                                    .get('branch_id')
                                                    .toString() ==
                                                widget.branchID) {
                                          return Container(
                                            decoration: const BoxDecoration(
                                                // color: button1color,
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(25),
                                                    topRight:
                                                        Radius.circular(25))),
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            // height: 350.0,

                                            alignment: Alignment
                                                .center, // where to position the child
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Container(
                                                  decoration: const BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              topLeft: Radius
                                                                  .circular(25),
                                                              topRight: Radius
                                                                  .circular(
                                                                      25))),
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  height: 267.0,
                                                  child: Column(children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 20,
                                                              left: 20,
                                                              right: 20),
                                                      child: Container(
                                                        width: MediaQuery.of(
                                                                context)
                                                            .size
                                                            .width,
                                                        decoration: BoxDecoration(
                                                            border: Border.all(
                                                                color:
                                                                    border2Color),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10)),
                                                        child: Center(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        14,
                                                                    vertical:
                                                                        15),
                                                            child: Row(
                                                              children: [
                                                                Image.asset(
                                                                    'assets/images/focus (1).png'),
                                                                Spacer(),
                                                                Text(
                                                                    'تفاصيل الفاتورة',
                                                                    style:
                                                                        TextStyle(
                                                                      color:
                                                                          appbarTextcolor,
                                                                      fontSize:
                                                                          14,
                                                                    )),
                                                                SizedBox(
                                                                  width: 12,
                                                                ),
                                                                Container(
                                                                  height: 46,
                                                                  width: 46,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color:
                                                                        circleColor,
                                                                    shape: BoxShape
                                                                        .circle,
                                                                  ),
                                                                  child: Image
                                                                      .asset(
                                                                          'assets/images/invoice-_1_.png'),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 14,
                                                              right: 20,
                                                              left: 20),
                                                      child: Container(
                                                        width: MediaQuery.of(
                                                                context)
                                                            .size
                                                            .width,
                                                        decoration: BoxDecoration(
                                                            border: Border.all(
                                                                color:
                                                                    border2Color),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10)),
                                                        child: Center(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        14,
                                                                    vertical:
                                                                        15),
                                                            child: Row(
                                                              children: [
                                                                Text(
                                                                    '${snapshot.data?.docs[i].get('subtotal')} ر.س',
                                                                    style:
                                                                        TextStyle(
                                                                      color:
                                                                          button1color,
                                                                      fontSize:
                                                                          16,
                                                                    )),
                                                                Spacer(),
                                                                Text('الاجمالي',
                                                                    style:
                                                                        TextStyle(
                                                                      color:
                                                                          appbarTextcolor,
                                                                      fontSize:
                                                                          14,
                                                                    )),
                                                                // SizedBox(
                                                                //   width: 12,
                                                                // ),
                                                                // Container(
                                                                //   height: 46,
                                                                //   width: 46,
                                                                //   decoration: BoxDecoration(
                                                                //     color: circleColor,
                                                                //     shape: BoxShape.circle,
                                                                //   ),
                                                                //   child: Image.asset(
                                                                //       'assets/images/invoice-_1_.png'),
                                                                // ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          vertical: 16),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          ConditionalBuilder(
                                                            condition: state
                                                                is! AcceptLoadingState,
                                                            builder: (context) {
                                                              return InkWell(
                                                                onTap:
                                                                    () async {
                                                                  await HomeCubit.get(context).acceptInovice(
                                                                      snapshot
                                                                          .data
                                                                          ?.docs[
                                                                              i]
                                                                          .get(
                                                                              'order_id'),
                                                                      'accept');
                                                                },
                                                                child:
                                                                    Container(
                                                                  height: 56,
                                                                  width: 159,
                                                                  decoration: BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              16),
                                                                      color:
                                                                          greenAcceptcolor),
                                                                  child: Center(
                                                                    child: Text(
                                                                      "قبول",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              16,
                                                                          color:
                                                                              Colors.white),
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                            fallback: (context) =>
                                                                Container(
                                                                    height: 56,
                                                                    width: 159,
                                                                    child: Center(
                                                                        child: CircularProgressIndicator(
                                                                      color:
                                                                          button1color,
                                                                    ))),
                                                          ),
                                                          SizedBox(
                                                            width: 17,
                                                          ),
                                                          ConditionalBuilder(
                                                            condition: state
                                                                is! RefusedLoadingState,
                                                            builder: (context) {
                                                              return InkWell(
                                                                onTap:
                                                                    () async {
                                                                  await HomeCubit.get(context).refusedInovice(
                                                                      snapshot
                                                                          .data
                                                                          ?.docs[
                                                                              i]
                                                                          .get(
                                                                              'order_id'),
                                                                      'refuse');
                                                                },
                                                                child:
                                                                    Container(
                                                                  height: 56,
                                                                  width: 159,
                                                                  decoration: BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              16),
                                                                      color:
                                                                          redRefusedcolor),
                                                                  child: Center(
                                                                    child: Text(
                                                                      "رفص",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              16,
                                                                          color:
                                                                              Colors.white),
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                            fallback: (context) =>
                                                                Container(
                                                                    height: 56,
                                                                    width: 159,
                                                                    child: Center(
                                                                        child: CircularProgressIndicator(
                                                                      color:
                                                                          button1color,
                                                                    ))),
                                                          )
                                                        ],
                                                      ),
                                                    )
                                                  ]),
                                                )
                                              ],
                                            ),
                                          );
                                        }
                                      }

                                      return Container();
                                    },
                                  ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16),
                                child: buildMessageInput(),
                              ),
                            ],
                          ),
                        );

                        // }

                        // } else {
                        //   return const Center(child: Text('sssssss'));
                        // }
                      }))),
        );
      },
    );
  }

  Widget buildMessageInput() {
    return Container(
        width: double.infinity,
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(children: [
          Flexible(
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: textFieldColor)),
                  child: TextField(
                      focusNode: focusNode,
                      textInputAction: TextInputAction.send,
                      keyboardType: TextInputType.text,
                      textCapitalization: TextCapitalization.sentences,
                      controller: textEditingController,
                      maxLines: null,
                      onSubmitted: (value) {
                        onSendMessage(
                            textEditingController.text, MessageType.text);
                      },
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'أدخل رسالتك',
                          prefixIcon: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                IconButton(
                                    icon: const Icon(Icons.send,
                                        color: button1color),
                                    onPressed: () {
                                      onSendMessage(textEditingController.text,
                                          MessageType.text);
                                    }),
                                IconButton(
                                    icon: const Icon(Icons.attach_file,
                                        color: button1color),
                                    onPressed: () => getImage())
                              ]))))),
        ]));
  }

  Widget buildItem(int index, DocumentSnapshot? documentSnapshot) {
    if (documentSnapshot != null) {
      ChatMessages chatMessages = ChatMessages.fromDocument(documentSnapshot);
      if (chatMessages.idFrom == currentUserId) {
        // right side (my message)
        return Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            chatMessages.type == MessageType.text
                ? messageBubble(
                    chatContent: chatMessages.content,
                    color: button1color,
                    textColor: Colors.white)
                : chatMessages.type == MessageType.image
                    ? Container(
                        margin: const EdgeInsets.only(
                            right: Sizes.dimen_10,
                            top: Sizes.dimen_8,
                            bottom: Sizes.dimen_8),
                        child: chatImage(
                            imageSrc: chatMessages.content,
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => FullImageView(
                                            url: chatMessages.content,
                                          )));
                            }))
                    : const SizedBox.shrink(),
            isMessageSent(index)
                ? Image.asset('assets/images/206_Logo.png',
                    height: 35, width: 35)
                : Container(width: 35)
          ]),
          isMessageSent(index)
              ? Container(
                  margin: const EdgeInsets.only(
                      right: Sizes.dimen_50,
                      top: Sizes.dimen_6,
                      bottom: Sizes.dimen_8),
                  child: Text(
                      DateFormat('dd MMM yyyy, hh:mm a').format(
                          DateTime.fromMillisecondsSinceEpoch(
                              int.parse(chatMessages.timestamp))),
                      style: const TextStyle(
                          color: textColor,
                          fontSize: Sizes.dimen_12,
                          fontStyle: FontStyle.italic)))
              : const SizedBox.shrink()
        ]);
      } else {
        return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            isMessageSent(index)
                ? Image.asset('assets/images/206_Logo.png',
                    height: 35, width: 35)
                : Container(width: 35),
            chatMessages.type == MessageType.text
                ? messageBubble(
                    color: textColor,
                    textColor: Colors.white,
                    chatContent: chatMessages.content)
                : chatMessages.type == MessageType.image
                    ? Container(
                        margin: const EdgeInsets.only(
                            left: Sizes.dimen_10,
                            top: Sizes.dimen_8,
                            bottom: Sizes.dimen_8),
                        child: chatImage(
                            imageSrc: chatMessages.content,
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => FullImageView(
                                            url: chatMessages.content,
                                          )));
                            }))
                    : const SizedBox.shrink()
          ]),
          isMessageReceived(index)
              ? Container(
                  margin: const EdgeInsets.only(
                      left: Sizes.dimen_50,
                      top: Sizes.dimen_6,
                      bottom: Sizes.dimen_8),
                  child: Text(
                      DateFormat('dd MMM yyyy, hh:mm a').format(
                          DateTime.fromMillisecondsSinceEpoch(
                              int.parse(chatMessages.timestamp))),
                      style: const TextStyle(
                          color: textColor,
                          fontSize: Sizes.dimen_12,
                          fontStyle: FontStyle.italic)))
              : const SizedBox.shrink()
        ]);
      }
    } else {
      return const SizedBox.shrink();
    }
  }

  Widget buildListMessage() {
    return Flexible(
        child: groupChatId.isNotEmpty
            ? StreamBuilder<QuerySnapshot>(
                stream: chatProvider.getChatMessage(groupChatId, _limit),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasData) {
                    listMessages = snapshot.data!.docs;
                    if (listMessages.isNotEmpty) {
                      return ListView.separated(
                          padding: const EdgeInsets.all(10),
                          itemCount: snapshot.data!.docs.length,
                          reverse: true,
                          controller: scrollController,
                          itemBuilder: (context, index) =>
                              buildItem(index, snapshot.data?.docs[index]),
                          separatorBuilder: (BuildContext context, int index) =>
                              const SizedBox(height: 2));
                    } else {
                      return const Center(child: Text('No messages...'));
                    }
                  } else {
                    return const Center(
                        child: CircularProgressIndicator(color: button2color));
                  }
                })
            : const Center(
                child: CircularProgressIndicator(color: button2color)));
  }

  _scrollListener() {
    if (scrollController.offset >= scrollController.position.maxScrollExtent &&
        !scrollController.position.outOfRange) {
      setState(() {
        _limit += _limitIncrement;
      });
    }
  }

  void onFocusChanged() {
    if (focusNode.hasFocus) {
      setState(() {
        isShowSticker = false;
      });
    }
  }

  void readLocal() async {
    currentUserId = userId.toString();
    // await CacheHelper.getData(key: 'userId').toString();

    groupChatId = '${widget.branchID} - $currentUserId';
    print(groupChatId);
    // if (currentUserId.compareTo(widget.peerId) > 0) {
    //   groupChatId = '$currentUserId - ${widget.peerId}';
    // } else {
    //   groupChatId = '${widget.peerId} - $currentUserId';
    // }
    setState(() {});
  }

  void getSticker() {
    focusNode.unfocus();
    setState(() {
      isShowSticker = !isShowSticker;
    });
  }

  Future<bool> onBackPressed() {
    if (isShowSticker) {
      setState(() {
        isShowSticker = false;
      });
    } else {
      chatProvider.updateFirestoreData(FirestoreConstants.pathUserCollection,
          currentUserId, {FirestoreConstants.chattingWith: null});
    }
    return Future.value(false);
  }

  void onSendMessage(String content, int type) {
    if (content.trim().isNotEmpty) {
      textEditingController.clear();
      chatProvider.sendChatMessage(content, type, groupChatId, currentUserId,
          widget.branchID, widget.peerNickname, widget.fcmToken);
      if (scrollController.hasClients) {
        scrollController.animateTo(0,
            duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
      }
    } else {
      showSnackBar(title: 'Nothing to send');
    }
  }

  // checking if received message
  bool isMessageReceived(int index) {
    if ((index > 0 &&
            listMessages[index - 1].get(FirestoreConstants.idFrom) ==
                currentUserId) ||
        index == 0) {
      return true;
    } else {
      return false;
    }
  }

  // checking if sent message
  bool isMessageSent(int index) {
    if ((index > 0 &&
            listMessages[index - 1].get(FirestoreConstants.idFrom) !=
                currentUserId) ||
        index == 0) {
      return true;
    } else {
      return false;
    }
  }

  Future getImage() async {
    ImagePicker imagePicker = ImagePicker();
    XFile? pickedFile;
    pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
      if (imageFile != null) {
        setState(() {
          isLoading = true;
        });
        uploadImageFile();
      }
    }
  }

  void uploadImageFile() async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    UploadTask uploadTask = chatProvider.uploadImageFile(imageFile!, fileName);
    try {
      TaskSnapshot snapshot = await uploadTask;
      imageUrl = await snapshot.ref.getDownloadURL();
      setState(() {
        isLoading = false;
        onSendMessage(imageUrl, MessageType.image);
      });
    } on FirebaseException catch (e) {
      setState(() {
        isLoading = false;
      });
      showSnackBar(title: e.message ?? e.toString());
    }
  }
}
