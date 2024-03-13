import 'package:chat_kide/models/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatServices {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Get user stream
  Stream<List<Map<String, dynamic>>> getUserStream() {
    return _firestore.collection("Users").snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        final user = doc.data();
        return user;
      }).toList();
    });
  }

  Future<void> sendMessage(String receivedID, String message) async {
    final String currentUserId = _auth.currentUser!.uid;
    final String currentUserEmail = _auth.currentUser!.email!;
    final Timestamp timestamp = Timestamp.now();
    Message newMessage = Message(
      senderID: currentUserId,
      senderEmail: currentUserEmail,
      receivedID: receivedID,
      message: message,
      timestamp: timestamp,
    );

    // Construct chat room ID for user two (unique store ensure)
    List<String> ids = [currentUserId, receivedID];
    ids.sort();
    String chatRoomID =ids.join('_');
      // Add new message to the Firestore database
    await _firestore
        .collection("chatroom's")
        .doc(chatRoomID)
        .collection("message")
        .add(newMessage.toMap());
  }

  Stream<QuerySnapshot> getMessages(String userID, String otherUserID) {
    List<String> ids = [userID, otherUserID];
    ids.sort();
    String chatRoomID = ids.join('_');

    return _firestore
        .collection("chatroom's")
        .doc(chatRoomID)
        .collection("message")
        .orderBy("timestamp", descending: false)
        .snapshots();
  }
}
