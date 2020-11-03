import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: LoginPage(),
));



class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  bool checkBoxValue = false;
  bool newValue = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.grey[900],
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.fromLTRB(30.0, 10.0,  30.0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /*****LOGO*****/
            Container( 
              margin: EdgeInsets.symmetric(
                vertical: 70.0
              ),
              child: Text("Logo Brand"),
            ),

            /*****LOGIN HEADER*****/
            Container(
              margin: EdgeInsets.only(
                bottom: 50.0
              ),
              child: Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                  ),
                ),
            ),

            /*****INPUT FIELDS*****/
            Container(
              margin: EdgeInsets.only(
                bottom: 35.0
              ),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Username/Email',
                      
                    ),
                  ),
                  SizedBox(height: 30.0,),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Password',
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
                  Text('Forget Password?'),
                  SizedBox(height: 35.0,),
                  GestureDetector( 
                    onTap: () {
                      setState(() {

                        }
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.fromLTRB(129.0, 26.0, 129.0, 26.0),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(18)
                      ),
                      child: Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.white,
                            letterSpacing: 1.2,
                          ),
                        ),
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
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Don\'t have an account?'),
                  SizedBox(width: 10.0,),
                  Text(
                    'Register Here',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                        
                    ),  
                  ),
                ],
              ),
            ),


          ],

        ),
      )
    

    );
  }
}