import 'package:flutter/material.dart';
import 'package:meals/src/home_page.dart';
import 'package:meals/src/screens/categories_meals_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.pink,
        primarySwatch: Colors.pink,
        fontFamily: 'Raleway',
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
              titleSmall:
                  const TextStyle(fontSize: 20, fontFamily: 'RobotoCondensed'),
            ),
      ),
      routes: {
        '/': (context) => const HomePage(),
        '/categories-meals': (context) => const CategoriesMealsPage()
      },
    );
  }
}
