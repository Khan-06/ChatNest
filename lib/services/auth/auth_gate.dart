import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../page/homePage.dart';
import './logIn_or_register.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(stream: FirebaseAuth.instance.authStateChanges(), builder: (context, snapshot) {
        //user is loggedIn
        if(snapshot.hasData){
          return const HomePage();
        }
        // user is not loggedIn
        else{
          return const LogInOrRegister();
        }
      },),
    );
  }
}
