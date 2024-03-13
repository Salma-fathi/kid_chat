import 'package:flutter/material.dart';

class BubbleChat extends StatelessWidget {
  const BubbleChat({super.key,
  required this.message,
  required this.isCurrentUser});
  final String message;
  final bool isCurrentUser;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      margin: const EdgeInsets.symmetric(vertical: 5,horizontal:25 ),
      child: Text(message,style: const TextStyle(color: Colors.black),),
      decoration: BoxDecoration(color: isCurrentUser? Colors.blue.shade200 :Colors.blue.shade300,
      borderRadius: BorderRadius.circular(15)),
    );
  }
}
