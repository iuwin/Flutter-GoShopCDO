import 'package:flutter/material.dart';
import 'router.dart' as router;
import 'pages/loading.dart';
import 'pages/login.dart';
import 'pages/register.dart';
import 'pages/home.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  theme: ThemeData(fontFamily: 'Nunito'),

  initialRoute: '/login',  //initial sa kay wapay loading screen
  onGenerateRoute: router.generateRoute,

  // routes: {
  //   '/' :  (context) => LoadingScreen(),
  //   '/home' : (context) => Home(),
  //   '/login' : (context) => Login(),
  //   '/register' : (context) => Register(),

  // },
));



