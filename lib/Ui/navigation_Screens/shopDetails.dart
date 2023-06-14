import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/Models/joinCall_model.dart';
import 'package:project/Models/shop_details.dart';
import 'package:project/Shared/constant.dart';
import 'package:project/Ui/home/Cubit.dart';
import 'package:project/Ui/home/states.dart';
import 'package:project/Ui/navigation_Screens/one_offer.dart';
import 'package:project/chat/repo/chat_provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../chat/ui/screens/chat_cycle.dart';
import '../../common/route_argument.dart';
import '../AgoraCalling/vedioCall.dart';
import '../AgoraCalling/voiceCall.dart';

class ShopDetails extends StatefulWidget {
  final String? shopID;
  const ShopDetails({super.key, this.shopID});

  @override
  State<ShopDetails> createState() => _ShopDetailsState();
}

class _ShopDetailsState extends State<ShopDetails>
    with TickerProviderStateMixin {
  late TabController tabController;
  String? callType;
  // late ChatProvider chatProvider;

  // ignore: prefer_typing_uninitialized_variables
  var model;
  bool? isfav;
  @override
  void initState() {
    // chatProvider = context.read<ChatProvider>();

    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();

    super.dispose();
  }

  void _onTabTap(int value) {
    tabController.animateTo(value);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) =>
            HomeCubit()..shopdetails(shopId: widget.shopID.toString()),
        child:
            BlocConsumer<HomeCubit, HomeAppState>(listener: (context, state) {
          if (state is ShopDetailsSuccessStates) {
            model = HomeCubit.get(context).shopDetailsModel;
            setState(() {
              isfav = model?.data?.isFavorite;
            });
          }
          if (state is JoinCallSuccessStates) {
            List<String> data = [
              model.data!.id.toString(),
              // "رسالة جديدة من الدعم",
              '',
              model.data!.image.toString(),
              model.data!.translations!.first.name.toString()
            ];
            Navigator.pushNamed(context, ChatCycle.routeName,
                arguments: RouteArgument(param: data, id: userId));
          }

          if (state is JoinVoiceCallSuccessStates) {
            setState(() {
              agoratoken =
                  "c4fb09bcf40a249073815IADhsG6u5BhWPOP/xxcNOBe1ymjxEkERQ+66Q1qerxuODsJ97mcoWkSjIgAahgAA6tGIZAQAAQB6jodkAwB6jodkAgB6jodkBAB6jodk";
              // HomeCubit.get(context).joinCallModel?.data?.clientToken;
              channelname = "tfddhgdsfah";
              // HomeCubit.get(context).joinCallModel?.data?.channelName;
            });

            print(agoratoken);
            print(channelname);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MarketCall(
                          image: model.data?.image,
                          agoraToken: agoratoken.toString(),
                          channelName: channelname.toString(),
                        )));
          }
        }, builder: (context, state) {
          return ConditionalBuilder(
            condition: HomeCubit.get(context).shopDetailsModel != null,
            builder: (context) => shopdetailsScreen(
                HomeCubit.get(context).shopDetailsModel, state),
            fallback: (context) => Container(
                color: Colors.white,
                child: Center(
                    child: CircularProgressIndicator(
                  color: button1color,
                ))),
          );
        }));
  }

  Widget shopdetailsScreen(ShopDetailsModel? model, state) => Scaffold(
        backgroundColor: favouteIconColor,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: appbarTextcolor,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          // automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 0.0,
          centerTitle: true,
          title: Text(
            "${model?.data?.translations?.first.name}",
            style: TextStyle(color: appbarTitleColor),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: favouteIconColor,
                  ),
                  child: isfav == false
                      ? IconButton(
                          icon: Icon(
                            Icons.favorite_border,
                            color: shadowColor.withOpacity(0.5),
                          ),
                          onPressed: () async {
                            await HomeCubit.get(context).isfavouate(
                                shopId: model!.data!.id.toString(),
                                isfavourat: '1');
                            setState(() {
                              isfav = true;
                            });
                          },
                        )
                      : IconButton(
                          icon: Icon(
                            Icons.favorite,
                            color: button1color,
                          ),
                          onPressed: () async {
                            await HomeCubit.get(context).isfavouate(
                                shopId: model!.data!.id.toString(),
                                isfavourat: '0');
                            setState(() {
                              isfav = false;
                            });
                          },
                        )),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                          border: Border.all(color: button1color),
                          shape: BoxShape.circle),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.network(
                          '${model?.data?.image}',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          '${model?.data?.numProducts}',
                          style:
                              TextStyle(color: appbarTitleColor, fontSize: 18),
                        ),
                        Text(
                          'منتجات',
                          style:
                              TextStyle(color: appbarTitleColor, fontSize: 14),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          '${model?.data?.numOffers}',
                          style:
                              TextStyle(color: appbarTitleColor, fontSize: 18),
                        ),
                        Text(
                          'عروض',
                          style:
                              TextStyle(color: appbarTitleColor, fontSize: 14),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          '(${model?.data?.rate})',
                          style:
                              TextStyle(color: appbarTitleColor, fontSize: 18),
                        ),
                        Text(
                          'تقيمات',
                          style:
                              TextStyle(color: appbarTitleColor, fontSize: 14),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: Text(
                        '${model?.data?.translations?.first.name}',
                        style: TextStyle(color: appbarTitleColor, fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: Row(
                  children: [
                    Container(
                        height: 18,
                        width: 18,
                        child: Image.asset("assets/images/clock.png")),
                    SizedBox(
                      width: 10,
                    ),
                    model?.data?.isOpen == true
                        ? Container(
                            child: Text(
                              'Open Now',
                              style: TextStyle(
                                  color: openingNowColor, fontSize: 12),
                            ),
                          )
                        : Container(
                            child: Text(
                              'close Now',
                              style: TextStyle(
                                  color: redRefusedcolor, fontSize: 12),
                            ),
                          ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      child: Text(
                        'Closes ${model?.data?.closeTime}',
                        style: TextStyle(color: appbarTitleColor, fontSize: 12),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 11,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ConditionalBuilder(
                      condition: state is! JoinCallLoadingState,
                      builder: (context) {
                        return InkWell(
                          onTap: () async {
                            await HomeCubit.get(context)
                                .joinCall(model!.data!.id.toString(), 'chat');
                          },
                          child: Container(
                            height: 44,
                            width: 107,
                            decoration: const BoxDecoration(
                                color: button1color,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12))),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                      height: 20,
                                      width: 20,
                                      child: Image.asset(
                                          "assets/images/chat.png")),
                                  Text('chat',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16))
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      fallback: (context) => Container(
                          height: 44,
                          width: 107,
                          child: Center(
                              child: CircularProgressIndicator(
                            color: button1color,
                          ))),
                    ),
                    ConditionalBuilder(
                      condition: state is! JoinVoiceCallLoadingState,
                      builder: (context) {
                        return InkWell(
                          onTap: () async {
                            await HomeCubit.get(context).joinVoiceCall(
                              model!.data!.id.toString(),
                              'call',
                            );
                          },
                          child: Container(
                            height: 44,
                            width: 107,
                            decoration: const BoxDecoration(
                                color: cardcolor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12))),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 14),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                      height: 20,
                                      width: 20,
                                      child: Image.asset(
                                          "assets/images/call.png")),
                                  Text('call',
                                      style: TextStyle(
                                          color: boardingText, fontSize: 16))
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      fallback: (context) => Container(
                          height: 44,
                          width: 107,
                          child: Center(
                              child: CircularProgressIndicator(
                            color: button1color,
                          ))),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const VedioCall()));
                      },
                      child: Container(
                        height: 44,
                        width: 107,
                        decoration: const BoxDecoration(
                            color: cardcolor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                  height: 20,
                                  width: 20,
                                  child:
                                      Image.asset("assets/images/vedio.png")),
                              Text('vedio',
                                  style: TextStyle(
                                      color: boardingText, fontSize: 16))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: double.infinity,
                  child: DefaultTabController(
                      length: 2,
                      initialIndex: 0,
                      child: Scaffold(
                        body: Column(
                          children: [
                            TabBar(
                              indicatorColor: button1color,
                              indicatorWeight: 3,
                              indicatorSize: TabBarIndicatorSize.label,
                              labelColor: button1color,
                              unselectedLabelColor: unSelectedIndcatorColor,
                              // isScrollable: true,
                              // onTap: _onTabTap,
                              // controller: tabController,
                              labelStyle: const TextStyle(fontSize: 16),
                              unselectedLabelStyle:
                                  const TextStyle(fontSize: 16),
                              tabs: [
                                Tab(
                                  text: 'products',
                                ),
                                Tab(
                                  text: 'offers',
                                )
                              ],
                            ),
                            Expanded(
                              child: TabBarView(
                                children: [
                                  MediaQuery.removePadding(
                                      context: context,
                                      removeTop: true,
                                      child: GridView.builder(
                                          gridDelegate:
                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 3,
                                          ),
                                          itemCount:
                                              model?.data?.products?.length,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return InkWell(
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            ProductShow(
                                                              shopname: model
                                                                  ?.data
                                                                  ?.translations
                                                                  ?.first
                                                                  .name,
                                                            )));
                                              },
                                              child: Card(
                                                // color: Colors.blue,
                                                child: Image.network(
                                                    '${model?.data?.image}'),
                                              ),
                                            );
                                          })),
                                  MediaQuery.removePadding(
                                      context: context,
                                      removeTop: true,
                                      child: GridView.builder(
                                          gridDelegate:
                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 3,
                                          ),
                                          itemCount:
                                              model?.data?.offers?.length,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return InkWell(
                                              onTap: () {
                                                // Navigator.push(
                                                //     context,
                                                //     MaterialPageRoute(
                                                //         builder: (context) =>
                                                //             const MarketCall()));
                                              },
                                              child: Card(
                                                // color: Colors.blue,
                                                child: Image.network(
                                                    '${model?.data?.image}'),
                                              ),
                                            );
                                          })),
                                ],
                              ),
                            )
                          ],
                        ),
                      )),
                ),
              )
            ]),
          ),
        ),
      );
}

