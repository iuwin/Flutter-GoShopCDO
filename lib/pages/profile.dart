import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  _StateProfile createState() => _StateProfile();
}

class _StateProfile extends State<Profile> {
  @override
  final List<String> _tabs = ['Transaction'];

  // Start of the user Profile Section Compose of profile, info, ratings..
  Widget _userProfile() {
    return Stack(children: <Widget>[
      Container(
        width: MediaQuery.of(context).size.width * 1,
        height: MediaQuery.of(context).size.height * .5,
        decoration: BoxDecoration(
          color: Colors.black12,
        ),
        child: Column(children: <Widget>[
          // bar for settings, help .....
          Container(
            width: MediaQuery.of(context).size.width * 1,
            height: MediaQuery.of(context).size.height * .20,
            color: Colors.red,
          ),
          SizedBox(
            //  width: MediaQuery.of(context).size.width * 1,
            height: MediaQuery.of(context).size.height * .10,
          ),
          // Widget for user info
          Container(
            width: MediaQuery.of(context).size.width * 1,
            height: MediaQuery.of(context).size.height * .20,
            color: Colors.red,
          ),
        ]),
      ),
      _profileImage(),
    ], overflow: Overflow.visible);
  }

  // Widget for profile picture
  Widget _profileImage() {
    return Positioned(
      left: MediaQuery.of(context).size.width / 5,
      right: MediaQuery.of(context).size.width / 5,
      top: MediaQuery.of(context).size.height / 15,
      child: CircleAvatar(
        radius: 100.0,
        backgroundColor: Colors.black26,
      ),
    );
  }

  // transaction
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
                pinned: true,
                floating: true,
                snap: true,
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  background: _userProfile(),
                ),
                expandedHeight: MediaQuery.of(context).size.height * .5,
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
                        handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                            context),
                      ),
                      SliverPadding(
                        padding: const EdgeInsets.all(8.0),
                        // In this example, the inner scroll view has
                        // fixed-height list items, hence the use of
                        // SliverFixedExtentList. However, one could use any
                        // sliver widget here, e.g. SliverList or SliverGrid.
                        sliver: SliverFixedExtentList(
                          // The items in this example are fixed to 48 pixels
                          // high. This matches the Material Design spec for
                          // ListTile widgets.
                          itemExtent: 48.0,
                          delegate: SliverChildBuilderDelegate(
                            (BuildContext context, int index) {
                              // This builder is called for each child.
                              // In this example, we just number each list item.
                              return Card(
                                child: ListTile(
                                  title: Text('Item $index'),
                                ),
                              );
                            },
                            // The childCount of the SliverChildBuilderDelegate
                            // specifies how many children this inner list
                            // has. In this example, each tab has a list of
                            // exactly 30 items, but this is arbitrary.
                            childCount: 30,
                          ),
                        ),
                      ),
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
    return SafeArea(
      child: Scaffold(
        body: _defaultTabControllerWidget(context),
      ),
    );
  }
}
