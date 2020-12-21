import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:fa_stepper/fa_stepper.dart';
import 'picture_description.dart';
import 'picture_price_address.dart';
import 'picture_upload.dart';

class Post extends StatefulWidget {
  _Post createState() => _Post();
}

class _Post extends State<Post> {
  int currentStep = 0;
  bool uploadingStep = false;


  dynamic onSubmitProduct(){


  }


  // List<Widget> controlButtons(Function onCancel, Function onContinue, Function onSubmitProduct){
  //   if(uploadingStep == false){
  //     return <Widget>[
  //       FlatButton(
  //         onPressed: onCancel,
  //         child: Icon(Icons.keyboard_arrow_left),
  //       ),
  //       FlatButton(
  //         onPressed: onContinue,
  //         child: Icon(Icons.keyboard_arrow_right),
  //       ),
  //     ];
  //   }else if(uploadingStep == true){
  //     return <Widget>[
  //       GestureDetector(
  //         child: Container(
  //           color: Colors.green,
  //           child: Text(
  //             'Post Product'
  //           ),
  //         ),
  //       )
  //     ];
  //   }

  // }


  @override
  Widget build(BuildContext context) {
    var mapData = HashMap<String, String>();
    mapData["productName"] = PictureDescriptionState.productNameController.text;
    mapData["category"] = PictureDescriptionState.categoryController.text;
    mapData["description"] = PictureDescriptionState.descriptionController.text;
    mapData["condition"] = PictureDescriptionState.conditionController.text;
    mapData["address"] = PictureDescriptionState.addressController.text;
    mapData["fixedPrice"] = PicturePriceAddressState.fixedPriceController.text;
    mapData["bargainPrice"] = PicturePriceAddressState.bargainPriceController.text;
    mapData["quantity"] = PicturePriceAddressState.quantityController.text;

    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: FAStepper(
              physics: ClampingScrollPhysics(),
              steps: [
                FAStep(
                  isActive: (currentStep >= 1) ? true : false,
                  state: currentStep == 0
                      ? FAStepstate.editing
                      : currentStep > 0
                          ? FAStepstate.complete
                          : FAStepstate.indexed,
                  content: PictureDescription(),
                  title: Text('Product Information',),
                ),
                FAStep(
                  isActive: (currentStep >= 2) ? true : false,
                  state: currentStep == 1
                      ? FAStepstate.editing
                      : currentStep > 1
                          ? FAStepstate.complete
                          : FAStepstate.indexed,
                  title: Text('Product Pricing'),
                  content: PicturePriceAddress(),
                ),
                FAStep(
                  state: currentStep == 2
                      ? FAStepstate.editing
                      : currentStep > 2
                          ? FAStepstate.complete
                          : FAStepstate.indexed,
                  title: Text('Upload'),
                  isActive: (currentStep >= 3) ? true : false,
                  // subtitle: const Text("Error!"),
                  content: PictureUpload(mapInfo: mapData),
                ),
              ],
              currentStep: currentStep,
              onStepContinue: () {
                setState(() {
                  if (currentStep < 3) {
                    if (currentStep == 0 &&
                        PictureDescriptionState.formKey.currentState
                            .validate()) {
                      currentStep = currentStep + 1;
                      uploadingStep = false;
                    } else if (currentStep == 1 &&
                        PicturePriceAddressState.formKey.currentState
                            .validate()) {
                      currentStep = currentStep + 1;
                      uploadingStep = false;
                    }
                  } else {
                    uploadingStep = true;
                    //currentStep = 0;

                  }
                });
              },
              onStepTapped: (step) {
                setState(() {
                  currentStep = step;
                });
              },
              onStepCancel: () {
                setState(() {
                  if (currentStep > 0) {
                    currentStep = currentStep - 1;
                  } else {
                    currentStep = 0;
                  }
                });
              },
              type: FAStepperType.horizontal,
              //button edit
              controlsBuilder: (BuildContext context,
                  {VoidCallback onStepContinue, VoidCallback onStepCancel}) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:<Widget>[
                    FlatButton(
                      onPressed: onStepCancel,
                      child: Icon(Icons.keyboard_arrow_left),
                    ),
                    FlatButton(
                      onPressed: onStepContinue,
                      child: Icon(Icons.keyboard_arrow_right),
                    ),
                ]
                );
              }),
        ),
      ),
    );
  }
}
