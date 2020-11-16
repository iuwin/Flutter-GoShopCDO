import 'package:flutter/material.dart';
import 'package:sampleflutter/product.dart';

class Home2 extends StatefulWidget {
  _Home2State createState() => _Home2State();
}

class _Home2State extends State<Home2> {
  int _currentIndex = 0;
  List<Product> product = [
    Product(imagePath: 'assets/profile.png', productName: 'Samsung'),
    Product(imagePath: 'assets/profile.png', productName: 'Real Me'),
    Product(imagePath: 'assets/profile.png', productName: 'My phone'),
    Product(imagePath: 'assets/profile.png', productName: 'I phone'),
    Product(imagePath: 'assets/profile.png', productName: 'Cherry Mobile'),
  ];

  ///SEARCH BAR
  Widget _searchBar() => Container(
        height: 50,
        decoration: BoxDecoration(
            color: Color(0xFFBF0F2F9),
            borderRadius: BorderRadius.circular(5.0)),
        child: TextField(
          decoration: InputDecoration(
              hintText: 'Search',
              hintStyle: TextStyle(color: Colors.grey),
              contentPadding: EdgeInsets.fromLTRB(5, 15, 10, 15),
              prefixIcon: Icon(Icons.search, size: 20.0),
              border: InputBorder.none),
        ),
      );

  ///CATEGORIES
  Widget _buildCategory({String category}) => GestureDetector(
        child: Text(
          category,
          style: TextStyle(
            color: Colors.grey[500],
          ),
        ),
        onTap: () {},
      );

  ///INDIVIDUAL PRODUCTS
  Widget _productTemplate(String imagepath, String productname, double price) {
    return Center(
      child: Container(
        width: 150,
        height: 200,
        margin: EdgeInsets.only(
          bottom: 10,
        ),
        padding: EdgeInsets.fromLTRB(10, 15, 10, 10),
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
        child: Column(
          children: [
            Image.asset(imagepath),
            Text(productname),
            Text('$price'),
          ],
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: _HomeBody(context),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color(0xFFB296961),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text(
              'Home',
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket),
            title: Text('Products'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            title: Text('Notifications'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Profile'),
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }

  Widget _HomeBody(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverSafeArea(
          sliver: SliverAppBar(
            title: Text('Hello'),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              _searchBar(),
              SizedBox(
                height: 25,
              ),
              Text(
                'Featured',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildCategory(category: 'Gadgets'),
                  SizedBox(
                    width: 25,
                  ),
                  _buildCategory(category: 'Clothing'),
                  SizedBox(
                    width: 25,
                  ),
                  _buildCategory(category: 'Groceries'),
                  SizedBox(
                    width: 25,
                  ),
                  _buildCategory(category: 'Furniture'),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _productTemplate('assets/profile.png', 'iPhone12', 11000),
                    SizedBox(
                      width: 25,
                    ),
                    _productTemplate('assets/profile.png', 'iPhone12', 11000),
                    SizedBox(
                      width: 25,
                    ),
                    _productTemplate('assets/profile.png', 'iPhone12', 11000),
                    SizedBox(
                      width: 25,
                    ),
                    _productTemplate('assets/profile.png', 'iPhone12', 11000),
                    SizedBox(
                      width: 25,
                    ),
                    _productTemplate('assets/profile.png', 'iPhone12', 11000),
                    SizedBox(
                      width: 25,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: Text(
            'Live Selling',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SliverGrid.count(
          crossAxisCount: 2,
          mainAxisSpacing: 25.0,
          //childAspectRatio: 1.0,
          children: [
            _productTemplate('assets/profile.png', 'iPhone12', 11000),
            _productTemplate('assets/profile.png', 'iPhone12', 11000),
            _productTemplate('assets/profile.png', 'iPhone12', 11000),
            _productTemplate('assets/profile.png', 'iPhone12', 11000),
            _productTemplate('assets/profile.png', 'iPhone12', 11000),
            _productTemplate('assets/profile.png', 'iPhone12', 11000),
          ],
        ),
      ],
    );
  }
}