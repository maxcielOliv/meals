import 'package:flutter/material.dart';
import 'package:meals/src/components/meal_item.dart';
import 'package:meals/src/data/dummy_data.dart';
import 'package:meals/src/models/category.dart';

class CategoriesMealsPage extends StatelessWidget {
  const CategoriesMealsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)!.settings.arguments as Category;
    final categoryMeals = dummyMeals.where((meal) {
      return meal.categories.contains(category.id);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(category.title),
      ),
      body: ListView.builder(
        itemCount: categoryMeals.length,
        itemBuilder: (context, index) {
          return MealItem(
            meal: categoryMeals[index],
          );
        },
      ),
    );
  }
}
