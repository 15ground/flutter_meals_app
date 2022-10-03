import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '../models/meal.dart';

class Favorite extends StatelessWidget {
  final List<Meal> favoriteMeals;
  Favorite(this.favoriteMeals);
  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Center(
        child: Text('You have no favorites yet!'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          final c = favoriteMeals[index];
          return MealItem(
            id: c.id,
            title: c.title,
            imgSrc: c.imgSrc,
            duration: c.duration,
            complexity: c.complexity,
            affordability: c.affordability,
            removeItem: () {},
          );
        },
        itemCount: favoriteMeals.length,
      );
    }
  }
}
