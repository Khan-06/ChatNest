import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {

  final void Function() onTap;
  final String mytext;
  const MyButton({super.key, required this.onTap, required this.mytext});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: const Color(0xFF000000),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Center(
          child: Text(
            mytext,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
