import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:project/chat/repo/chat_provider.dart';
import 'package:project/chat/ui/screens/chat_page.dart';

import 'package:provider/provider.dart';

import '../../../common/route_argument.dart';
import 'Support_chatPage.dart';

class ChatCycle extends StatefulWidget {
  static const routeName = "/ChatCycle";

  RouteArgument argument;

  ChatCycle({required this.argument});

  @override
  State<ChatCycle> createState() => _ChatCycleState();
}

class _ChatCycleState extends State<ChatCycle> {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  late String brachId;
  String? peerName;
  String? fcmToken;
  String? image;
  String? shopname;

  List<String> data = [];

  @override
  void initState() {
    data = widget.argument.param;
    brachId = data[0];
    fcmToken = data[1];
    image = data[2];
    shopname = data[3];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<ChatProvider>(
              create: (_) => ChatProvider(
                  firebaseFirestore: firebaseFirestore,
                  firebaseStorage: firebaseStorage))
        ],
        child: ChatPage(
          peerNickname: peerName ?? "",
          branchID: brachId,
          fcmToken: fcmToken,
          image: image,
          shopname: shopname,
        ));
  }
}
