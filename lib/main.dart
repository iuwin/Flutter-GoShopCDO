import 'package:flutter/material.dart';
import 'pages/loading.dart';
import 'pages/login.dart';
import 'pages/register.dart';
import 'pages/home.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  theme: ThemeData(fontFamily: 'Nunito'),

  initialRoute: '/login',  //initial sa kay wapay loading screen
  routes: {

    '/' :  (context) => LoadingScreen(),
    '/home' : (context) => Home(),
    '/login' : (context) => Login(),
    '/register' : (context) => Register(),

  },
));



