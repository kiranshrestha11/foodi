import 'package:flutter/material.dart';
import 'package:foodi/widgets/category_item.dart';
import 'package:foodi/dummy_data.dart';

class CategoryOverviewScreeen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(15),
      children: DUMMY_CATEGORIES.map((catData) {
        return CategoryItem(catData.title, catData.color, catData.id);
      }).toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200.0,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
    );
  }
}
