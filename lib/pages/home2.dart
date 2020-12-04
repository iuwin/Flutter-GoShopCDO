import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sampleflutter/product.dart';
import 'search_result.dart';
import 'bag.dart';
import 'profile.dart';

class Home2 extends StatefulWidget {
  _Home2State createState() => _Home2State();
}

class _Home2State extends State<Home2> with SingleTickerProviderStateMixin  {

  TabController _tabController;
  int _currentIndex = 0;
  List<Product> products = new List<Product>();
  List<Product> clothing = new List<Product>();
  List<Product> gadgets = new List<Product>();
  List<Product> furnitures = new List<Product>();
  List<Product> toys = new List<Product>();
  List<Product> hardware = new List<Product>();


  void _getProducts(){
    products = initProducts();
    // products.forEach((product) => {
    //   if(product.category == 'clothing'){
    //     clothing.add(product)
    //   }else if(product.category == 'gadgets'){
    //     gadgets.add(product)
    //   }else if(product.category == 'furniture'){
    //     furnitures.add(product)
    //   }else if(product.category == 'toy'){
    //     toys.add(product)
    //   }else if(product.category == 'hardware'){
    //     hardware.add(product)  
    //   }
    // });
    for (var product in products){
      if(product != null){
        print('wala man pota');
        if(product.category == 'clothing'){
          print('clothing');
          clothing.add(product);
          
        }else if(product.category == 'gadgets'){
          gadgets.add(product);
          print('gadget');
        }else if(product.category == 'furniture'){
          furnitures.add(product);
          print('furniture');
        }else if(product.category == 'toy'){
          toys.add(product);
          print('toy');
        }else if(product.category == 'hardware'){
          hardware.add(product);
          print('hardware');
        }
      }
    }
  } 

  @override
  void initState() {
    super.initState();
    _getProducts();
    _tabController = new TabController(length: 5, vsync: this);
  }


  ///PRODUCT TEMPLATE
  Widget _productTemplate(String imagepath, String productname, double price) {
    return Center(
      child: Container(
        width: 150,
        height: 200,
        margin: EdgeInsets.only(
          right: 20,
          bottom: 10,
        ),
        padding: EdgeInsets.fromLTRB(00, 0, 0, 0),
        decoration: BoxDecoration(
            color: Color(0xFFBF2F1F1),
            borderRadius: BorderRadius.circular(30.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey[200],
                blurRadius: 10,
                offset: Offset(1, 5),
              )
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset(imagepath, width: 120, height: 120,),
            SizedBox(height: 10),
            Container(
              width: 145,
              padding: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5)
              ),
              child: Column(
                children: [
                  Text(productname, style: TextStyle(fontWeight: FontWeight.bold),),
                  SizedBox(height: 5),
                  Text('$price'),
                ],
              )
            )
          ],
        ),
      ),
    );
  }


  ///CATEGORIES
  Widget _categoryTabBar() => TabBar(
    isScrollable: true,
    unselectedLabelColor: Colors.grey,
    labelColor: Colors.black,
    indicatorSize: TabBarIndicatorSize.label,
    indicatorColor: Color(0xFFB308278),
    tabs: <Tab> [
      Tab(
        text: 'Clothing',
      ),
      Tab(
        text: 'Gadgets'
      ),
      Tab(
        text: 'Furnitures'
      ),
      Tab(
        text: 'Toys'
      ),
      Tab(
        text: 'Hardware'
      )
    ],
    controller: _tabController,
  );

  // Widget _categoryTabBarView(tabs) => TabBarView(
  //   children: tabs,
  //   controller: _tabController,
  // );

  Widget _categoryTabBarContent(List<Product> productList) => SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    padding: EdgeInsets.fromLTRB(25.0, 0, 25.0, 0),
    child: Row(
      children: productList
          .map((product) => _productTemplate(
              product.imagePath, product.productName, 11000))
          .toList(),
    ),
  );


  Widget _homeBody(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverSafeArea(
          sliver: SliverAppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            title: Icon(Icons.filter_list, color: Colors.black),
            //title: Text('Home', style: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold)),
            actions: [
              IconButton(
                icon: Icon(Icons.search, color: Colors.black, size: 30,),
                onPressed: (){
                  showSearch(context: context, delegate: Search());
                },
              ),
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
               _categoryTabBar(),
              SizedBox(
                height: 25,
              ),
              Container(
                height: 220,
                child: TabBarView(
                  children: [
                    _categoryTabBarContent(clothing),
                    _categoryTabBarContent(gadgets),
                    _categoryTabBarContent(furnitures),
                    _categoryTabBarContent(toys),
                    _categoryTabBarContent(hardware),
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
          delegate: SliverChildListDelegate(
            [
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
                  children: products
                      .map((product) => _productTemplate(
                          product.imagePath, product.productName, 11000))
                      .toList(),
                ),
              ),
            ]
          )
        ),
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
        selectedItemColor: Color(0xFFB308278),
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text(
              'Home',
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
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
      null,
      Profile()
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