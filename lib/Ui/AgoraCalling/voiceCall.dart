// import 'dart:ffi';

// import 'package:agora_rtc_engine/rtc_engine.dart';
import 'dart:developer';
import 'dart:ui';

import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:project/network/remote/Dio_helper.dart';
import 'package:project/widgets/appBrain.dart';
import 'package:agora_rtc_engine/rtc_local_view.dart' as RtcLocalView;
import 'package:agora_rtc_engine/rtc_remote_view.dart' as RtcRemoteView;
import 'package:agora_rtm/agora_rtm.dart';

import 'dart:math' as math;

import '../../Shared/constant.dart';
import '../../components/component.dart';

final String localUserID = math.Random().nextInt(10000).toString();

class MarketCall extends StatefulWidget {
  final String? image;
  final String agoraToken;
  final String channelName;

  MarketCall({this.image, required this.agoraToken, required this.channelName});

  @override
  State<MarketCall> createState() => _MarketCallState();
}

class _MarketCallState extends State<MarketCall> {
  late int remoteUid = 0;
  int ddd = 0;

  late RtcEngine _engine;
  bool muted = false;
  @override
  void initState() {
    // TODO: implement initState
    initAgora();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _engine.leaveChannel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: ClipRRect(
              child: ImageFiltered(
                imageFilter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Image.network(
                  '${widget.image}',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: InkWell(
            onTap: () {
              setState(() {
                //   if (index == null) {
                // index = 1;
                //    }
              });
            },
            child: Container(
              child: CircleAvatar(
                radius: 100,
                backgroundImage: NetworkImage(
                  '${widget.image}',
                ),
              ),
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  child: Container(
                    height: 42,
                    width: 42,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100)),
                    child: IconButton(
                      icon: Icon(
                        muted ? Icons.mic_off : Icons.mic,
                        color: button1color,
                      ),
                      onPressed: () {
                        setState(() {
                          muted = !muted;
                        });
                        _engine.muteLocalAudioStream(muted);
                      },
                    ),
                  ),
                ),
              ],
            ),
            Stack(
              children: [
                // index == 0
                // ?
                Container(
                  decoration: const BoxDecoration(
                      color: button1color,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25))),
                  width: MediaQuery.of(context).size.width,
                  // height: 180.0,

                  alignment: Alignment.center, // where to position the child
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // index == 0
                      // ?
                      // Container(
                      //   decoration: const BoxDecoration(
                      //       color: Colors.white,
                      //       borderRadius: BorderRadius.only(
                      //           topLeft: Radius.circular(25),
                      //           topRight: Radius.circular(25))),
                      //   width: MediaQuery.of(context).size.width,
                      //   height: 99.0,
                      //   child: Row(
                      //       mainAxisAlignment: MainAxisAlignment.center,
                      //       children: [
                      //         Text(
                      //           'في انتظار تفاصيل الفاتوره',
                      //           style: TextStyle(
                      //               color: button1color,
                      //               fontSize: 16,
                      //               fontWeight: FontWeight.w500),
                      //         )
                      //       ]),
                      // )
                    ],
                  ),
                ),
                // : index == 1
                //     ? Container(
                //         decoration: const BoxDecoration(
                //             color: button1color,
                //             borderRadius: BorderRadius.only(
                //                 topLeft: Radius.circular(25),
                //                 topRight: Radius.circular(25))),
                //         width: MediaQuery.of(context).size.width,
                //         height: 350.0,

                //         alignment:
                //             Alignment.center, // where to position the child
                //         child: Column(
                //           mainAxisAlignment: MainAxisAlignment.end,
                //           children: [
                //             Container(
                //               decoration: const BoxDecoration(
                //                   color: Colors.white,
                //                   borderRadius: BorderRadius.only(
                //                       topLeft: Radius.circular(25),
                //                       topRight: Radius.circular(25))),
                //               width: MediaQuery.of(context).size.width,
                //               height: 267.0,
                //               child: Column(children: [
                //                 Padding(
                //                   padding: const EdgeInsets.only(
                //                       top: 20, left: 20, right: 20),
                //                   child: Container(
                //                     width:
                //                         MediaQuery.of(context).size.width,
                //                     decoration: BoxDecoration(
                //                         border:
                //                             Border.all(color: border2Color),
                //                         borderRadius:
                //                             BorderRadius.circular(10)),
                //                     child: Center(
                //                       child: Padding(
                //                         padding: const EdgeInsets.symmetric(
                //                             horizontal: 14, vertical: 15),
                //                         child: Row(
                //                           children: [
                //                             Image.asset(
                //                                 'assets/images/focus (1).png'),
                //                             Spacer(),
                //                             Text('تفاصيل الفاتورة',
                //                                 style: TextStyle(
                //                                   color: appbarTextcolor,
                //                                   fontSize: 14,
                //                                 )),
                //                             SizedBox(
                //                               width: 12,
                //                             ),
                //                             Container(
                //                               height: 46,
                //                               width: 46,
                //                               decoration: BoxDecoration(
                //                                 color: circleColor,
                //                                 shape: BoxShape.circle,
                //                               ),
                //                               child: Image.asset(
                //                                   'assets/images/invoice-_1_.png'),
                //                             ),
                //                           ],
                //                         ),
                //                       ),
                //                     ),
                //                   ),
                // ),
                //   Padding(
                //     padding: const EdgeInsets.only(
                //         top: 14, right: 20, left: 20),
                //     child: Container(
                //       width:
                //           MediaQuery.of(context).size.width,
                //       decoration: BoxDecoration(
                //           border:
                //               Border.all(color: border2Color),
                //           borderRadius:
                //               BorderRadius.circular(10)),
                //       child: Center(
                //         child: Padding(
                //           padding: const EdgeInsets.symmetric(
                //               horizontal: 14, vertical: 15),
                //           child: Row(
                //             children: [
                //               Text('30.90 ر.س',
                //                   style: TextStyle(
                //                     color: button1color,
                //                     fontSize: 16,
                //                   )),
                //               Spacer(),
                //               Text('الاجمالي',
                //                   style: TextStyle(
                //                     color: appbarTextcolor,
                //                     fontSize: 14,
                //                   )),
                //               // SizedBox(
                //               //   width: 12,
                //               // ),
                //               // Container(
                //               //   height: 46,
                //               //   width: 46,
                //               //   decoration: BoxDecoration(
                //               //     color: circleColor,
                //               //     shape: BoxShape.circle,
                //               //   ),
                //               //   child: Image.asset(
                //               //       'assets/images/invoice-_1_.png'),
                //               // ),
                //             ],
                //           ),
                //         ),
                //       ),
                //     ),
                //   ),
                //   Padding(
                //     padding: const EdgeInsets.symmetric(
                //         vertical: 16),
                //     child: Row(
                //       mainAxisAlignment:
                //           MainAxisAlignment.center,
                //       children: [
                //         Container(
                //           height: 56,
                //           width: 159,
                //           decoration: BoxDecoration(
                //               borderRadius:
                //                   BorderRadius.circular(16),
                //               color: greenAcceptcolor),
                //           child: Center(
                //             child: Text(
                //               "قبول",
                //               style: TextStyle(
                //                   fontSize: 16,
                //                   color: Colors.white),
                //             ),
                //           ),
                //         ),
                //         SizedBox(
                //           width: 17,
                //         ),
                //         Container(
                //           height: 56,
                //           width: 159,
                //           decoration: BoxDecoration(
                //               borderRadius:
                //                   BorderRadius.circular(16),
                //               color: redRefusedcolor),
                //           child: Center(
                //             child: Text(
                //               "رفص",
                //               style: TextStyle(
                //                   fontSize: 16,
                //                   color: Colors.white),
                //             ),
                //           ),
                //         )
                //       ],
                //     ),
                //   )
                // ]),
                // )
                //       ],
                //     ),
                //   )
                // : Container(),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 42,
                          width: 42,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Icon(
                            Icons.chat,
                            color: button1color,
                          ),
                        ),
                        Container(
                            // height: 42,
                            // width: 42,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                                child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 14, vertical: 7),
                              child: Text(
                                "24:50",
                                style: TextStyle(color: button1color),
                              ),
                            ))),
                        Container(
                          height: 45,
                          width: 45,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: cancelButtonColor,
                          ),
                          child: IconButton(
                            icon: Icon(Icons.call_end, color: Colors.white),
                            onPressed: () {
                              Navigator.of(context).pop(true);
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ],
    ));
  }

