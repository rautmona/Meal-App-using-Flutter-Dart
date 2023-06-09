import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';
import './favorites_screen.dart';
import './categories_screen.dart';
import '../models/meal.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  TabsScreen(this.favoriteMeals);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  late List<Map<String, Object>>_pages;
  int _selectedPageIndex=0;

  @override
  void initState(){
    _pages=[
       {
      'page':CategoriesScreen(),
      'title':'Categories',
      },
    {
      'page':FavoriteScreen(widget.favoriteMeals),
      'title':'Your Favorite',
      },
  ];
  super.initState();
  }

  void _selectPage(int index){
    setState(() {
      _selectedPageIndex=index;
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title:Text(_pages[_selectedPageIndex]['title']as String),
    ),
    drawer: MainDrawer(),
    body: _pages[_selectedPageIndex]['page'] as dynamic,
    bottomNavigationBar:BottomNavigationBar(
      onTap: _selectPage,
      backgroundColor: Theme.of(context).primaryColor,
      unselectedItemColor:Colors.black,
      selectedItemColor: Colors.black,
      currentIndex: _selectedPageIndex,
      //type: BottomNavigationBarType.fixed,

      items: [
        BottomNavigationBarItem(
          backgroundColor: Theme.of(context).primaryColor,
          icon: Icon(Icons.category),
          label: 'Categories',
         // title:Text('Categories'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.star),
            label: 'Favorites',
           // title:Text('Favorites'),
            ),
          ],
          )
     
    ) ;

  }
}