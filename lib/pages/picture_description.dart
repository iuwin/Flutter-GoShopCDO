import 'package:flutter/material.dart';
import 'package:sampleflutter/custom_widget/custom_text_form_field_widget.dart';
import 'package:sampleflutter/custom_widget/profile_picture.dart';

class PictureDescription extends StatefulWidget {
  PictureDescriptionState createState() => PictureDescriptionState();
}

class PictureDescriptionState extends State<PictureDescription> {
  static final formKey = GlobalKey<FormState>();

  static TextEditingController productNameController = new TextEditingController();
  static TextEditingController categoryController = new TextEditingController();
  static TextEditingController descriptionController = new TextEditingController();
  static TextEditingController conditionController = new TextEditingController();
  static TextEditingController addressController = new TextEditingController();
  
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: formKey,
        autovalidate: false,
        child: Column(
          children: [
            ProfilePicture(),
            SizedBox(height: 30.0),
            new CustomTextFormField(
                hintTextType: 'Product Name', textEditingController: productNameController,),
            SizedBox(height: 30.0),
            new CustomTextFormField(
                hintTextType: 'Description',
                textEditingController: descriptionController,
                height: 100,
                maxLine: 8,
                inputType: TextInputType.multiline,),
            SizedBox(height: 30.0),
            new CustomTextFormField(
                hintTextType: 'Category',
                textEditingController: categoryController, fieldIcon: new Icon(Icons.format_list_bulleted),),
            SizedBox(height: 30.0),
            new CustomTextFormField(
                hintTextType: 'Address',
                textEditingController: addressController, fieldIcon: new Icon(Icons.location_on),),
            SizedBox(height: 30.0),
            new CustomTextFormField(
                hintTextType: 'Condition',
                textEditingController: conditionController, fieldIcon: new Icon(Icons.sentiment_satisfied),),
            SizedBox(height: 30.0),
          ],
        ),
      ),
    );
  }
}
