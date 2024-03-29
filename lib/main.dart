import 'package:flutter/material.dart';
import 'package:messenger/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:messenger/services/auth/auth_services.dart';
import 'package:provider/provider.dart';
import './services/auth/auth_gate.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(ChangeNotifierProvider(
    create: (context) => AuthService(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: AuthGate(),
    );
  }
}
