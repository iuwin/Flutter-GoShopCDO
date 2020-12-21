import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  String hintTextType;
  TextEditingController textEditingController;
  Icon fieldIcon;
  int maxLine;
  double height;
  TextInputType inputType;

  CustomTextFormField({this.height = 50, this.maxLine = 1, this.inputType = TextInputType.text, this.hintTextType, this.textEditingController, this.fieldIcon});

  // String valueType;
  CustomTextFormFieldState createState() => CustomTextFormFieldState();
}

class CustomTextFormFieldState extends State<CustomTextFormField> {
  Widget build(BuildContext context) {
    return Theme(
      child: Container(
        height: widget.height,
        child: TextFormField(
          validator: (String value) {
            print(widget.hintTextType);

            if (widget.hintTextType == 'Product Name') {
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
            } else if (widget.hintTextType == 'Stock Quantity') {
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
          maxLines: widget.maxLine,
          keyboardType: widget.inputType,
          decoration: InputDecoration(
            prefixIcon: widget.fieldIcon,
            hintText: widget.hintTextType,
            errorStyle: TextStyle(),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey[200],
                width: 2,
                
              )
            ),
            // border: OutlineInputBorder(
            //   borderSide: BorderSide.none
            //           //             border: Border(
            //           //   bottom: BorderSide(width: 1.5, color: Colors.grey[200])
            //           // ),
            // ),//OutlineInputBorder(borderRadius: BorderRadius.circular(25.0)),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey[200],
                width: 2,
              )
            ),
              //borderSide: BorderSide(color: Colors.black, width: 1.0),
              // borderSide: BorderSide(color: Colors.black, width: 1.0),
              // borderRadius: BorderRadius.circular(25.0),
          ),
        ),
      ),
      data: Theme.of(context).copyWith(primaryColor: Color(0xFFB296961)),
    );
  }
}
