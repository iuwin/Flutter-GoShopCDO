import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void loadApp() {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/login');
    });
  }

  @override
  void initState() {
    loadApp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double _deviceWidth = MediaQuery.of(context).size.width;
    double _deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          width: _deviceWidth,
          height: _deviceHeight,
          child: Stack(
            children: [
              Positioned(
                  top: (_deviceHeight * .5) - _deviceHeight * .2,
                  left: _deviceWidth * .25,
                  child: Image.asset(
                    'assets/logo/applogo.png',
                    width: _deviceWidth * .42,
                    height: _deviceHeight * .2,
                  )),
              Center(
                  child: Container(
                margin: EdgeInsets.only(top: 60),
                child: Text(
                  'CDO',
                  style: TextStyle(
                      color: Color(0xFFB308278),
                      fontSize: 45,
                      fontWeight: FontWeight.bold),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
