import 'package:flutter/material.dart';

import './categories_Screen.dart';
import './favourites_screen.dart';
import '../models/meal.dart';
import '../widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favouriteMeals;

  TabsScreen(this.favouriteMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;
  int _selectedPagesIndex = 0;

  void _selectedPages(int index) {
    setState(() {
      _selectedPagesIndex = index;
    });
  }

  @override
  void initState() {
    _pages = [
      {
        'page': CategoriesScreen(),
        'title': 'Categories',
      },
      {
        'page': FavoritesScreen(widget.favouriteMeals),
        'title': 'Your Favourites',
      }
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPagesIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPagesIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).accentColor,
          currentIndex: _selectedPagesIndex,
          onTap: _selectedPages,
          backgroundColor: Theme.of(context).primaryColor,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.category), title: Text('Categories')),
            BottomNavigationBarItem(
                icon: Icon(Icons.star), title: Text('Favourites')),
          ]),
    );
  }
}
