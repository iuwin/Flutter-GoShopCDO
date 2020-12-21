import 'package:flutter/material.dart';

class TrendHomeProductTemplate extends StatelessWidget {
  String imagePath;
  String productName;
  double price;
  TrendHomeProductTemplate({this.imagePath, this.productName, this.price});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: GestureDetector(
          onTap: (){
            Navigator.pushNamed(
              context, 
              '/viewproduct', 
              arguments: {
                "imagePath": imagePath,
                "productName": productName          
            });
          },
          child: Container(
          width: 150,
          height: 200,
          margin: EdgeInsets.only(
            right: 20,
            bottom: 10,
          ),
          decoration: BoxDecoration(
              color: Colors.white, //Color(0xFFBF2F1F1),
              borderRadius: BorderRadius.circular(30.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[300],
                  blurRadius: 8,
                  offset: Offset(1, 3),
                )
              ]),
          child: FittedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset(
                  imagePath,
                  width: 120,
                  height: 120,
                ),
                SizedBox(height: 10),
                Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      children: [
                        Text(
                          productName,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        SizedBox(height: 20),
                        //Text('\$ $price', style: TextStyle(color: Color(0xFFB308278), fontWeight: FontWeight.bold, fontSize: 15)),
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
