import 'package:flutter/material.dart';
// import 'package:sampleflutter/product.dart';
// import 'package:sampleflutter/custom_widget/trend_product_template_widget.dart';
// import 'package:sampleflutter/custom_widget/trend_tab_bar_widget.dart';
// import 'package:sampleflutter/custom_widget/title_widget.dart';
// import 'package:sampleflutter/custom_widget/list_tile_widget.dart';
import 'package:sampleflutter/custom_widget/tab_bar_controller_widget.dart';

class Bag extends StatefulWidget {
  _StateProfile createState() => _StateProfile();
}

class _StateProfile extends State<Bag> with SingleTickerProviderStateMixin {
  final List<String> _tabs = ['My Bag', 'Posted'];

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

  Widget build(BuildContext context) {
    // to have a tab controller
    return Scaffold(
      body: TabBarControllers(
          context: context,
          scrollController: _scrollController,
          tabController: _tabController,
          tabs: _tabs,
          title: 'Cart'),
    );
  }
}
