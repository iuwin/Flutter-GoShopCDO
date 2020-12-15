import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  String title;

  TitleWidget({this.title});
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList(
            delegate: SliverChildListDelegate([
          SizedBox(
            height: 81,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ])),
      ],
    );
  }
}
