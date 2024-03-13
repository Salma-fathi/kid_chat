import 'package:chat_kide/component/Text_field.dart';
import 'package:chat_kide/component/bubble_chat.dart';
import 'package:chat_kide/servcies/auth/auth_servcie.dart';
import 'package:chat_kide/servcies/chat/chat_servcies.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  ChatPage({Key? key, required this.receiverEmail, required this.receiverId})
      : super(key: key);

  final String receiverEmail;
  final String receiverId;
  final TextEditingController _messageController = TextEditingController();
  final ChatServices _chatServices = ChatServices();
  final AuthService _authService = AuthService();

  // send message
  void sendMessage() async {
    if (_messageController.text.isNotEmpty) {
      await _chatServices.sendMessage(receiverId, _messageController.text);
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(receiverEmail),
      ),
      body: Column(
        children: [
          Expanded(
            child: _buildMessageList(),
          ),
          _buildUserInput()
        ],
      ),
    );
  }

  Widget _buildMessageList() {
    String senderID = _authService.getCurrentUser()!.uid;
    return StreamBuilder(
      stream: _chatServices.getMessages(receiverId, senderID),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text("Error");
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading");
        }
        return ListView(
          children:
              snapshot.data!.docs.map((doc) => _buildMessageItem(doc)).toList(),
        );
      },
    );
  }

// build item message
  Widget _buildMessageItem(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    // in current user send message
    bool isCurrentUser = data["senderID"] == _authService.getCurrentUser()!.uid;

    // align  to message the if right sender  for current user and otherwise
  var alignment = isCurrentUser ? Alignment.centerRight : Alignment.centerLeft;

    return Container(
      alignment: alignment,
      child: Column(
        crossAxisAlignment:isCurrentUser ? CrossAxisAlignment.start : CrossAxisAlignment.end,
        children: [
          BubbleChat(message: data["message"], isCurrentUser: isCurrentUser)
        ],
      ),
    );
  }

  Widget _buildUserInput() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 45.0),
      child: Row(
        children: [
          Expanded(
            child: TextFielded(
              hintText: "Type a message",
              obscureText: false,
              controller: _messageController,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.blue.shade200,
              shape: BoxShape.circle            ),
              margin: const EdgeInsets.only(right: 25)

            ,child: IconButton(onPressed: sendMessage,
            icon: const Icon(Icons.arrow_upward,color: Colors.white,))),
        ],
      ),
    );
  }
}
