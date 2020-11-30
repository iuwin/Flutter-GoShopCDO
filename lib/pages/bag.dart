import 'package:flutter/material.dart';
import 'package:sampleflutter/product.dart';

class Bag extends StatefulWidget {
  _StateProfile createState() => _StateProfile();
}

class _StateProfile extends State<Bag> {
  final List<String> _tabs = ['My Bag', 'Posted', 'Favorite'];
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

  Widget _defaultTabControllerWidget(context) {
    return DefaultTabController(
      length: _tabs.length, // This is the number of tabs.
      // A scrolling view inside of which can be nested other scrolling views, with their scroll positions being intrinsically linked.
      child: NestedScrollView(
        // ensure that the app bar shows a shadow
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          // These are the slivers that show up in the "outer" scroll view.
          return <Widget>[
            SliverOverlapAbsorber(
              // This widget takes the overlapping behavior of the SliverAppBar,
              // and redirects it to the SliverOverlapInjector below. If it is
              // missing, then it is possible for the nested "inner" scroll view
              // below to end up under the SliverAppBar even when the inner
              // scroll view thinks it has not been scrolled.
              // This is not necessary if the "headerSliverBuilder" only builds
              // widgets that do not overlap the next sliver.
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              // create a sliver that absorb the overlap and report to the sliveroverlapabsorvhandle
              sliver: SliverAppBar(
                title:
                    const Text('Products'), // This is the title in the app bar.
                pinned: true,
                floating: true,
                snap: true,
                flexibleSpace: Placeholder(),
                expandedHeight: 200.0,
                // The "forceElevated" property causes the SliverAppBar to show
                // a shadow. The "innerBoxIsScrolled" parameter is true when the
                // inner scroll view is scrolled beyond its "zero" point, i.e.
                // when it appears to be scrolled below the SliverAppBar.
                // Without this, there are cases where the shadow would appear
                // or not appear inappropriately, because the SliverAppBar is
                // not actually aware of the precise position of the inner
                // scroll views.
                forceElevated: innerBoxIsScrolled,
                bottom: TabBar(
                  // These are the widgets to put in each tab in the tab bar.
                  tabs: _tabs.map((String name) => Tab(text: name)).toList(),
                ),
              ),
            ),
          ];
        },
        body: TabBarView(
          // These are the contents of the tab views, below the tabs.
          children: _tabs.map((String name) {
            return Center(
              // top: false,
              // bottom: false,
              child: Builder(
                // This Builder is needed to provide a BuildContext that is
                // "inside" the NestedScrollView, so that
                // sliverOverlapAbsorberHandleFor() can find the
                // NestedScrollView.
                builder: (BuildContext context) {
                  return CustomScrollView(
                    // The "controller" and "primary" members should be left
                    // unset, so that the NestedScrollView can control this
                    // inner scroll view.
                    // If the "controller" property is set, then this scroll
                    // view will not be associated with the NestedScrollView.
                    // The PageStorageKey should be unique to this ScrollView;
                    // it allows the list to remember its scroll position when
                    // the tab view is not on the screen.
                    key: PageStorageKey<String>(name),
                    slivers: <Widget>[
                      SliverOverlapInjector(
                        // This is the flip side of the SliverOverlapAbsorber
                        // above.
                        handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                            context),
                      ),
                      SliverGrid.count(
                        crossAxisCount: 2,
                        mainAxisSpacing: 25.0,
                        //childAspectRatio: 1.0,
                        children: products
                            .map((product) => _productTemplate(
                                product.imagePath, product.productName, 11000))
                            .toList(),
                        // _productTemplate(
                        //     'assets/profile.png', 'iPhone12', 11000),
                        // _productTemplate(
                        //     'assets/profile.png', 'iPhone12', 11000),
                        // _productTemplate(
                        //     'assets/profile.png', 'iPhone12', 11000),
                        // _productTemplate(
                        //     'assets/profile.png', 'iPhone12', 11000),
                        // _productTemplate(
                        //     'assets/profile.png', 'iPhone12', 11000),
                        // _productTemplate(
                        //     'assets/profile.png', 'iPhone12', 11000),
                      ),
                      // SliverPadding(
                      //   padding: const EdgeInsets.all(8.0),
                      //   // In this example, the inner scroll view has
                      //   // fixed-height list items, hence the use of
                      //   // SliverFixedExtentList. However, one could use any
                      //   // sliver widget here, e.g. SliverList or SliverGrid.
                      //   sliver: SliverFixedExtentList(
                      //     // The items in this example are fixed to 48 pixels
                      //     // high. This matches the Material Design spec for
                      //     // ListTile widgets.
                      //     itemExtent: 48.0,
                      //     delegate: SliverChildBuilderDelegate(
                      //       (BuildContext context, int index) {
                      //         // This builder is called for each child.
                      //         // In this example, we just number each list item.
                      //         return Card(
                      //           child: ListTile(
                      //             title: Text('Item $index'),
                      //           ),
                      //         );
                      //       },
                      //       // The childCount of the SliverChildBuilderDelegate
                      //       // specifies how many children this inner list
                      //       // has. In this example, each tab has a list of
                      //       // exactly 30 items, but this is arbitrary.
                      //       childCount: 30,
                      //     ),
                      //   ),
                      // ),
                    ],
                  );
                },
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    // to have a tab controller
    return Scaffold(
      body: _defaultTabControllerWidget(context),
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: _currentIndex,
      //   type: BottomNavigationBarType.fixed,
      //   selectedItemColor: Color(0xFFB296961),
      //   items: [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       title: Text(
      //         'Home',
      //       ),
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.shopping_basket),
      //       title: Text('Products'),
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.notifications),
      //       title: Text('Notifications'),
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.person),
      //       title: Text('Profile'),
      //     ),
      //   ],
      //   onTap: (index) {
      //     setState(() {
      //       _currentIndex = index;
      //     });
      //   },
      // ),
    );
  }
}