////  functons

  Future<void> initAgora() async {
    await [
      Permission.microphone,
    ].request();
    _engine = await RtcEngine.create(AgoraManager.appId);
    _engine.enableAudio();
    _engine.setEventHandler(RtcEngineEventHandler(
      joinChannelSuccess: ((String channel, int uid, int elapsed) {
        print('local user $uid jonined succeffly');
      }),
      userJoined: (int uid, int elapsed) {
        print('local user $uid jonined succeffly');
        showSnackBar(

            // title: langKey == 'ar'
            // ?
            title: "The phone number you entered is incorrect"
            // : "The phone number you entered is incorrect");
            // print("error");
            );
        setState(() {
          remoteUid = uid;
        });
      },
      userOffline: (int uid, UserOfflineReason reason) {
        print('local user $uid left call');
        setState(() {
          remoteUid = 0;
        });
        Navigator.pop(context);
      },
      error: (err) {
        log(err.toString());
      },
      tokenPrivilegeWillExpire: (token) async {
        //  await getToken();
        await _engine.renewToken(token);
      },
    ));

    await _engine.joinChannel(widget.agoraToken, widget.channelName, null, 0);
  }

  Widget _renderLocalPreview() {
    return const RtcLocalView.SurfaceView();
  }

  Widget _renderRemoteAudio() {
    if (remoteUid != 0) {
      return RtcRemoteView.SurfaceView(
        uid: remoteUid,
        channelId: '',
      );
    } else {
      return Text(
        'calling...',
        textAlign: TextAlign.center,
      );
    }
  }
//   Future<void> getToken() async {
//    final response = await DioHelper.getdata(
//     url: '/rtc/tfdhgdsfah/78367862/',
//     //  Uri.parse(baseUrl + '/rtc/' + widget.channelName + '/publisher/uid/' + uid.toString()
//     //       // To add expiry time uncomment the below given line with the time in seconds
//     //       // + '?expiry=45'

//     );

//     if (response.statusCode == 200) {
//       setState(() {
//         token = response.body;
//         token = jsonDecode(token)['rtcToken'];
//       });
//     } else {
//       print('Failed to fetch the token');
//     }
//  }
}
