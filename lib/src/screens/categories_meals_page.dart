import 'package:flutter/material.dart';
import 'package:meals/src/models/category.dart';

class CategoriesMealsPage extends StatelessWidget {
  const CategoriesMealsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)!.settings.arguments as Category;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(category.title),
      ),
      body: const Center(
        child: Text('Receitas por Categoria'),
      ),
    );
  }
}
