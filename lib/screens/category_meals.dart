import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';
import '../dummy_data.dart';

class CategoryMeals extends StatefulWidget {
  static const routeName = '/category-meals';
  final List<Meal> availbleMeals;
  CategoryMeals(this.availbleMeals);
  @override
  State<CategoryMeals> createState() => _CategoryMealsState();
}

class _CategoryMealsState extends State<CategoryMeals> {
  String categoryTitle = '';
  List<Meal> dislayedMeals = [];
  bool _loadedInitData = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArgs =
          ModalRoute.of(context)?.settings.arguments as Map<String, String>;
      final categoryId = routeArgs['id'];
      categoryTitle = routeArgs['title'].toString();
      dislayedMeals = widget.availbleMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      dislayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final body = ListView.builder(
      itemBuilder: (ctx, index) {
        final c = dislayedMeals[index];
        return MealItem(
          id: c.id,
          title: c.title,
          imgSrc: c.imgSrc,
          duration: c.duration,
          complexity: c.complexity,
          affordability: c.affordability,
          removeItem: _removeMeal,
        );
      },
      itemCount: dislayedMeals.length,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(
          categoryTitle!,
          style: TextStyle(fontFamily: 'Raleway'),
        ),
      ),
      body: body,
    );
  }
}
