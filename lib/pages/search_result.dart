import 'package:flutter/material.dart';
import 'package:sampleflutter/product.dart';

class SearchResult extends StatefulWidget {
  @override
  _SearchResultState createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {

  List<Product> products;
  String _selectedFilter = 'Best match';
  List<String> _filters = ['Best match', 'Price', 'Location'];

  @override
  void initState() { 
    super.initState();
    products = initProducts();
  }


  Widget _productTemplate(String imagepath, String productname, double price) {
    return Center(
      child: GestureDetector(
          onTap: (){
            Navigator.pushNamed(context, '/viewproduct');
          },
          child: Container(
          width: 150,
          height: 200,
          padding: EdgeInsets.only(bottom: 5),
          decoration: BoxDecoration(
              color: Colors.white,//Color(0xFFBF2F1F1),
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[300],
                  blurRadius: 8,
                  offset: Offset(1, 3),
                )
              ]
              ),
          child: FittedBox(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset(imagepath, width: 120, height: 120,),
                SizedBox(height: 10),
                Container(
                width: 150,   
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(productname, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                          Row(
                            
                            children: [
                              Icon(Icons.star, size: 18, color: Colors.amber),
                              Text('5')
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Text('\$ $price', style: TextStyle(color: Color(0xFFB308278), fontWeight: FontWeight.bold, fontSize: 15)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.location_on, size: 18, color: Colors.grey,),
                              Text('Carmen')
                            ],
                          ),
                          Icon(Icons.favorite_border, size: 18)
                        ],
                      )
                    ],
                  )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }


  Widget _searchBar() => Container(
    height: 70,//MediaQuery.of(context).size.height * .15,
    decoration: BoxDecoration(
      color: Color(0xFFB308278),//Colors.grey[200],
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
          IconButton(
            icon: Icon(Icons.arrow_back, size: 20),
            color: Colors.white,
            onPressed: (){
              Navigator.pushNamed(context, '/home');
            },
          ),
          Container(
            height: 40,
            width: MediaQuery.of(context).size.width * .73,
            child:TextFormField(
              onTap: (){
                Navigator.pushNamed(context, '/search');
              },
              decoration: InputDecoration(
                hintText: 'Search product',
                // suffixIcon: IconButton(
                //   onPressed: (){},
                //   icon: Icon(Icons.clear, size: 20),
                //   color: Colors.grey,
                // ),
                prefixIcon: Icon(Icons.search, color: Colors.grey,),
                fillColor: Colors.white,
                filled: true,
                contentPadding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 1.0),
                ),
              )
          ),
        ),
        SizedBox(width: 10),
        Icon(Icons.shopping_cart, color: Colors.grey[100], size: 35),
      ], 
    ),
  );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.only(top: 20),
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  _searchBar(),
                  SizedBox(height: 15),
                  Row(  
                    children: [
                      SizedBox(width: 15),
                      Container(
                        height: 40,
                        color: Colors.grey[200],
                        padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            style: TextStyle(color: Colors.black87),
                            hint: Text(_selectedFilter,),
                            onChanged: (value) { 
                              setState(() {
                                _selectedFilter = value;
                              });
                            },
                            items: _filters.map((filter) => 
                              DropdownMenuItem<String>(
                                value: filter,
                                child: Text(filter)
                              )
                            ).toList()
                          ),
                        ),
                      ) 
                    ]
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Divider (height: 30.0, color: Colors.grey[350], ),
                  ),
                  // Container(
                  //   margin: EdgeInsets.only(left:10, bottom: 20), 
                  //   child: Text(
                  //     'Search Results',
                  //     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  //     )
                  // ),
                  ///FILTER OPTIONS DAYUN DIRI///
                ]
              )
            ),
            SliverGrid.count(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
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