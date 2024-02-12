import 'package:flutter/material.dart';

import '../components/my_text_field.dart';
import '../components/my_button.dart';

class LogInPage extends StatefulWidget {
  final void Function()? onTap;
  const LogInPage({super.key, required this.onTap});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  FocusNode passwordFocusNode = FocusNode();
  static const backgroundColor = Color.fromRGBO(204, 201, 220, 1);


  //logIn logic
  void logIn() {
    // Add your log-in logic here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(backgroundColor: backgroundColor),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 200.0,
                    width: 200.0,
                    child: Image.asset('assets/images/Chat.png'),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              const Text(
                "Welcome back you've been missed!",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w200,
                ),
              ),
              const SizedBox(height: 20.0),
              MyTextField(
                nextFocusNode: passwordFocusNode,
                controller: emailController,
                obscureText: false,
                hintText: 'Email',
              ),
              MyTextField(
                nextFocusNode: null,
                  controller: passwordController,
                  obscureText: true,
                  hintText: 'Password'),
              const SizedBox(height: 20.0),
              MyButton(
                onTap: logIn,
                mytext: 'Sign In',
              ),
              const SizedBox(height: 40.0),
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Not a member?'),
                  const SizedBox(
                    width: 5.0,
                  ),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: const Text(
                      'Register Now!',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
