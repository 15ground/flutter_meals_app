import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/main_drawer.dart';
import '../screens/favorite.dart';
import '../screens/categories.dart';

class TabsBar extends StatefulWidget {
  final List<Meal> favoriteMeals;
  TabsBar(this.favoriteMeals);
  @override
  State<TabsBar> createState() => _TabsBarState();
}

class _TabsBarState extends State<TabsBar> {
  List<Map<String, Object>> _pages = [];
  int _selectedPageIndex = 0;
  @override
  void initState() {
    _pages = [
      {'page': Categories(), 'title': 'Categories'},
      {'page': Favorite(widget.favoriteMeals), 'title': 'Favorites'}
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      // ignore: sort_child_properties_last
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            _pages[_selectedPageIndex]['title'].toString(),
            style: const TextStyle(fontFamily: 'Raleway'),
          ),
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.category),
                text: 'Categories',
              ),
              Tab(
                icon: Icon(Icons.star),
                text: 'Favorites',
              )
            ],
          ),
        ),
        drawer: MainDrawer(),
        body:
            // TabBarView(children: [Categories(), Favorite()])
            _pages[_selectedPageIndex]['page'] as Widget,
        bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: 'Categories',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites')
          ],
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.white70,
          selectedItemColor: Colors.white,
          currentIndex: _selectedPageIndex,
        ),
      ),
      length: 2,
      // initialIndex: 0,
    );
  }
}
