import 'package:flutter/material.dart';
import 'package:foodi/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const String routeName = "/meal_details_screen";
  final Function toggleFavourite;
  final Function isMealFavourite;
  MealDetailScreen(this.toggleFavourite, this.isMealFavourite);

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context).settings.arguments as String;
    final SelectedMeal = DUMMY_MEALS.firstWhere((meal) {
      return meal.id == id;
    });

    Widget _buildSectionTitle(String Title) {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Text(
          Title,
          style: Theme.of(context).textTheme.title,
        ),
      );
    }

    Widget _buildSection({Widget child}) {
      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(20),
        height: 250,
        width: 315,
        child: child,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(SelectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                SelectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            _buildSectionTitle("Ingredients"),
            _buildSection(
                child: ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  color: Theme.of(context).accentColor,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Text(SelectedMeal.ingredients[index]),
                  ),
                );
              },
              itemCount: SelectedMeal.ingredients.length,
            )),
            _buildSectionTitle('Steps'),
            _buildSection(
              child: ListView.builder(
                  itemCount: SelectedMeal.steps.length,
                  itemBuilder: (ctx, index) {
                    return Column(
                      children: <Widget>[
                        ListTile(
                          leading: CircleAvatar(
                            child: Text('#${index + 1}'),
                          ),
                          title: Text(SelectedMeal.steps[index]),
                        ),
                        Divider(
                          thickness: 3,
                        ),
                      ],
                    );
                  }),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.red[100],
          child: Icon(
            isMealFavourite(SelectedMeal.id)
                ? Icons.favorite
                : Icons.favorite_border,
            color: Colors.red,
          ),
          onPressed: () => toggleFavourite(SelectedMeal.id)),
    );
  }
}
