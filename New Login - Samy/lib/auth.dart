import 'package:flutter/material.dart';
import 'package:new_login/signup.dart';

import 'package:new_login/login_screen.dart';

class Auth extends StatefulWidget {
  const Auth({Key? key}) : super(key: key);

  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  int index = 1;
  final Screens = [
    LoginScreen(),
    Signup(),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: index,
        children: Screens,
      ),
    );
  }
}
