import 'package:chat_kide/page/register_page.dart';
import 'package:flutter/material.dart';
import '../../page/login_page.dart';


class Loginregistr extends StatefulWidget {
  const Loginregistr({Key? key}) : super(key: key);

  @override
  State<Loginregistr> createState() => _LoginregestrState();
}

class _LoginregestrState extends State<Loginregistr> {
  // initially show page
  bool showLoginpage = true;

  //toggle between login and register
  void toggleShowpage() {
    setState(() {
      showLoginpage = !showLoginpage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(showLoginpage){
      return  Login_Page(onTap: toggleShowpage,);
    }else {
      return  RegisterPage(onTap: toggleShowpage,);
    }
  }
}