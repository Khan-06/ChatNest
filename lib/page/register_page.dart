import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/my_button.dart';
import '../components/my_text_field.dart';
import '../services/auth/auth_services.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;
  RegisterPage({Key? key, required this.onTap}) : super(key: key);

  static const backgroundColor = Color.fromRGBO(204, 201, 220, 1);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  FocusNode confirmPasswordFocusNode = FocusNode();

  //sign in logic
  void signUp() async {
    // Add your sign-in logic here
    if(passwordController.text != confirmPasswordController.text){
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Password do not match!'),),);
      return;
    } else {
      final authService = Provider.of<AuthService>(context, listen: false);
      try{
        await authService.signOutWithEmailAndPassword(emailController.text, passwordController.text);
      } catch(e){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: RegisterPage.backgroundColor,
      appBar: AppBar(backgroundColor: RegisterPage.backgroundColor),
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
                      onTap: widget.onTap,
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
