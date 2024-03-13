import 'package:chat_kide/component/Drawer.dart';
import 'package:chat_kide/component/User_Tile.dart';
import 'package:chat_kide/servcies/auth/auth_servcie.dart';
import 'package:chat_kide/servcies/chat/chat_servcies.dart';
import 'package:flutter/material.dart';
import 'chat_page.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final AuthService _auth = AuthService();
  final ChatServices _chatServices = ChatServices();
  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("kide"),
      ),
      drawer: const Drawers(),
      body: _buildUserList(),
    );
  }

  Widget _buildUserList() {
    return StreamBuilder<List<Map<String, dynamic>>>(
      stream: _chatServices.getUserStream(),
      builder: (context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
        if (snapshot.hasError) {
          return Text("Error: ${snapshot.error}");
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading");
        }
        if (snapshot.data == null || snapshot.data!.isEmpty) {
          return const Text("No users found");
        }
        return ListView(
          children: snapshot.data!
              .map<Widget>((userData) => _buildUserListItem(userData, context))
              .toList(),
        );
      },
    );
  }
// build individul list tile for user
  Widget _buildUserListItem(
      Map<String, dynamic> userData, BuildContext context) {

        // display   all user accept  current user

    if (userData["email"]!= _auth.getCurrentUser()!.email) {
      return UserTilePage(
        text: userData["email"],
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatPage(
                receiverEmail: userData["email"],
                receiverId: userData["uid"],
              ),
            ),
          );
        },
      );
    } else {
      return Container();
    }
  }
}

