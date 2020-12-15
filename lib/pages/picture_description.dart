import 'package:flutter/material.dart';
import 'package:sampleflutter/custom_widget/custom_text_form_field_widget.dart';
import 'package:sampleflutter/custom_widget/profile_picture.dart';

class PictureDescription extends StatefulWidget {
  PictureDescriptionState createState() => PictureDescriptionState();
}

class PictureDescriptionState extends State<PictureDescription> {
  static final formKey = GlobalKey<FormState>();

  static TextEditingController titleController = new TextEditingController();
  static TextEditingController categoryController = new TextEditingController();
  static TextEditingController descriptionController =
      new TextEditingController();
  static TextEditingController conditionController =
      new TextEditingController();
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
                hintTextType: 'Title', textEditingController: titleController),
            SizedBox(height: 30.0),
            new CustomTextFormField(
                hintTextType: 'Category',
                textEditingController: categoryController),
            SizedBox(height: 30.0),
            new CustomTextFormField(
                hintTextType: 'Description',
                textEditingController: descriptionController),
            SizedBox(height: 30.0),
            new CustomTextFormField(
                hintTextType: 'Condition',
                textEditingController: conditionController),
            SizedBox(height: 30.0),
          ],
        ),
      ),
    );
  }
}
