import 'package:flutter/material.dart';

class ProductView extends StatefulWidget {
  Map productDetails = new Map();

  ProductView({this.productDetails});
  @override
  _ProductViewState createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {


  ///Text Generator
  Widget _textGenerator(
          {String text, Color color, double fontSize, FontWeight fontWeight}) =>
      Container(
        padding: EdgeInsets.fromLTRB(25, 15, 25, 0),
        child: Text(
          text,
          style: TextStyle(
              fontSize: fontSize, color: color, fontWeight: fontWeight),
          textAlign: TextAlign.justify,
        ),
      );

  ///Color Variation (Optional)
  Widget _colorVariationGenerator({Color color}) => CircleAvatar(
        backgroundColor: color,
        radius: 15,
      );

  ///Upper Radius Effect (PNG only)
  Widget _upperBorderRadius() => SliverToBoxAdapter(
        child: Container(
          color: Color(0xFFB308278),
          height: 20,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 20,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(40.0),
                    topRight: const Radius.circular(40.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  ///Build
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            //title: addtocart button here,
            backgroundColor: Color(0xFFB308278),
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                widget.productDetails['imagePath'], //PRODUCT IMAGE
                fit: BoxFit.contain,
              ),
            ),
          ),
          _upperBorderRadius(),
          SliverList(
            delegate: SliverChildListDelegate([
              //Product Name
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _textGenerator(
                      text: widget.productDetails['productName'], //PRODUCT NAME
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                  Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: Icon(Icons.favorite_border),
                  ),
                ],
              ),
              //Price
              _textGenerator(
                  text: 'P5,000',
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              //Description
              _textGenerator(
                  text: 'Details',
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.normal),
              _textGenerator(
                  text:
                      'The new iphone provides users the best technologies from apple. It is slick and have a variety of colors to choose from. Bill Gates said i love you.',
                  color: Colors.grey[600],
                  fontSize: 14,
                  fontWeight: FontWeight.normal),
              //Color Variation
              _textGenerator(
                  text: 'Colors',
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.normal),
              SizedBox(height: 10),
              Row(
                children: [
                  SizedBox(width: 25),
                  _colorVariationGenerator(color: Colors.blue),
                  SizedBox(width: 15),
                  _colorVariationGenerator(color: Colors.black),
                  SizedBox(width: 15),
                  _colorVariationGenerator(color: Colors.amber[600]),
                  SizedBox(width: 15),
                  _colorVariationGenerator(color: Colors.grey),
                ],
              ),
            ]),
          ),
        ],
      ),
      bottomNavigationBar:
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Container(
          margin: EdgeInsets.only(bottom: 10, top: 5),
          padding: EdgeInsets.fromLTRB(75, 12, 75, 12),
          child: Text(
            'Buy now',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          decoration: BoxDecoration(
              color: Color(0xFFB296961),
              borderRadius: BorderRadius.circular(5)),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 10, top: 5),
          padding: EdgeInsets.fromLTRB(30, 12, 30, 12),
          child: Text('Add to Cart',
              textAlign: TextAlign.center,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          decoration: BoxDecoration(
              color: Color(0xFFB296961),
              borderRadius: BorderRadius.circular(5)),
        )
      ]),
    );
  }
}
