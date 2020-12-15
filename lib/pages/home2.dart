import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sampleflutter/custom_widget/trend_home_product_template_widget.dart';
import 'package:sampleflutter/product.dart';
import 'bag.dart';
import 'profile.dart';
import 'post.dart';
import 'package:sampleflutter/custom_widget/trend_tab_bar_widget.dart';

class Home2 extends StatefulWidget {
  _Home2State createState() => _Home2State();
}

class _Home2State extends State<Home2> with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  TabController _tabController;
  final List<String> _tabs = [
    'Clothing',
    'Gadgets',
    'Furnitures',
    'Toys',
    'Hardware'
  ];
  List<Product> products = new List<Product>();
  List<Product> clothing = new List<Product>();
  List<Product> gadgets = new List<Product>();
  List<Product> furnitures = new List<Product>();
  List<Product> toys = new List<Product>();
  List<Product> hardware = new List<Product>();

  void _getProducts() {
    products = initProducts();
    products.forEach((product) => {
          if (product.category == 'clothing')
            {clothing.add(product)}
          else if (product.category == 'gadgets')
            {gadgets.add(product)}
          else if (product.category == 'furniture')
            {furnitures.add(product)}
          else if (product.category == 'toy')
            {toys.add(product)}
          else if (product.category == 'hardware')
            {hardware.add(product)}
        });
  }

  @override
  void initState() {
    super.initState();
    _getProducts();
    _tabController = new TabController(length: 5, vsync: this);
  }

  SingleChildScrollView _trendTabBarContent(List<Product> productList) =>
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.fromLTRB(25.0, 0, 25.0, 0),
        child: Row(
          children: productList
              .map((product) => TrendHomeProductTemplate(
                  imagePath: product.imagePath,
                  productName: product.productName,
                  price: 1000))
              .toList(),
        ),
      );

  Widget _liveSellingTemplate() => Center(
        child: Container(
          width: 150,
          height: 200,
          margin: EdgeInsets.only(
            right: 20,
            bottom: 10,
          ),
          padding: EdgeInsets.only(top: 15),
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 50,
                    height: 25,
                    decoration: BoxDecoration(
                        color: Colors.deepOrange,
                        borderRadius: BorderRadius.circular(15.0)),
                    child: Center(
                        child: Text('Live',
                            style:
                                TextStyle(color: Colors.white, fontSize: 13))),
                  ),
                  SizedBox(
                    width: 7,
                  ),
                  Container(
                    width: 70,
                    height: 25,
                    //padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        color: Colors.grey[700],
                        borderRadius: BorderRadius.circular(15.0)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.remove_red_eye,
                          color: Colors.white,
                          size: 15,
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Text(
                          '246',
                          style: TextStyle(color: Colors.white, fontSize: 13),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );

  ///body
  Widget _homeBody(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverSafeArea(
          sliver: SliverAppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            title: Icon(Icons.filter_list, color: Colors.black),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.black,
                  size: 30,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/search');
                  // showSearch(context: context, delegate: Search());
                },
              ),
            ],
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Container(
                margin: EdgeInsets.only(left: 15, right: 15, top: 20),
                padding: EdgeInsets.all(10),
                height: MediaQuery.of(context).size.height * .23,
                decoration: BoxDecoration(
                  color: Color(0xFFB308278), //Colors.lightGreen[300],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Stack(
                  overflow: Overflow.visible,
                  children: [
                    Positioned(
                        left: -23,
                        bottom: -30,
                        child: Image.asset(
                          'assets/basketball_shoes.png',
                          width: 200,
                          height: 170,
                        )),
                    Positioned(
                      top: 20,
                      right: 5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('New products',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.1)),
                          Text('shop now',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.1)),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
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
              TrendTabBar(tabs: _tabs, tabController: _tabController),
              SizedBox(
                height: 25,
              ),
              Container(
                height: 220,
                child: TabBarView(
                  children: [
                    _trendTabBarContent(clothing),
                    _trendTabBarContent(gadgets),
                    _trendTabBarContent(furnitures),
                    _trendTabBarContent(toys),
                    _trendTabBarContent(hardware),
                  ],
                  controller: _tabController,
                ),
              ),
              SizedBox(
                height: 25,
              ),
            ],
          ),
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          Padding(
            padding: const EdgeInsets.only(left: 15, bottom: 20),
            child: Text(
              'Live Selling',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.fromLTRB(25.0, 0, 25.0, 0),
            child: Row(
              children: [
                _liveSellingTemplate(),
                _liveSellingTemplate(),
                _liveSellingTemplate(),
                _liveSellingTemplate(),
                _liveSellingTemplate()
              ],
              // children: products
              //     .map((product) => _trendProductTemplate(
              //         product.imagePath, product.productName, 11000))
              //     .toList(),
            ),
          ),
        ])),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(left: 15, bottom: 20, top: 20),
            child: Text(
              'Categories',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.only(left: 15, bottom: 20, top: 20),
          sliver: SliverGrid.count(
            crossAxisCount: 2,
            mainAxisSpacing: 25.0,
            //childAspectRatio: 1.0,
            children: products
                .map((product) => TrendHomeProductTemplate(
                    imagePath: product.imagePath,
                    productName: product.productName,
                    price: 11000))
                .toList(),
          ),
        ),
      ],
    );
  }

  ///bottomnavbar
  BottomNavigationBar _bottomNavBar() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Color(0xFFB308278),
      selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text('Home'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          title: Text('Cart'),
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

  ///build
  Widget build(BuildContext context) {
    final List<Widget> _children = [
      _homeBody(context),
      Bag(),
      Post(),
      Profile()
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: _children[_currentIndex],
      bottomNavigationBar: _bottomNavBar(),
    );
  }
}

///search
// class Search extends SearchDelegate<String>{
// List products = ['tshirt', 'bluetooth earphone', 'bluetooth speaker', 'fhm magazine', 'lisa poster', 'kids clothes', 'xiaomi phone'];
// List recentSearched = ['earphones', 'twice merchs'];

//   // @override
//   // ThemeData appBarTheme(BuildContext context){
//   //   final ThemeData theme = ThemeData(
//   //     primaryColor: Color(0xFFB308278),
//   //     primaryIconTheme: IconThemeData(color: Colors.white),
//   //     primaryColorBrightness: Brightness.light,
//   //     textTheme: TextTheme(title: TextStyle(color: Colors.white)),
//   //     inputDecorationTheme: InputDecorationTheme(
//   //       hintStyle: TextStyle(color: Color.fromARGB(90, 255, 255, 255))
//   //     ),
//   //     cursorColor: Colors.white
//   //   );
//   //   return theme;
//   // }

//   @override
//   List<Widget> buildActions(BuildContext context) {
//       return [
//         IconButton(
//           icon: Icon(Icons.clear),
//           onPressed: (){
//             query = '';
//           },
//         )
//       ];
//     }

//   @override
//   Widget buildLeading(BuildContext context) {
//     return IconButton(
//       icon: AnimatedIcon(
//         icon: AnimatedIcons.menu_arrow,
//         progress: transitionAnimation,
//       ),
//       onPressed: (){
//         this.close(context, null);
//       },
//     );
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     return SearchResult();
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     final suggestionList = query.isEmpty
//         ? recentSearched
//         : products.where((p) => p.startsWith(query)).toList();

//     return ListView.builder(
//       itemBuilder: (context, index) => ListTile(
//         onTap: (){
//           showResults(context);
//         },
//         title: Text(suggestionList[index]),
//       ),
//       itemCount: suggestionList.length,
//     );
//   }
// }
