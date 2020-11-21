import 'package:flutter/material.dart';
import 'package:meal_app/model/dummy_data.dart';
import 'package:meal_app/widgets/meal_item.dart';
import 'package:meal_app/model/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  // final String categoryId;
  // final String categoryTitle;

  // CategoryMealsScreen({this.categoryId, this.categoryTitle});

  static const ROUTE_NAME = '/category-meals';

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle;
  String categoryId;
  List<Meal> filteredCatagoryMeal;
  bool _loadedInitData = false;

  void initState() {
    // initState is ran before a widget tree is built, and there cotext in NOT available yet

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    print('Category_meal_screen disposed');
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    // this is ran whenever a state object's reference to a widget tree is changed, meaning a context is available here
    if (!_loadedInitData) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title'];
      categoryId = routeArgs['id'];
      filteredCatagoryMeal = DUMMY_MEALS.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _loadedInitData = true;
    }

    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      filteredCatagoryMeal.removeWhere((element) => element.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: filteredCatagoryMeal[index].id,
            title: filteredCatagoryMeal[index].title,
            imageUrl: filteredCatagoryMeal[index].imageUrl,
            duration: filteredCatagoryMeal[index].duration,
            complexity: filteredCatagoryMeal[index].complexity,
            affordability: filteredCatagoryMeal[index].affordability,
            removeItem: _removeMeal,
          );
        },
        itemCount: filteredCatagoryMeal.length,
      ),
    );
  }
}
