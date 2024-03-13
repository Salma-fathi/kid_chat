import 'package:flutter/material.dart';

class UserTilePage extends StatelessWidget {
  final String text;
  final Function()? onTap;

  const UserTilePage({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.symmetric(vertical: 5,horizontal: 26),
        decoration: BoxDecoration(
          color: Colors.blue.shade100,
          borderRadius: BorderRadius.circular(20),
        ),
        
        child: Row(
          children: [
            const Icon(Icons.person),
            const SizedBox(height: 35.0, width: 20,),
            //text
            Text(text)
          ],
        ),
        
        ),
      );
  }
}