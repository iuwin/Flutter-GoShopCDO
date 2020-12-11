import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
/*****VARIABLE FOR TEXTFORMFIELD*****/
  bool checkBoxValue = false;
  bool newValue = false;
  bool loginTouching = false;
  int _value = 2;
  String _email;
  String _userName;
  String _firstPassword;
  String _secondPassword;
  String _mobileNumber;
  String _firstName;
  String _middleName;
  String _surname;
  int _gender;
  String _address;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // hide/show sa Textformfield
  setSelectedRadio(int val) {
    setState(() {
      print(val);
      if (val == 0) {
        return 'uwi';
      }
      _value = val;
      _gender = _value;
    });
  }

  bool obscureType(String hintTextType) {
    bool oT = false;
    if (hintTextType == 'Password') {
      oT = true;
    } else if (hintTextType == 'Confirm Password') {
      oT = true;
    }
    return oT;
  }

  // char/digit sa Textformfield
  dynamic textInputType(String hintTextType) {
    if (hintTextType == 'Mobile Number') {
      return TextInputType.number;
    }
    return TextInputType.text;
  }

  // only text/digit sa Textformfield
  dynamic filteringTextInputFormatter(String hintTextType) {
    if (hintTextType == 'Mobile Number') {
      return FilteringTextInputFormatter.digitsOnly;
    } else {
      return FilteringTextInputFormatter.singleLineFormatter;
    }
  }

  // limit the input sa Textformfield
  dynamic lengthLimitingTextInputFormatter(String hintTextType) {
    if (hintTextType == 'Mobile Number') {
      return LengthLimitingTextInputFormatter(10);
    } else {
      return LengthLimitingTextInputFormatter(50);
    }
  }

  //profile picture
  Widget profilePicture() {
    return Center(
      child: CircleAvatar(
        radius: 100.0,
        backgroundColor: Colors.black26,
        child: ClipOval(
          child: Stack(
            // overflow: Overflow.clip,
            children: [
              Positioned(
                // top: MediaQuery.of(context).size.height * .15,
                bottom: 0,
                right: 0,
                left: 0,
                child: GestureDetector(
                  onTap: () {
                    print('Clicked');
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * .10,
                    width: MediaQuery.of(context).size.width * 1,
                    color: Colors.blueGrey,
                    child: Icon(
                      Icons.add_a_photo,
                      size: 50.0,
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

  // prefix/leading sa Textformfield
  Widget prefIcon(String hintTextType) {
    if (hintTextType == 'Mobile Number') {
      return Padding(padding: EdgeInsets.all(15), child: Text('+639'));
    } else if (hintTextType == 'Email') {
      return Icon(Icons.email);
    } else if (hintTextType == 'UserName') {
      return Icon(Icons.person);
    } else if (hintTextType == 'Password') {
      return Icon(Icons.lock);
    } else if (hintTextType == 'Confirm Password') {
      return Icon(Icons.lock);
    } else if (hintTextType == 'Password') {
      return Icon(Icons.lock);
    } else if (hintTextType == 'First Name') {
      return Icon(Icons.person);
    } else if (hintTextType == 'Middle Name') {
      return Icon(Icons.person);
    } else if (hintTextType == 'Surname') {
      return Icon(Icons.person);
    } else if (hintTextType == 'Address') {
      return Icon(Icons.add_location);
    }
  }

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
          } else if (hintTextType == 'Address') {
            _address = value;
          }
        },
        decoration: InputDecoration(
          prefixIcon: prefIcon(hintTextType),
          hintText: '$hintTextType',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(25.0)),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 1.0),
            borderRadius: BorderRadius.circular(25.0),
          ),
        ),
        obscureText: obscureType(hintTextType),
        keyboardType: textInputType(hintTextType),
        inputFormatters: [
          filteringTextInputFormatter(hintTextType),
          lengthLimitingTextInputFormatter(hintTextType),
        ],
      ),
      data: Theme.of(context).copyWith(primaryColor: Color(0xFFB296961)),
    );
  }

  /***** RADIO BUTTON TEXT WIDGETS*****/
  Widget RadioButtonText(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 17,
        color: Colors.black54,
      ),
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
          padding: EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0),
          /*****LOGIN HEADER*****/
          /*****INPUT FIELDS*****/
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top: 100.0),
                    child: Text(
                      "Register",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'Welcome to GoShop CDO!',
                    style: TextStyle(color: Colors.grey[500]),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  profilePicture(),
                  SizedBox(height: 30.0),
                  _buildRegistrationTextField(hintTextType: 'Email'),
                  SizedBox(height: 30.0),
                  _buildRegistrationTextField(hintTextType: 'UserName'),
                  SizedBox(height: 30.0),
                  _buildRegistrationTextField(hintTextType: 'Password'),
                  SizedBox(height: 30.0),
                  _buildRegistrationTextField(hintTextType: 'Confirm Password'),
                  SizedBox(height: 30.0),
                  _buildRegistrationTextField(hintTextType: 'Mobile Number'),
                  SizedBox(height: 30.0),
                  _buildRegistrationTextField(hintTextType: 'First Name'),
                  SizedBox(height: 30.0),
                  _buildRegistrationTextField(hintTextType: 'Middle Name'),
                  SizedBox(height: 30.0),
                  _buildRegistrationTextField(hintTextType: 'Surname'),
                  SizedBox(height: 30.0),
                  // _buildRegistrationTextField(hintTextType: 'Gender'),
                  ButtonBar(
                    alignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Radio(
                        value: 1,
                        groupValue: _value,
                        activeColor: Color(0xFFB308278),
                        onChanged: (int val) {
                          setSelectedRadio(val);
                        },
                      ),
                      RadioButtonText('Male'),
                      Radio(
                        value: 2,
                        groupValue: _value,
                        activeColor: Color(0xFFB308278),
                        onChanged: (int val) {
                          setSelectedRadio(val);
                        },
                      ),
                      RadioButtonText('Female'),
                    ],
                  ),
                  SizedBox(height: 30.0),
                  _buildRegistrationTextField(hintTextType: 'Address'),
                  SizedBox(height: 30.0),
                  Center(child: RegisterButton()),
                  SizedBox(height: 30.0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
