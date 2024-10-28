import 'package:flutter/material.dart';
import 'package:meals/src/screens/categories_meals_page.dart';
import 'package:meals/src/screens/meal_detail_page.dart';
import 'package:meals/src/screens/tabs_page.dart';
import 'package:meals/src/utils/app_routes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.pink,
          primarySwatch: Colors.amber,
          fontFamily: 'Raleway',
          canvasColor: const Color.fromRGBO(255, 254, 229, 1),
          textTheme: ThemeData.light().textTheme.copyWith(
                titleSmall: const TextStyle(
                    fontSize: 20, fontFamily: 'RobotoCondensed'),
              ),
          cardColor: Colors.amber),
      routes: {
        AppRoutes.home: (context) => const TabsPage(),
        AppRoutes.categoriesMeals: (context) => const CategoriesMealsPage(),
        AppRoutes.mealDetail: (context) => const MealDetailPage()
      },
    );
  }
}
