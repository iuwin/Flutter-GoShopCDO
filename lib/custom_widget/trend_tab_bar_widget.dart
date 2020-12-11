import 'package:flutter/material.dart';

class TrendTabBar extends StatelessWidget implements PreferredSizeWidget {
  List<String> tabs;
  TabController tabController;

  TrendTabBar({this.tabs, this.tabController});

  Widget build(BuildContext context) {
    return TabBar(
      isScrollable: true,
      unselectedLabelColor: Colors.grey,
      labelColor: Colors.black,
      indicatorSize: TabBarIndicatorSize.label,
      indicatorColor: Color(0xFFB308278),
      tabs: tabs
          .map((tabName) => Tab(
                text: tabName,
              ))
          .toList(),
      controller: tabController,
    );
  }

  @override
  // TODO: implement preferredSize
  // Size get preferredSize => throw UnimplementedError();
  Size get preferredSize => const Size.fromHeight(50);
}
