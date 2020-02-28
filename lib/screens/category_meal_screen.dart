import 'package:flutter/material.dart';
import 'package:foodi/dummy_data.dart';
import 'package:foodi/widgets/meal_item.dart';

class CategoryMealScreen extends StatelessWidget {
//  final String title;
//  CategoryMealScreen(this.title);
  static const String routeName = '/meal_screen';
  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context).settings.arguments as Map;
    final categoryTitle = routeArgs["title"];
    final categoryId = routeArgs["id"];
    final categoryMeals = DUMMY_MEALS
        .where((meal) => meal.categories.contains(categoryId))
        .toList();
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
