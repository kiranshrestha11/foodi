import 'package:flutter/material.dart';
import 'package:foodi/dummy_data.dart';
import 'package:foodi/screens/bottom_bar_screen.dart';
import 'package:foodi/screens/category_meal_screen.dart';
import 'package:foodi/screens/category_overview_screen.dart';
import 'package:foodi/screens/filter_screen.dart';
import 'package:foodi/screens/meals_detailed_screen.dart';
import 'package:foodi/screens/tab_view_screen.dart';
import 'models/meal.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    '_glutenFree': false,
    '_vegan': false,
    '_vegetarian': false,
    '_lactoseFree': false,
  };
  List<Meal> _availableMeals = DUMMY_MEALS;

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['_glutenFree'] && meal.isGlutenFree) {
          return false;
        }
        if (_filters['_vegan'] && meal.isVegan) {
          return false;
        }
        if (_filters['_vegetarian'] && meal.isVegetarian) {
          return false;
        }
        if (_filters['_lactoseFree'] && meal.isLactoseFree) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Foodi App',
      theme: ThemeData(
        primaryColor: Colors.deepOrange,
        accentColor: Colors.deepOrangeAccent,
        fontFamily: 'Raleway',
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              body2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              title: TextStyle(fontSize: 24, fontFamily: 'Roboto'),
            ),
      ),
      home: BottomBarScreen(),
      routes: {
        CategoryMealScreen.routeName: (ctx) =>
            CategoryMealScreen(_availableMeals),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
        BottomBarScreen.routeName: (ctx) => BottomBarScreen(),
        FilterScreen.routeName: (ctx) => FilterScreen(_setFilters, _filters),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => CategoryOverviewScreeen());
      },
    );
  }
}
