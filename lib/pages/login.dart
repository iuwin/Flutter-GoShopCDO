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
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.fromLTRB(30.0, 100.0,  30.0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /*****LOGIN HEADER*****/
              Container(
                margin: EdgeInsets.only(
                  bottom: 50.0
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    SizedBox(height: 20.0,),
                    Text(
                      'Welcome to GoShop CDO!',
                      style: TextStyle(
                        color: Colors.grey[500]
                      )
                    )
                  ],
                ),
              ),

              /*****INPUT FIELDS*****/
              Container(
                margin: EdgeInsets.only(
                  bottom: 35.0
                ),
                child: Column(
                  children: [
                    Theme(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Email',
                          prefixIcon: Icon(Icons.email),
                          border: new OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0)
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black, width: 1.0),
                            borderRadius: BorderRadius.circular(25.0)
                          )
                        ),
                      ),
                      data: Theme.of(context).copyWith(
                        primaryColor: Color(0xFFB296961)
                      ),
                    ),
                    SizedBox(height: 30.0,),
                    Theme(
                      child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          prefixIcon: Icon(Icons.lock),
                          border: new OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0)
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black, width: 1.0),
                            borderRadius: BorderRadius.circular(25.0)
                          )
                        ),
                      ),
                      data: Theme.of(context).copyWith(
                        primaryColor: Color(0xFFB296961)
                      ),
                    )
                  ],
                )
              ),

              /*****LOGIN BUTTON SECTION*****/
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('Forgot Password?'),
                    SizedBox(height: 35.0,),
                    GestureDetector( 
                      onTap: () {
                        Navigator.pushNamed(context, '/home');
                      },
                      child: Listener(
                        child: Container(
                          padding: EdgeInsets.fromLTRB(127.0, 20.0, 127.0, 20.0),
                          decoration: BoxDecoration(
                            color: loginTouching == true ? Color(0xFFB308278) : Color(0xFFB296961),
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          child: Text(
                              'Login',
                              style: TextStyle(
                                color: Colors.white,
                                letterSpacing: 1.2,
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                        ),
                        onPointerDown: (event) => setState((){
                          loginTouching = true;
                        }),
                        onPointerUp: (event) => setState((){
                          loginTouching = false;
                        }),
                      ),
                    ),
                    /*SizedBox(height: 10.0,),
                    CheckboxListTile(
                      contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      title: Text(
                        'Remember me',
                        style: TextStyle(
                          fontSize: 15.0,
                        ),
                      ),
                      value: checkBoxValue,
                      onChanged: (newValue){
                        setState(() {
                          checkBoxValue = newValue;
                        });
                      },
                      controlAffinity:  ListTileControlAffinity.leading,
                    ), */
                    
                  ],
                )
              ),
              Divider (height: 65.0, color: Colors.grey[350], ),

              /*****GO TO REGISTER PAGE SECTION*****/
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Don\'t have an account?'),
                    SizedBox(width: 10.0,),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/register'); //Go to register page
                      },
                      child: Container(
                        child: Text(
                          'Sign up',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFB308278)
                          ),  
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}