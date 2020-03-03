import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodi/models/meal.dart';
import 'package:foodi/widgets/meal_item.dart';

class FavouriteScreen extends StatelessWidget {
  final List<Meal> favouriteMeals;

  FavouriteScreen(this.favouriteMeals);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: favouriteMeals.length,
      itemBuilder: (ctx, i) {
        return MealItem(
          imageUrl: favouriteMeals[i].imageUrl,
          id: favouriteMeals[i].id,
          title: favouriteMeals[i].title,
          duration: favouriteMeals[i].duration,
          complexity: favouriteMeals[i].complexity,
          affordability: favouriteMeals[i].affordability,
        );
      },
    );
  }
}
