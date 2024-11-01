import 'package:flutter/material.dart';
import 'package:meals/src/components/meal_item.dart';
import 'package:meals/src/models/meal.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key, required this.favoriteMeals});

  final List<Meal> favoriteMeals;

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Center(
        child: Text('Nenhuma Refeição foi marcada como favorita!'),
      );
    } else {
      return ListView.builder(
        itemCount: favoriteMeals.length,
        itemBuilder: (context, index) {
          return MealItem(meal: favoriteMeals[index]);
        },
      );
    }
  }
}
