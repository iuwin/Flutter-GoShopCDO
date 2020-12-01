import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sampleflutter/product.dart';
import 'search_result.dart';
import 'bag.dart';

class Home2 extends StatefulWidget {
  _Home2State createState() => _Home2State();
}

class _Home2State extends State<Home2> {

  int _currentIndex = 0;
  List<Product> products;

  @override
  void initState() { 
    super.initState();
    products = initProducts();
  }

  // ///SEARCH BAR
  // Widget _searchBar() => Container(
  //       height: 50,
  //       decoration: BoxDecoration(
  //           color: Color(0xFFBF0F2F9),
  //           borderRadius: BorderRadius.circular(5.0)),
  //       child: TextField(
  //         decoration: InputDecoration(
  //             hintText: 'Search',
  //             hintStyle: TextStyle(color: Colors.grey),
  //             contentPadding: EdgeInsets.fromLTRB(5, 15, 10, 15),
  //             prefixIcon: Icon(Icons.search, size: 20.0),
  //             border: InputBorder.none),
  //       ),
  //     );

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
          right: 20,
          bottom: 10,
        ),
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(imagepath),
            Text(productname),
            Text('$price'),
          ],
        ),
      ),
    );
  }

  Widget _homeBody(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverSafeArea(
          sliver: SliverAppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            title: Text('Home', style: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold)),
            actions: [
              IconButton(
                icon: Icon(Icons.search, color: Colors.black, size: 30,),
                onPressed: (){
                  showSearch(context: context, delegate: Search());
                },
              )
            ],
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.only(left:15),
                child: Text(
                  'Trend',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
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
              ),
              SizedBox(
                height: 25,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.fromLTRB(25.0, 0, 25.0, 0),
                child: Row(
                  children: products
                      .map((product) => _productTemplate(
                          product.imagePath, product.productName, 11000))
                      .toList(),
                ),
              ),
              SizedBox(
                height: 25,
              ),
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(left: 15, bottom: 20),
            child: Text(
              'Live Selling',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
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
    );
  }


  Widget _bottomNavBar() {
    return BottomNavigationBar(
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
      );
  }


  Widget build(BuildContext context) {
    final List<Widget> _children = [
      _homeBody(context),
      Bag(),
    ];
    
    return Scaffold(
      backgroundColor: Colors.white,
      body: _children[_currentIndex],
      bottomNavigationBar: _bottomNavBar(),
    );
  }

}

//SEARCH FUNCTIONALITY 
class Search extends SearchDelegate<String>{

  //example sa
  List products = ['tshirt', 'bluetooth earphone', 'bluetooth speaker', 'fhm magazine', 'lisa poster', 'kids clothes', 'xiaomi phone']; 
  List recentSearched = ['earphones', 'twice merchs'];

  // @override
  // ThemeData appBarTheme(BuildContext context) {
  //   assert(context != null);
  //   final ThemeData theme = Theme.of(context);
  //   assert(theme != null);
  //   return theme;
  // }

  @override
  List<Widget> buildActions(BuildContext context) {
      return [
        IconButton(
          icon: Icon(Icons.clear), 
          onPressed: (){
            query = '';
          },
        )
      ];
    }
  
    @override
    Widget buildLeading(BuildContext context) {
      return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: (){
          this.close(context, null);
        },
      );
    }
    
    @override
    Widget buildResults(BuildContext context) {
      return SearchResult();
    }

    @override
    Widget buildSuggestions(BuildContext context) {
      final suggestionList = query.isEmpty 
          ? recentSearched
          : products.where((p) => p.startsWith(query)).toList();

      return ListView.builder(
        itemBuilder: (context, index) => ListTile(
          onTap: (){
            showResults(context);
          },
          title: Text(suggestionList[index]),
        ),
        itemCount: suggestionList.length,
      );
 
  }


}