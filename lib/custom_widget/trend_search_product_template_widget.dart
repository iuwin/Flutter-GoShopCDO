import 'package:flutter/material.dart';

class TrendSearchProductTemplate extends StatelessWidget {
  String imagePath;
  String productName;
  double price;
  TrendSearchProductTemplate({this.imagePath, this.productName, this.price});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/viewproduct');
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
                  width: 150,
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            productName,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          Row(
                            children: [
                              Icon(Icons.star, size: 18, color: Colors.amber),
                              Text('5'),
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 5),
                      Text('\$ $price',
                          style: TextStyle(
                              color: Color(0xFFB308278),
                              fontWeight: FontWeight.bold,
                              fontSize: 15)),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            size: 18,
                            color: Colors.grey,
                          ),
                          Text('Carmen'),
                        ],
                      ),
                      Icon(Icons.favorite_border, size: 18)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
