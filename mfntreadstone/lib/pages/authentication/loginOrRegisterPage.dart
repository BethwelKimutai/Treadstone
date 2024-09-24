import 'package:flutter/material.dart';
import 'package:mfntreadstone/pages/authentication/loginPage.dart';
import 'package:mfntreadstone/pages/authentication/registerPage.dart';


class LoginOrRegisterPage extends StatefulWidget {
  const LoginOrRegisterPage({super.key});

  @override
  State<LoginOrRegisterPage> createState() => _LoginOrRegisterPageState();
}

class _LoginOrRegisterPageState extends State<LoginOrRegisterPage> {
  //initially show the login page
  bool showLoginPage = true;

  //toggle between the login and register page
  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }
  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return Loginpage(
        onTap: togglePages,
        );
    }else {
      return RegisterPage(
        onTap: togglePages,
        );
    }
  }
}