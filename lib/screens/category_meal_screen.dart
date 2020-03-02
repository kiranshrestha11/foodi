import 'package:flutter/material.dart';
import 'package:foodi/dummy_data.dart';
import 'package:foodi/models/meal.dart';
import 'package:foodi/widgets/meal_item.dart';

class CategoryMealScreen extends StatefulWidget {
//  final String title;
//  CategoryMealScreen(this.title);
  static const String routeName = '/meal_screen';
  final List<Meal> availableMeals;
  CategoryMealScreen(this.availableMeals);

  @override
  _CategoryMealScreenState createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  String categoryTitle;
  List<Meal> categoryMeals;
//----didChangeDependencies is used because widgets value is return only after initState----
  @override
  void didChangeDependencies() {
    final routeArgs = ModalRoute.of(context).settings.arguments as Map;
    categoryTitle = routeArgs["title"];
    final categoryId = routeArgs["id"];
    categoryMeals = widget.availableMeals
        .where((meal) => meal.categories.contains(categoryId))
        .toList();
    super.didChangeDependencies();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemCount: categoryMeals.length,
        itemBuilder: (ctx, i) {
          return MealItem(
            imageUrl: categoryMeals[i].imageUrl,
            id: categoryMeals[i].id,
            title: categoryMeals[i].title,
            duration: categoryMeals[i].duration,
            complexity: categoryMeals[i].complexity,
            affordability: categoryMeals[i].affordability,
          );
        },
      ),
    );
  }
}
