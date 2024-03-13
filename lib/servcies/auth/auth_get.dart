import 'package:chat_kide/page/home_page.dart';
import 'package:chat_kide/servcies/auth/loginRigestr.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Authgate extends StatelessWidget {
  const Authgate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        builder: (context, snapshot) {
          // user login
          if (snapshot.hasData) {
            return HomePage();
          } else {
            // user not login
            return const Loginregistr();
          }
        },
        stream: FirebaseAuth.instance.authStateChanges(),
      ),
    );
  }
}