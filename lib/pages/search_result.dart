import 'package:flutter/material.dart';
import 'package:sampleflutter/product.dart';
import 'package:sampleflutter/custom_widget/trend_product_template_widget.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 20),
        child: CustomScrollView(
          slivers: [
            SliverList(
                delegate: SliverChildListDelegate([
              Container(
                  margin: EdgeInsets.only(left: 10, bottom: 20),
                  child: Text(
                    'Search Results',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  )),

              ///FILTER OPTIONS DAYUN DIRI///
            ])),
            SliverGrid.count(
              crossAxisCount: 2,
              mainAxisSpacing: 25.0,
              //childAspectRatio: 1.0,
              children: products
                  .map((product) => TrendProductTemplate(
                      imagePath: product.imagePath,
                      productName: product.productName,
                      price: 11000))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
