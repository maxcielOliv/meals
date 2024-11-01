import 'package:flutter/material.dart';
import 'package:meals/src/components/main_drawer.dart';
import 'package:meals/src/models/meal.dart';
import 'package:meals/src/screens/categories_page.dart';
import 'package:meals/src/screens/favorite_page.dart';

class TabsPage extends StatefulWidget {
  const TabsPage({super.key, required this.favoriteMeals});

  final List<Meal> favoriteMeals;

  @override
  State<TabsPage> createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  int _selectedScreenIndex = 0;
  late List<Map<String, Object>> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      {'title': 'Lista de Categorias', 'screen': CategoriesPage()},
      {
        'title': 'Meus Favoritos',
        'screen': FavoritePage(
          favoriteMeals: widget.favoriteMeals,
        )
      },
    ];
  }

  _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          _screens[_selectedScreenIndex]['title'] as String,
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ),
      drawer: const MainDrawer(),
      body: _screens[_selectedScreenIndex]['screen'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).cardColor,
        currentIndex: _selectedScreenIndex,
        items: const [
          BottomNavigationBarItem(
            label: 'Categorias',
            icon: Icon(Icons.category),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favoritos',
          ),
        ],
      ),
    );
  }
}
