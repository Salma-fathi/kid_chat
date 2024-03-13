import 'package:flutter/material.dart';

import '../servcies/auth/auth_servcie.dart';
import '../component/Buttom.dart';
import '../component/Text_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key, required this.onTap}) : super(key: key);
  final void Function()? onTap;

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmController = TextEditingController();

  void register(BuildContext context) {
    final _auth = AuthService();

    if (_passwordController.text == _confirmController.text) {
      try {
        _auth.createUserWithEmailAndPassword(
        _emailController.text,
        _passwordController.text);
      } catch (e) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text(e.toString()),
                ));
      }
    } else {
      showDialog(
          context: context,
          builder: (context) => const AlertDialog(
                title: Text("The password don`t match!"),
              ));
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
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Let`s create an account for you ",
                    style: TextStyle(fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(height: 200),
                  TextFielded(
                    hintText: "Email",
                    obscureText: false,
                    controller: _emailController,
                  ),
                  const SizedBox(height: 16),
                  TextFielded(
                    hintText: "Password",
                    obscureText: true,
                    controller: _passwordController,
                  ),
                  const SizedBox(height: 16),
                  TextFielded(
                    hintText: " Confirm Password",
                    obscureText: true,
                    controller: _confirmController,
                  ),
                  const SizedBox(height: 32),
                  Button(
                    text: 'Register',
                    onTap: () => register(context),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already have an account "),
                      GestureDetector(
                        onTap: widget
                            .onTap, // Use widget.onTap to access the onTap from the parent widget
                        child: const Text(
                          'login now',
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
