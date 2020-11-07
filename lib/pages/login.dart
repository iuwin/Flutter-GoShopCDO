import 'package:flutter/material.dart';


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  bool checkBoxValue = false;
  bool newValue = false;
  bool loginTouching = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.grey[900],
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Text('Login')
      )
    );
  }
}