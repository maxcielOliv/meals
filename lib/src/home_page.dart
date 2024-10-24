import 'package:flutter/material.dart';
import 'package:meals/src/screens/categories_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vamos Cozinhar?'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: const CategoriesPage(),
    );
  }
}
