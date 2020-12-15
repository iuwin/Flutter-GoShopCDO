import 'package:flutter/material.dart';
import 'package:sampleflutter/custom_widget/custom_text_form_field_widget.dart';

class PicturePriceAddress extends StatefulWidget {
  PicturePriceAddressState createState() => PicturePriceAddressState();
}

class PicturePriceAddressState extends State<PicturePriceAddress> {
  static final formKey = GlobalKey<FormState>();

  static TextEditingController fixedPriceController =
      new TextEditingController();
  static TextEditingController bargainPriceController =
      new TextEditingController();
  static TextEditingController addressController = new TextEditingController();

  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: formKey,
        autovalidate: false,
        child: Column(
          children: [
            new CustomTextFormField(
                hintTextType: 'Fixed Price',
                textEditingController: fixedPriceController),
            SizedBox(height: 30.0),
            new CustomTextFormField(
                hintTextType: 'Bargain Price',
                textEditingController: bargainPriceController),
            SizedBox(height: 30.0),
            new CustomTextFormField(
                hintTextType: 'Address',
                textEditingController: addressController),
            SizedBox(height: 30.0),
          ],
        ),
      ),
    );
  }
}
