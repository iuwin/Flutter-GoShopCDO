import 'package:flutter/material.dart';
import 'package:sampleflutter/custom_widget/list_tile_widget.dart';
import 'package:sampleflutter/custom_widget/title_widget.dart';
import 'package:sampleflutter/custom_widget/trend_tab_bar_widget.dart';

class TabBarControllers extends StatelessWidget {
  BuildContext context;
  ScrollController scrollController;
  TabController tabController;
  List<String> tabs;
  String title;

  TabBarControllers(
      {this.context,
      this.scrollController,
      this.tabController,
      this.tabs,
      this.title});

  Widget build(BuildContext context) {
    return NestedScrollView(
      controller: scrollController,
      // ensure that the app bar shows a shadow
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        // These are the slivers that show up in the "outer" scroll view.
        return <Widget>[
          // create a sliver that absorb the overlap and report to the sliveroverlapabsorvhandle
          SliverSafeArea(
            sliver: SliverAppBar(
              automaticallyImplyLeading: false,
              title: Icon(Icons.filter_list,
                  color: Colors.black), // This is the title in the app bar.
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
                background: TitleWidget(title: title),
              ),
              expandedHeight: 170.0,
              forceElevated: innerBoxIsScrolled,
              bottom: TrendTabBar(
                  tabs: this.tabs, tabController: this.tabController),
            ),
          ),
        ];
      },
      body: TabBarView(
        children: [
          ListTileTemplate(context: context),
          ListTileTemplate(context: context),
        ],
        controller: tabController,
      ),
    );
  }
}
