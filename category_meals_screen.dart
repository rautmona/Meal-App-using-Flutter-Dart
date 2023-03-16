import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '../models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName='/category-meals';

  final List<Meal> availableMeals;

  CategoryMealsScreen(this.availableMeals);

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  // final String categoryId;
 late String categoryTitle;
  late List<Meal> displayedMeals;
  var _loadedInitData=false;

  @override
  void initState(){
    
    super.initState();
  }

  @override
  void didChangeDependencies(){
    if(!_loadedInitData){
    final routeArgs=
     ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    categoryTitle=routeArgs['title']as String;
    final categoryId=routeArgs['id'];
    displayedMeals=widget.availableMeals.where((meal){
      return meal.categories.contains(categoryId);
    }).toList();
    _loadedInitData=true;
    }
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId){
    setState((){
      displayedMeals.removeWhere((meal)=>meal.id==mealId);
    });

  }

  @override
  Widget build(BuildContext context) {
    final routeArgs=
     ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryTitle=routeArgs['title'];
    final categoryId=routeArgs['id'];
    final categoryMeals=widget.availableMeals.where((meal){
      return meal.categories.contains(categoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body:ListView.builder(
        itemBuilder: (ctx, index) {
        return MealItem(
          id: categoryMeals[index].id,
          title: categoryMeals[index].title,
          imageUrl: categoryMeals[index].imageUrl,
          affordability: categoryMeals[index].affordability,
          complexity: categoryMeals[index].complexity,
          duration: categoryMeals[index].duration,
          );
      },
      itemCount:categoryMeals.length,
      ),
    ); 
  }
}