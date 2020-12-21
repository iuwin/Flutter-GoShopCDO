import 'dart:collection';
import 'package:flutter/material.dart';

class PictureUpload extends StatefulWidget {
  var mapInfo = HashMap<String, String>();

  PictureUpload({this.mapInfo});

  _PictureUploadState createState() => _PictureUploadState();
}

class _PictureUploadState extends State<PictureUpload> {

  Widget generateRow(String label, String value) => Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      // Text(
      //   label,
      //   style: TextStyle(
      //     fontSize: 14,
      //   ),
      // ),
      Text(
        value,
        style: TextStyle(
          fontSize: 14,
        ),
      )
    ],
  );


  Widget build(BuildContext context) {
    var productName = widget.mapInfo["productName"];
    var category = widget.mapInfo["category"];
    var description = widget.mapInfo["description"];
    var condition = widget.mapInfo["condition"];
    var fixedPrice = widget.mapInfo["fixedPrice"];
    var bargainPrice = widget.mapInfo["bargainPrice"];
    var address = widget.mapInfo["address"];

    // TODO: implement build
    return Container(
      child: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height * .6,
          margin: EdgeInsets.only(top: 15, bottom: 25),
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Review Product',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              generateRow('Title :', productName),
              generateRow('Category :', category),
              generateRow('Description :', description),
              generateRow('Condition :', condition),
              generateRow('Fixed Price :', fixedPrice),
              generateRow('Bargain Price :', bargainPrice),
              generateRow('Address :', address),
            ],
          ),
        ),
      ),
    );
  }
}
