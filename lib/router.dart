import 'package:flutter/material.dart';
import 'package:sampleflutter/pages/search_result.dart';
import 'package:sampleflutter/pages/search_screen.dart';
import 'pages/loading.dart';
import 'pages/login.dart';
import 'pages/register.dart';
import 'pages/home.dart';
import 'pages/home2.dart';
import 'pages/view_product.dart';
import 'pages/bag.dart';

Route<dynamic> generateRoute(RouteSettings settings) {

  final args = settings.arguments;

  switch (settings.name) {
    case '/':
      return MaterialPageRoute(builder: (context) => LoadingScreen());
    case '/home':
      return MaterialPageRoute(builder: (context) => Home2());
    case '/login':
      return MaterialPageRoute(builder: (context) => Login());
    case '/register':
      return MaterialPageRoute(builder: (context) => Register());
    case '/viewproduct':
      return MaterialPageRoute(builder: (context) => ProductView(productDetails: args));
    case '/bag':
      return MaterialPageRoute(builder: (context) => Bag());
    case '/search':
      return MaterialPageRoute(
          builder: (context) =>
              Search()); 
    case '/searchresult':
      return MaterialPageRoute(
          builder: (context) =>
              SearchResult()); 
    default:
      return MaterialPageRoute(builder: (context) => LoadingScreen());
  }
}