class ProductShow extends StatefulWidget {
  final String? shopname;

  const ProductShow({super.key, this.shopname});

  @override
  State<ProductShow> createState() => _ProductShowState();
}

class _ProductShowState extends State<ProductShow> {
  final _scrollController = ItemScrollController();

  final itemkey = GlobalKey();
  Future scrollItem() async {
    _scrollController.scrollTo(index: 50, duration: Duration(seconds: 1));
    // final context = itemkey.currentContext!;
    // await Scrollable.ensureVisible(context,
    //     alignment: 0.5, duration: Duration(seconds: 1));
    // final context = itemkey.currentContext;
    // await scr.position.ensureVisible(
    //   itemKey.currentContext.findRenderObject()!,
    //   alignment:
    //       0.5, // How far into view the item should be scrolled (between 0 and 1).
    //   duration: const Duration(seconds: 1),
    // );
  }

  @override
  void initState() {
    // _scrollController.jumpTo(index: 12);
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50, bottom: 35),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'عروض ${widget.shopname}',
                  style: TextStyle(color: appbarTextcolor, fontSize: 18),
                )
              ],
            ),
          ),
          ScrollablePositionedList.builder(
            itemCount: 50,
            // itemCount: _listViewData.length,
            itemScrollController: _scrollController,
            reverse: true,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Container(
                height: 100,
                child: ListTile(
                  title: Text(
                    'Yo Dummy Text $index',
                    style: TextStyle(color: Colors.black),
                  ),
                  // title: AutoSizeText(_listViewData[index], maxLines: 2),
                  dense: true,
                ),
              );
            },
          ),

          // Row(
          //   children: [
          //     Column(
          //       children: [
          //         Text('aaaaaaaaaaa'),
          //       ],
          //     )
          //   ],
          // )
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          scrollItem();
          // Add your onPressed code here!
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.navigation),
      ),
    );
  }
}
