import 'package:flutter/material.dart';
import 'package:foodi/screens/category_overview_screen.dart';
import 'package:foodi/screens/favourite_screen.dart';

class TabViewScreen extends StatefulWidget {
  @override
  _TabViewScreenState createState() => _TabViewScreenState();
}

class _TabViewScreenState extends State<TabViewScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Foodi"),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.category),
                text: 'Categories',
              ),
              Tab(
                icon: Icon(Icons.favorite),
                text: 'Favourites',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            CategoryOverviewScreeen(),
            FavouriteScreen(),
          ],
        ),
      ),
      length: 2,
      initialIndex: 0,
    );
  }
}
