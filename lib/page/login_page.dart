import 'package:flutter/material.dart';

import '../servcies/auth/auth_servcie.dart';
import '../component/Buttom.dart';
import '../component/Text_field.dart';


class Login_Page extends StatefulWidget {
  const Login_Page({Key? key, required this.onTap}) : super(key: key);

  final void Function()? onTap;

  @override
  State<Login_Page> createState() => _Login_PageState();
}

class _Login_PageState extends State<Login_Page> {
  // bool _isPasswordHidden = true;

  // Controllers for handling user input
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void login(BuildContext context) async {
    final authService = AuthService();
    // Login try
    try {
      await authService.signInWithEmailPassword(
          _emailController.text, _passwordController.text);
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(e.toString()),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.network(
              'https://media.istockphoto.com/id/1284883479/vector/virtual-communication-concept-young-people-online-chat-vector-illustration-boy-girl.jpg?s=1024x1024&w=is&k=20&c=18Jd41ZhRMPwBGrNw4Fw9WULexkLeU54hQf_HHEdcDM=',
              fit: BoxFit.scaleDown,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    "Welcome to kide",
                    style: TextStyle(fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(height: 250),
                  TextFielded(
                    hintText: "Email",
                    obscureText: false,
                    controller: _emailController,
                  ),
                  const SizedBox(height: 10),
                  TextFielded(
                    hintText: "Password",
                    obscureText: false,
                    controller: _passwordController,
                    
                  ),
                  const SizedBox(height: 25),
                  Button(text: 'Login', onTap: () => login(context)),
                  const SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Not a member?"),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: const Text(
                          ' Register now',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}