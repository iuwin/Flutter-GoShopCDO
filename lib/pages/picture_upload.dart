import 'dart:collection';
import 'package:flutter/material.dart';

class PictureUpload extends StatefulWidget {
  var mapInfo = HashMap<String, String>();

  PictureUpload({this.mapInfo});

  _PictureUploadState createState() => _PictureUploadState();
}

class _PictureUploadState extends State<PictureUpload> {
  Widget build(BuildContext context) {
    var title = widget.mapInfo["title"];
    var category = widget.mapInfo["category"];
    var description = widget.mapInfo["description"];
    var condition = widget.mapInfo["condition"];
    var fixedPrice = widget.mapInfo["fixedPrice"];
    var bargainPrice = widget.mapInfo["bargainPrice"];
    var address = widget.mapInfo["address"];

    // TODO: implement build
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Text("Title :"),
                Text(title),
              ],
            ),
            Row(
              children: [
                Text("Category :"),
                Text(category),
              ],
            ),
            Row(
              children: [
                Text("Description :"),
                Text(description),
              ],
            ),
            Row(
              children: [
                Text("Condition :"),
                Text(condition),
              ],
            ),
            Row(
              children: [
                Text("Fixed Price :"),
                Text(fixedPrice),
              ],
            ),
            Row(
              children: [
                Text("Bargain Price :"),
                Text(bargainPrice),
              ],
            ),
            Row(
              children: [
                Text("Address :"),
                Text(address),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
