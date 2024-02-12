import 'package:flutter/material.dart';
import 'package:messenger/services/auth/LogIn_or_register.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home:  LogInOrRegister(),
    );
  }
}