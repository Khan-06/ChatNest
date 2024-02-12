import 'package:flutter/material.dart';

import '../../page/login_page.dart';
import '../../page/register_page.dart';

class LogInOrRegister extends StatefulWidget {
  const LogInOrRegister({Key? key}) : super(key: key);

  @override
  State<LogInOrRegister> createState() => _LogInOrRegisterState();
}

class _LogInOrRegisterState extends State<LogInOrRegister> {

  bool isLoginPage = true;
  void togglePages() {
    setState(() {
      isLoginPage = !isLoginPage;
    });
  }
  @override
  Widget build(BuildContext context) {
    return isLoginPage ? LogInPage(onTap: togglePages) : RegisterPage(onTap: togglePages);
  }
}
