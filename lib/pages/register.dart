import 'package:flutter/material.dart';


class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( //Initial for return in login page
        title: Text('Register'),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
      ),
      body: Container(
        child: Text('Register '),
        )
    );
  }
}