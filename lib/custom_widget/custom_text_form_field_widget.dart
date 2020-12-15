import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  String hintTextType;
  TextEditingController textEditingController;
  CustomTextFormField({this.hintTextType, this.textEditingController});

  // String valueType;
  CustomTextFormFieldState createState() => CustomTextFormFieldState();
}

class CustomTextFormFieldState extends State<CustomTextFormField> {
  Widget build(BuildContext context) {
    return Theme(
      child: TextFormField(
        validator: (String value) {
          print(widget.hintTextType);

          if (widget.hintTextType == 'Title') {
            if (value.isEmpty) {
              return widget.hintTextType + ' is Required';
            }
          } else if (widget.hintTextType == 'Category') {
            if (value.isEmpty) {
              return widget.hintTextType + ' is Required';
            }
          } else if (widget.hintTextType == 'Description') {
            if (value.isEmpty) {
              return widget.hintTextType + ' is Required';
            }
          } else if (widget.hintTextType == 'Condition') {
            if (value.isEmpty) {
              return widget.hintTextType + ' is Required';
            }
          } else if (widget.hintTextType == 'Fixed Price') {
            if (value.isEmpty) {
              return widget.hintTextType + ' is Required';
            }
          } else if (widget.hintTextType == 'Bargain Price') {
            if (value.isEmpty) {
              return widget.hintTextType + ' is Required';
            }
          } else if (widget.hintTextType == 'Address') {
            if (value.isEmpty) {
              return widget.hintTextType + ' is Required';
            }
          }

          // if (widget.hintTextType == 'Title') {
          //   if (value.isEmpty) {
          //     return widget.hintTextType + ' is Required';
          //   }
          // }
          return null;
        },
        controller: widget.textEditingController,
        decoration: InputDecoration(
          // prefixIcon: prefIcon(hintTextType),
          hintText: widget.hintTextType,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(25.0)),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 1.0),
            borderRadius: BorderRadius.circular(25.0),
          ),
        ),
      ),
      data: Theme.of(context).copyWith(primaryColor: Color(0xFFB296961)),
    );
  }
}
