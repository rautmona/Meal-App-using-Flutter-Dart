import 'package:flutter/material.dart';
import 'package:meal_app/screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title,IconData icon,VoidCallback tapHandler){
    return ListTile(
        leading: Icon(
          icon,
          size: 26,
          ),
          title:Text(
            title,
            style: TextStyle(
              fontFamily: 'RobotoCondensed',
              fontSize: 24,
              fontWeight: FontWeight.bold,
              ),
              ),
              onTap: tapHandler,
          );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(child: Column(children: <Widget>[
      Container(
        height: 120,
        width: double.infinity,
        padding: EdgeInsets.all(20),
        alignment: Alignment.centerLeft,
        child: Text(
          'Cooking Up!',
          style: TextStyle(
            backgroundColor: Color.fromARGB(255, 57, 209, 236),
          fontWeight: FontWeight.w900,
          fontSize: 30,
          color: Color.fromARGB(255, 113, 24, 17),
          ),
          ),
      ),
      SizedBox(
        height: 20,
        ),
        buildListTile(
          'Meals',
          Icons.restaurant,
          (){
           Navigator.of(context).pushReplacementNamed('/');
          }
          ),
        buildListTile(
          'Filters',
          Icons.settings,
          (){
          Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
          }
          ),
       
    ],
    ),
    );
    
  }
}