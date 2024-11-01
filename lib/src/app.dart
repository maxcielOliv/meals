import 'package:flutter/material.dart';
import 'package:meals/src/data/dummy_data.dart';
import 'package:meals/src/models/meal.dart';
import 'package:meals/src/models/settings.dart';
import 'package:meals/src/screens/categories_meals_page.dart';
import 'package:meals/src/screens/meal_detail_page.dart';
import 'package:meals/src/screens/settings_page.dart';
import 'package:meals/src/screens/tabs_page.dart';
import 'package:meals/src/utils/app_routes.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  Settings settings = Settings();
  List<Meal> _availableMeals = dummyMeals;
  List<Meal> _favoriteMeals = [];
  void _filterMeals(Settings settings) {
    setState(() {
      this.settings = settings;
      _availableMeals = dummyMeals.where((meal) {
        final filterGluten = settings.isGlutenFree && !meal.isGlutenFree;
        final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
        final filterVegan = settings.isVegan && !meal.isVegan;
        final filterVegetarian = settings.isVegetarian && !meal.isVegetarian;

        return !filterGluten &&
            !filterLactose &&
            !filterVegan &&
            !filterVegetarian;
      }).toList();
    });
  }

  void _toggleFavorite(Meal meal) {
    setState(() {
      _favoriteMeals.contains(meal)
          ? _favoriteMeals.remove(meal)
          : _favoriteMeals.add(meal);
    });
  }

  bool _isFavorite(Meal meal) {
    return _favoriteMeals.contains(meal);
  }

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
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
              ),
            ),
        cardColor: Colors.amber,
        // drawerTheme: const DrawerThemeData(
        //   backgroundColor: Colors.amber,
        // ),
      ),
      routes: {
        AppRoutes.home: (context) => TabsPage(
              favoriteMeals: _favoriteMeals,
            ),
        AppRoutes.categoriesMeals: (context) => CategoriesMealsPage(
              meals: _availableMeals,
            ),
        AppRoutes.mealDetail: (context) => MealDetailPage(
              onToggleFavorite: _toggleFavorite,
              isFavorite: _isFavorite,
            ),
        AppRoutes.settings: (context) =>
            SettingsPage(settings: settings, onSettingsChanged: _filterMeals)
      },
    );
  }
}
