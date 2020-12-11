import 'package:flutter/material.dart';

class ListTileTemplate extends StatelessWidget {
  BuildContext context;
  ListTileTemplate({this.context});
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.all(8.0),
          sliver: SliverFixedExtentList(
            itemExtent: 48.0,
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Card(
                  child: ListTile(
                    title: Text('Item $index'),
                  ),
                );
              },
              childCount: 30,
            ),
          ),
        ),
      ],
    );
  }
}
