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

/***** EMAIL TEXTFORMFIELD WIDGETS*****/
  Widget _buildEmail() {
    return Theme(
      child: TextFormField(
        validator: (String value) {
          if (value.isEmpty) {
            return 'Email is Required';
          }

          if (!RegExp(
                  r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
              .hasMatch(value)) {
            return 'Please enter a valid email Address';
          }
          return null;
        },
        onSaved: (String value) {
          _email = value;
        },
        decoration: InputDecoration(
          hintText: 'Email',
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

  /***** USERNAME TEXTFORMFIELD WIDGETS*****/
  Widget _buildUserName() {
    return Theme(
      child: TextFormField(
        validator: (String value) {
          if (value.isEmpty) {
            return 'Username is Required';
          }
          return null;
        },
        onSaved: (String value) {
          _userName = value;
        },
        decoration: InputDecoration(
          hintText: 'UserName',
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

  /***** FIRST PASSWORD TEXTFORMFIELD WIDGETS*****/
  Widget _buildFirstPassword() {
    return Theme(
      child: TextFormField(
        validator: (String value) {
          if (value.isEmpty) {
            return 'Password is Required';
          }
          return null;
        },
        onSaved: (String value) {
          _firstPassword = value;
        },
        keyboardType: TextInputType.visiblePassword,
        decoration: InputDecoration(
          hintText: 'Password',
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

    /***** SECONDPASSWORD TEXTFORMFIELD WIDGETS*****/
  }

  Widget _buildSecondPassword() {
    return Theme(
      child: TextFormField(
        validator: (String value) {
          if (value.isEmpty) {
            return 'Password is Required';
          }
          return null;
        },
        onSaved: (String value) {
          _secondPassword = value;
        },
        keyboardType: TextInputType.visiblePassword,
        decoration: InputDecoration(
          hintText: 'Confirm Password',
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

  /***** MOBILENUMBER TEXTFORMFIELD WIDGETS*****/
  Widget _buildMobileNumber() {
    return Theme(
      child: TextFormField(
        validator: (String value) {
          if (value.isEmpty) {
            return 'Mobile number is Required';
          }
          return null;
        },
        onSaved: (String value) {
          _mobileNumber = value;
        },
        decoration: InputDecoration(
          hintText: 'Mobile Number',
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

  /***** FIRSTNAME TEXTFORMFIELD WIDGETS*****/
  Widget _buildFirstName() {
    return Theme(
      child: TextFormField(
        validator: (String value) {
          if (value.isEmpty) {
            return 'First Name is Required';
          }
          return null;
        },
        onSaved: (String value) {
          _firstName = value;
        },
        decoration: InputDecoration(
          hintText: 'First Name',
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

  /***** MIDDLENAME TEXTFORMFIELD WIDGETS*****/
  Widget _buildMiddleName() {
    return Theme(
      child: TextFormField(
        validator: (String value) {
          if (value.isEmpty) {
            return 'Middle Name is Required';
          }
          return null;
        },
        onSaved: (String value) {
          _middleName = value;
        },
        decoration: InputDecoration(
          hintText: 'Middle Name',
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

  /***** SURNAME TEXTFORMFIELD WIDGETS*****/
  Widget _buildSurname() {
    return Theme(
      child: TextFormField(
        validator: (String value) {
          if (value.isEmpty) {
            return 'Surname is Required';
          }
          return null;
        },
        onSaved: (String value) {
          _surname = value;
        },
        decoration: InputDecoration(
          hintText: 'Surname',
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

  /***** GENDER TEXTFORMFIELD WIDGETS*****/
  Widget _buildGender() {
    return Theme(
      child: TextFormField(
        validator: (String value) {
          if (value.isEmpty) {
            return 'Gender is Required';
          }
          return null;
        },
        onSaved: (String value) {
          _gender = value;
        },
        decoration: InputDecoration(
          hintText: 'Gender',
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

  /***** ADDRESS TEXTFORMFIELD WIDGETS*****/
  Widget _buildAddress() {
    return Theme(
      child: TextFormField(
        validator: (String value) {
          if (value.isEmpty) {
            return 'Address is Required';
          }
          return null;
        },
        onSaved: (String value) {
          _address = value;
        },
        decoration: InputDecoration(
          hintText: 'Adress',
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
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    padding: const EdgeInsets.only(bottom: 35.0),
                    children: <Widget>[
                      _buildEmail(),
                      SizedBox(height: 30.0),
                      _buildUserName(),
                      SizedBox(height: 30.0),
                      _buildFirstPassword(),
                      SizedBox(height: 30.0),
                      _buildSecondPassword(),
                      SizedBox(height: 30.0),
                      _buildMobileNumber(),
                      SizedBox(height: 30.0),
                      _buildFirstName(),
                      SizedBox(height: 30.0),
                      _buildMiddleName(),
                      SizedBox(height: 30.0),
                      _buildSurname(),
                      SizedBox(height: 30.0),
                      _buildGender(),
                      SizedBox(height: 30.0),
                      _buildAddress(),
                      SizedBox(height: 30.0),
                      RegisterButton()
                    ],
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
