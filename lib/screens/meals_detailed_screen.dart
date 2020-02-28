import 'package:flutter/material.dart';

class MealDetailScreen extends StatelessWidget {
  static const String routeName = "/meal_details_screen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail'),
      ),
    );
  }
}
