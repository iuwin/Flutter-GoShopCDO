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
  static TextEditingController quantityController = new TextEditingController();

  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40),
      child: Form(
        key: formKey,
        autovalidate: false,
        child: Column(
          children: [
            new CustomTextFormField(
                hintTextType: 'Fixed Price',
                textEditingController: fixedPriceController, fieldIcon: new Icon(Icons.monetization_on),),
            SizedBox(height: 30.0),
            new CustomTextFormField(
                hintTextType: 'Bargain Price',
                textEditingController: bargainPriceController, fieldIcon: new Icon(Icons.money_off),),
            SizedBox(height: 30.0),
            new CustomTextFormField(
                hintTextType: 'Stock Quantity',
                textEditingController: quantityController, fieldIcon: new Icon(Icons.format_align_center),),
            SizedBox(height: 30.0),
          ],
        ),
      ),
    );
  }
}
