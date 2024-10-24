import 'package:flutter/material.dart';
import 'package:meals/src/components/category_item.dart';
import 'package:meals/src/data/dummy_data.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: const EdgeInsets.all(25),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        children: dummyCategories.map((cat) {
          return CategoryItem(category: cat);
        }).toList());
  }
}
