import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:project/Shared/constant.dart';

import '../constants/firestore_constants.dart';
import '../model/chat_messages.dart';

class ChatProvider {
  final FirebaseFirestore firebaseFirestore;
  final FirebaseStorage firebaseStorage;

  ChatProvider(
      {required this.firebaseFirestore, required this.firebaseStorage});

  UploadTask uploadImageFile(File image, String filename) {
    Reference reference = firebaseStorage.ref().child(filename);
    UploadTask uploadTask = reference.putFile(image);
    return uploadTask;
  }

  Future<void> updateFirestoreData(
      String collectionPath, String docPath, Map<String, dynamic> dataUpdate) {
    return firebaseFirestore
        .collection(collectionPath)
        .doc(docPath)
        .update(dataUpdate);
  }

  Stream<QuerySnapshot> getChatMessage(String groupChatId, int limit) {
    return firebaseFirestore
        .collection(FirestoreConstants.pathMessageCollection)
        .doc(groupChatId)
        .collection(groupChatId)
        .orderBy(FirestoreConstants.timestamp, descending: true)
        .limit(limit)
        .snapshots();
  }

  Stream<QuerySnapshot> call() {
    return firebaseFirestore
        // .collection(FirestoreConstants.call)
        // .doc('SVkAJslHcclE6Ry24c5b')
        // .collection('SVkAJslHcclE6Ry24c5b')
        // // .orderBy(FirestoreConstants.timestamp, descending: true)
        // // .limit(limit)
        // .snapshots();
        .collection(FirestoreConstants.call)
        .snapshots();
    // .where('from_admin', isEqualTo: false)

    // .doc(groupChatId)
    // .collection(groupChatId)
    // .orderBy('time', descending: true)
    //     descending: true)
    // .limit(limit)
  }

  Stream<QuerySnapshot> invoice() {
    return firebaseFirestore
        // .collection(FirestoreConstants.call)
        // .doc('SVkAJslHcclE6Ry24c5b')
        // .collection('SVkAJslHcclE6Ry24c5b')
        // // .orderBy(FirestoreConstants.timestamp, descending: true)
        // // .limit(limit)
        // .snapshots();
        .collection(FirestoreConstants.invoices)
        .snapshots();
    // .where('from_admin', isEqualTo: false)

    // .doc(groupChatId)
    // .collection(groupChatId)
    // .orderBy('time', descending: true)
    //     descending: true)
    // .limit(limit)
  }

  Stream<QuerySnapshot> getsupportChatMessage(int limit) {
    return firebaseFirestore
        .collection(FirestoreConstants.pathsupportMessageCollection)
        // .where('from_admin', isEqualTo: false)

        // .doc(groupChatId)
        // .collection(groupChatId)
        .orderBy('time', descending: true)
        //     descending: true)
        // .limit(limit)
        .snapshots();
  }

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void sendChatMessage(String content, int type, String groupChatId,
      String currentUserId, String peerId, String peerName, String? fcmToken) {
    DocumentReference documentReference = firebaseFirestore
        .collection(FirestoreConstants.pathMessageCollection)
        .doc(groupChatId)
        .collection(groupChatId)
        .doc(DateTime.now().millisecondsSinceEpoch.toString());
    ChatMessages chatMessages = ChatMessages(
        idFrom: currentUserId,
        idTo: peerId,
        timestamp: DateTime.now().millisecondsSinceEpoch.toString(),
        content: content,
        type: type);

    FirebaseFirestore.instance.runTransaction((transaction) async {
      transaction.set(documentReference, chatMessages.toJson());
      if (fcmToken != null) {
        sendFcmMessage(
            peerId: peerId, fcmToken: fcmToken, title: peerName, body: content);
      }
    });
  }

  void sendSupportChatMessage(
    String content,
    String currentUserId,
    String peerId,
    String peerName,
    String? fcmToken,
    String orderid,
    int type,
  ) {
    DocumentReference documentReference = firebaseFirestore
        .collection(FirestoreConstants.pathsupportMessageCollection)
        .doc(DateTime.now().millisecondsSinceEpoch.toString());
    // .collection(groupChatId)
    // .doc(DateTime.now().millisecondsSinceEpoch.toString());
    SupportChatMessages chatMessages = SupportChatMessages(
        fromadmin: false,
        message: content,
        time: DateTime.now().millisecondsSinceEpoch.toString(),
        userid: currentUserId,
        type: type,
        orderId: orderid);

    FirebaseFirestore.instance.runTransaction((transaction) async {
      transaction.set(documentReference, chatMessages.toJson());
      if (fcmToken != null) {
        sendFcmMessage(
            peerId: peerId, fcmToken: fcmToken, title: peerName, body: content);
      }
    });
  }

  Future<void> sendFcmMessage(
      {required String peerId,
      required String fcmToken,
      required String title,
      required String body}) async {
    Map map = {
      "to": fcmToken,
      "notification": {
        "body": body,
        "title": title,
        "android_channel_id": "com.blue_code.biflora"
      },
      "android": {"priority": "max"},
      "data": {
        "click_action": "FLUTTER_NOTIFICATION_CLICK",
        "notification_foreground": "true",
        "notification_android_sound": "default",
        "id": userId
      }
    };
    Dio dio = Dio();
    dio.options.headers["Authorization"] =
        FirestoreConstants.Firebase_SERVER_KEY;
    dio.options.headers["Accept"] = "application/json";

    await dio.post('https://fcm.googleapis.com/fcm/send', data: map);
    log('done');
  }
}

class MessageType {
  static const text = 0;
  static const image = 1;
  static const sticker = 2;
  static const fromuser = false;
  static const fromadmin = true;
}
