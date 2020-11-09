import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
/*****VARIABLE FOR TEXTFORMFIELD*****/
  bool checkBoxValue = false;
  bool newValue = false;
  bool loginTouching = false;
  String _email;
  String _userName;
  String _firstPassword;
  String _secondPassword;
  String _mobileNumber;
  String _firstName;
  String _middleName;
  String _surname;
  String _gender;
  String _address;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  /***** RegistrationTextField TEXTFORMFIELD WIDGETS*****/
  Widget _buildRegistrationTextField({String hintTextType}) {
    return Theme(
      child: TextFormField(
        validator: (String value) {
          print('$hintTextType');
          if (hintTextType == 'Email') {
            if (value.isEmpty) {
              return 'Email is Required';
            }
            if (!RegExp(
                    r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                .hasMatch(value)) {
              return 'Please enter a valid email Address';
            }
          } else if (hintTextType == 'UserName') {
            if (value.isEmpty) {
              return 'UserName is Required';
            }
          } else if (hintTextType == 'Password') {
            if (value.isEmpty) {
              return 'Password is Required';
            }
          } else if (hintTextType == 'Confirm Password') {
            if (value.isEmpty) {
              return 'Password is Required';
            }
          } else if (hintTextType == 'Mobile Number') {
            if (value.isEmpty) {
              return 'Mobile Number is Required';
            }
          } else if (hintTextType == 'First Name') {
            if (value.isEmpty) {
              return 'First Name is Required';
            }
          } else if (hintTextType == 'Middle Name') {
            if (value.isEmpty) {
              return 'Middle Name is Required';
            }
          } else if (hintTextType == 'Surname') {
            if (value.isEmpty) {
              return 'Surname is Required';
            }
          } else if (hintTextType == 'Gender') {
            if (value.isEmpty) {
              return 'Gender is Required';
            }
          } else if (hintTextType == 'Address') {
            if (value.isEmpty) {
              return 'Address is Required';
            }
          }

          return null;
        },
        onSaved: (String value) {
          if (hintTextType == 'Email') {
            _email = value;
          } else if (hintTextType == 'UserName') {
            _userName = value;
          } else if (hintTextType == 'Password') {
            _firstPassword = value;
          } else if (hintTextType == 'Confirm Password') {
            _secondPassword = value;
          } else if (hintTextType == 'Mobile Number') {
            _mobileNumber = value;
          } else if (hintTextType == 'First Name') {
            _firstName = value;
          } else if (hintTextType == 'Middle Name') {
            _middleName = value;
          } else if (hintTextType == 'Surname') {
            _surname = value;
          } else if (hintTextType == 'Gender') {
            _gender = value;
          } else if (hintTextType == 'Address') {
            _address = value;
          }
        },
        decoration: InputDecoration(
          hintText: '$hintTextType',
          border:
              new OutlineInputBorder(borderRadius: BorderRadius.circular(25.0)),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black, width: 1.0),
            borderRadius: BorderRadius.circular(25.0),
          ),
        ),
      ),
      data: Theme.of(context).copyWith(primaryColor: Color(0xFFB296961)),
    );
  }

  /***** REGISTER BUTTON WIDGETS*****/
  Widget RegisterButton() {
    return GestureDetector(
      onTap: () {
        if (!_formKey.currentState.validate()) {
          return;
        }
        _formKey.currentState.save();

        print(_email);
        print(_userName);
        print(_firstPassword);
        print(_secondPassword);
        print(_mobileNumber);
        print(_gender);
        print(_firstName);
        print(_middleName);
        print(_surname);
        print(_address);
      },
      child: Listener(
        child: Container(
          padding: EdgeInsets.fromLTRB(127.0, 20.0, 127.0, 20.0),
          decoration: BoxDecoration(
            color:
                loginTouching == true ? Color(0xFFB308278) : Color(0xFFB296961),
            borderRadius: BorderRadius.circular(25.0),
          ),
          child: Text(
            'Register',
            style: TextStyle(
                color: Colors.white,
                letterSpacing: 1.2,
                fontSize: 15.0,
                fontWeight: FontWeight.bold),
          ),
        ),
        onPointerDown: (event) => setState(() {
          loginTouching = true;
        }),
        onPointerUp: (event) => setState(() {
          loginTouching = false;
        }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.fromLTRB(30.0, 100.0, 30.0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              /*****LOGIN HEADER*****/
              Container(
                margin: EdgeInsets.only(bottom: 50.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Register",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text('Welcome to GoShop CDO!',
                        style: TextStyle(color: Colors.grey[500]))
                  ],
                ),
              ),
              /*****INPUT FIELDS*****/
              Expanded(
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        _buildRegistrationTextField(hintTextType: 'Email'),
                        SizedBox(height: 30.0),
                        _buildRegistrationTextField(hintTextType: 'UserName'),
                        SizedBox(height: 30.0),
                        _buildRegistrationTextField(hintTextType: 'Password'),
                        SizedBox(height: 30.0),
                        _buildRegistrationTextField(
                            hintTextType: 'Confirm Password'),
                        SizedBox(height: 30.0),
                        _buildRegistrationTextField(
                            hintTextType: 'Mobile Number'),
                        SizedBox(height: 30.0),
                        _buildRegistrationTextField(hintTextType: 'First Name'),
                        SizedBox(height: 30.0),
                        _buildRegistrationTextField(
                            hintTextType: 'Middle Name'),
                        SizedBox(height: 30.0),
                        _buildRegistrationTextField(hintTextType: 'Surname'),
                        SizedBox(height: 30.0),
                        _buildRegistrationTextField(hintTextType: 'Gender'),
                        SizedBox(height: 30.0),
                        _buildRegistrationTextField(hintTextType: 'Address'),
                        SizedBox(height: 30.0),
                        RegisterButton(),
                        SizedBox(height: 30.0),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
