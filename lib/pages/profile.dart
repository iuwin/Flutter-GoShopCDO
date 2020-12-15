import 'package:flutter/material.dart';
import 'package:sampleflutter/custom_widget/profile_picture.dart';
// import 'package:sampleflutter/product.dart';
// import 'package:sampleflutter/custom_widget/trend_product_template_widget.dart';
import 'package:sampleflutter/custom_widget/trend_tab_bar_widget.dart';
import 'package:sampleflutter/custom_widget/title_widget.dart';
import 'package:sampleflutter/custom_widget/list_tile_widget.dart';

// import 'package:sampleflutter/custom_widget/tab_bar_controller_widget.dart';
class Profile extends StatefulWidget {
  _StateProfile createState() => _StateProfile();
}

class _StateProfile extends State<Profile> with SingleTickerProviderStateMixin {
  @override
  final List<String> _tabs = ['Transaction', 'Favorites'];

  TabController _tabController;
  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: _tabs.length, vsync: this);
    _scrollController = new ScrollController();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  // Start of the user Profile Section Compose of profile, info, ratings..
  Widget _userProfile(List<String> _tabs, TabController _tabController) {
    return Stack(children: <Widget>[
      Container(
        width: MediaQuery.of(context).size.width * 1,
        height: MediaQuery.of(context).size.height * .5,
        decoration: BoxDecoration(
          color: Colors.black12,
        ),
        // bar for settings, help .....

        child: CustomScrollView(slivers: [
          SliverSafeArea(
            sliver: SliverAppBar(
              automaticallyImplyLeading: false,
              title: Icon(Icons.filter_list, color: Colors.black),
              pinned: false,
              floating: false,
              snap: false,
              // elevation: 0,
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
              backgroundColor: Colors.white,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.pin,
                background: TitleWidget(title: 'Profile'),
              ),
              expandedHeight: MediaQuery.of(context).size.height * .5,
              bottom: TrendTabBar(
                  tabs: this._tabs, tabController: this._tabController),
            ),
          ),
        ]),
      ),
      _profileImage(),
    ]);
  }

  // Widget for profile picture
  Widget _profileImage() {
    return Positioned(
      left: MediaQuery.of(context).size.width / 5,
      right: MediaQuery.of(context).size.width / 5,
      top: MediaQuery.of(context).size.height / 15,
      child: ProfilePicture(),
    );
  }

  // transaction
  Widget _defaultTabControllerWidget(context) {
    return NestedScrollView(
        controller: _scrollController,
        // ensure that the app bar shows a shadow
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          // These are the slivers that show up in the "outer" scroll view.
          return <Widget>[
            // create a sliver that absorb the overlap and report to the sliveroverlapabsorvhandle
            SliverSafeArea(
              sliver: SliverToBoxAdapter(
                child: _userProfile(_tabs, _tabController),
              ),
            ),
          ];
        },
        body: TabBarView(
          children: [
            ListTileTemplate(context: context),
            ListTileTemplate(context: context),
          ],
          controller: _tabController,
        ));
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _defaultTabControllerWidget(context),
      ),
    );
  }
}
