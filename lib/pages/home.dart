import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/profile.jpg'),
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Hello Billy,',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(width: 145),
                  Container(
                    padding: EdgeInsets.all(5),
                    child: Icon(
                      Icons.shopping_cart,
                      color: Colors.white,
                      size: 30,
                    ),
                    decoration: BoxDecoration(
                        color: Color(0xFFB308278),
                        borderRadius: BorderRadius.circular(10)),
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
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
                    _productTemplate('assets/iphone12.png', 'iPhone12', 11000),
                    SizedBox(
                      width: 25,
                    ),
                    _productTemplate('assets/iphone12.png', 'iPhone12', 22000),
                    SizedBox(
                      width: 25,
                    ),
                    _productTemplate('assets/iphone12.png', 'iPhone12', 33000),
                    SizedBox(
                      width: 25,
                    ),
                    _productTemplate('assets/iphone12.png', 'iPhone12', 44000),
                    SizedBox(
                      width: 25,
                    ),
                    _productTemplate('assets/iphone12.png', 'iPhone12', 55000),
                    SizedBox(
                      width: 25,
                    ),
                    _productTemplate('assets/iphone12.png', 'iPhone12', 66000),
                    SizedBox(
                      width: 25,
                    ),
                    // _productTemplate('', '', null),
                    // SizedBox(width: 25,),
                    // _productTemplate('', '', null),
                    // SizedBox(width: 25,),
                    // _productTemplate('', '', null),
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                'Live Selling',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      )),
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
}

///SEARCH BAR
Widget _searchBar() => Container(
      height: 50,
      decoration: BoxDecoration(
          color: Color(0xFFBF0F2F9), borderRadius: BorderRadius.circular(5.0)),
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
  return Container(
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
  );
}
