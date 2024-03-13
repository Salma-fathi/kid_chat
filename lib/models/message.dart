import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final String senderID;
  final String senderEmail;
  final String receivedID;
  final String message;
  final Timestamp timestamp;

  Message(
      {required this.senderID,
      required this.senderEmail,
      required this.receivedID,
      required this.message,
      required this.timestamp});
  Map<String, dynamic> toMap() {
    return {
    'senderID'   :senderID,
    'senderEmail':senderEmail,
    'receivedID' : receivedID,
    'message'    :message,
    'timestamp'  : timestamp

    };
  }
}
