// import 'dart:ffi';

// import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:project/widgets/appBrain.dart';
import 'package:agora_rtc_engine/rtc_local_view.dart' as RtcLocalView;
import 'package:agora_rtc_engine/rtc_remote_view.dart' as RtcRemoteView;

import 'dart:math' as math;

final String localUserID = math.Random().nextInt(10000).toString();

class VedioCall extends StatefulWidget {
  const VedioCall({super.key});

  @override
  State<VedioCall> createState() => _VedioCallState();
}

class _VedioCallState extends State<VedioCall> {
  late int remoteUid = 0;
  late RtcEngine _engine;
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
          Center(
            child: _renderRemoteVideo(),
          ),
          SafeArea(
              child: Align(
            alignment: Alignment.bottomLeft,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(150),
              child: Container(
                height: 150,
                width: 150,
                child: _renderLocalPreview(),
              ),
            ),
          )),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 25.0, right: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pop(true);
                      },
                      icon: Icon(
                        Icons.call_end,
                        size: 44,
                        color: Colors.redAccent,
                      ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

////  functons

  Future<void> initAgora() async {
    await [Permission.microphone, Permission.camera].request();
    _engine = await RtcEngine.create(AgoraManager.appId);
    _engine.enableVideo();
    _engine.setEventHandler(RtcEngineEventHandler(
        joinChannelSuccess: ((String channel, int uid, int elapsed) {
      print('local user $uid jonined succeffly');
    }), userJoined: (int uid, int elapsed) {
      print('local user $uid jonined succeffly');
      setState(() {
        remoteUid = uid;
      });
    }, userOffline: (int uid, UserOfflineReason reason) {
      print('local user $uid left call');
      setState(() {
        remoteUid = 0;
      });
      Navigator.pop(context);
    }));
    await _engine.joinChannel(
        AgoraManager.token, AgoraManager.channelName, null, 0);
  }

  Widget _renderLocalPreview() {
    return const RtcLocalView.SurfaceView();
  }

  Widget _renderRemoteVideo() {
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
}
