import 'package:cloud_firestore/cloud_firestore.dart';

import '../constants/firestore_constants.dart';

class ChatMessages {
  String idFrom;
  String idTo;
  String timestamp;
  String content;
  int type;

  ChatMessages(
      {required this.idFrom,
      required this.idTo,
      required this.timestamp,
      required this.content,
      required this.type});

  Map<String, dynamic> toJson() {
    return {
      FirestoreConstants.idFrom: idFrom,
      FirestoreConstants.idTo: idTo,
      FirestoreConstants.timestamp: timestamp,
      FirestoreConstants.content: content,
      FirestoreConstants.type: type,
    };
  }

  factory ChatMessages.fromDocument(DocumentSnapshot documentSnapshot) {
    String idFrom = documentSnapshot.get(FirestoreConstants.idFrom);
    String idTo = documentSnapshot.get(FirestoreConstants.idTo);
    String timestamp = documentSnapshot.get(FirestoreConstants.timestamp);
    String content = documentSnapshot.get(FirestoreConstants.content);
    int type = documentSnapshot.get(FirestoreConstants.type);

    return ChatMessages(
        idFrom: idFrom,
        idTo: idTo,
        timestamp: timestamp,
        content: content,
        type: type);
  }
}

class SupportChatMessages {
  bool fromadmin;
  String message;
  String time;
  String orderId;

  String userid;
  int type;

  SupportChatMessages(
      {required this.fromadmin,
      required this.message,
      required this.time,
      required this.orderId,
      required this.userid,
      required this.type});

  Map<String, dynamic> toJson() {
    return {
      'from_admin': fromadmin,
      'message': message,
      'time': time,
      'user_id': userid,
      'type': type,
      'orderId': orderId,
    };
  }

  factory SupportChatMessages.fromDocument(DocumentSnapshot documentSnapshot) {
    bool fromadmin = documentSnapshot.get(true);
    String message = documentSnapshot.get('message');
    String time = documentSnapshot.get('time');
    String userid = documentSnapshot.get('user_id');
    int type = documentSnapshot.get('type');
    String orderId = documentSnapshot.get('orderId');

    return SupportChatMessages(
        fromadmin: fromadmin,
        message: message,
        time: time,
        userid: userid,
        orderId: orderId,
        type: type);
  }
}
