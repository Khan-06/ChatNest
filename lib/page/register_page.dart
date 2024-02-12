import 'package:flutter/material.dart';
import '../components/my_button.dart';
import '../components/my_text_field.dart';

class RegisterPage extends StatelessWidget {
  final void Function()? onTap;
  RegisterPage({Key? key, required this.onTap}) : super(key: key);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  FocusNode confirmPasswordFocusNode = FocusNode();
  static const backgroundColor = Color.fromRGBO(204, 201, 220, 1);

  //sign in logic
  void signUp() {
    // Add your sign-in logic here
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
              SizedBox(
                height: 200.0,
                width: 200.0,
                child: Image.asset('assets/images/Chat.png'),
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
                controller: emailController,
                nextFocusNode: passwordFocusNode,
                obscureText: false,
                hintText: 'Email',
              ),
              MyTextField(
                  controller: passwordController,
                  nextFocusNode: confirmPasswordFocusNode,
                  obscureText: true,
                  hintText: 'Password'),
              MyTextField(
                  controller: confirmPasswordController,
                  nextFocusNode: null,
                  obscureText: true,
                  hintText: 'Confirm password'),
              const SizedBox(height: 20.0),
              MyButton(
                onTap: signUp,
                mytext: 'Sign Up',
              ),
              const SizedBox(height: 40.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already a member?'),
                  const SizedBox(
                    width: 5.0,
                  ),
                  GestureDetector(
                      onTap: onTap,
                      child: const Text(
                    'Log In!',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
