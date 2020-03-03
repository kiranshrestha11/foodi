import 'package:flutter/material.dart';
import 'package:foodi/models/meal.dart';
import 'package:foodi/screens/category_overview_screen.dart';
import 'package:foodi/screens/favourite_screen.dart';
import 'package:foodi/widgets/main_drawer.dart';

class BottomBarScreen extends StatefulWidget {
  static const String routeName = "/bottom_bar_screen";
  final List<Meal> favouriteMeals;
  BottomBarScreen(this.favouriteMeals);
  @override
  _BottomBarScreenState createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  List<Map<String, Object>> _pages = [];

  int _selectedPageIndex = 0;
  void _selectedPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void initState() {
    _pages = [
      {'page': CategoryOverviewScreeen(), 'title': "Categories"},
      {'page': FavouriteScreen(widget.favouriteMeals), 'title': "Favourites"},
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        onTap: _selectedPage,
        currentIndex: _selectedPageIndex,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black54,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            title: Text('Categories'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            backgroundColor: Theme.of(context).primaryColor,
            title: Text('Favourites'),
          ),
        ],
      ),
    );
  }
}
