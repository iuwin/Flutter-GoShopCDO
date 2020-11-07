import 'package:flutter/material.dart';
import 'pages/loading.dart';
import 'pages/login.dart';
import 'pages/register.dart';
import 'pages/home.dart';


Route<dynamic> generateRoute(RouteSettings settings) {

  switch (settings.name) {
    case '/':
      return MaterialPageRoute(builder: (context) => LoadingScreen());
    case '/home':
      return MaterialPageRoute(builder: (context) => Home());
    case '/login':
      return MaterialPageRoute(builder: (context) => Login());
    case '/register':
      return MaterialPageRoute(builder: (context) => Register());
    default:
      return MaterialPageRoute(builder: (context) => LoadingScreen());
  }


}
