import 'package:flutter/material.dart';
import 'package:sampleflutter/product.dart';

class SearchResult extends StatefulWidget {
  @override
  _SearchResultState createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {

  List<Product> products;

  @override
  void initState() { 
    super.initState();
    products = initProducts();
  }

  Widget _productTemplate(String imagepath, String productname, double price) {
    return Center(
      child: Container(
        width: 150,
        height: 250,
        decoration: BoxDecoration(
            color: Color(0xFFBF2F1F1),
            borderRadius: BorderRadius.circular(30.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey[200],
                blurRadius: 3,
                offset: Offset(2, 7),
              )
            ]),
        child: FittedBox(
          child: Column(
            children: [
              Image.asset(imagepath),
              Text(productname, style: TextStyle(fontSize: 60)),
              Text('$price', style: TextStyle(fontSize: 40)),
            ],
          ),
        ),
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 20),
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Container(
                    margin: EdgeInsets.only(left:10, bottom: 20), 
                    child: Text(
                      'Search Results',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      )
                  ),
                  ///FILTER OPTIONS DAYUN DIRI///
                ]
              )
            ),
            SliverGrid.count(
              crossAxisCount: 2,
              mainAxisSpacing: 25.0,
              //childAspectRatio: 1.0,
              children: products
                  .map((product) => _productTemplate(
                      product.imagePath, product.productName, 11000))
                  .toList(),
             ),
          ],
        ),
      ),
    );
  }
}