import 'package:flutter/material.dart';
import '../ models/meal.dart';
import 'package:learning_meals_app/meal_item.dart';
import '../dummy_data.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/categories-meals';

  late final List<Meal> availableMeal;
  CategoryMealsScreen(this.availableMeal);

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {

  String? categoryTile = "asdasd";
  List<Meal>? displayedMeals;
  bool _loadedInitData = false;


  @override
  void didChangeDependencies() {
   if(_loadedInitData == false)
   {
     final routeArgs = ModalRoute.of(context)!.settings.arguments as Map<String, String>;
     categoryTile = routeArgs['title'];
     final categoryId = routeArgs['id'];
     displayedMeals = widget.availableMeal.where((meal) =>
         meal.categories.contains(categoryId)
     ).toList();
     bool _loadedInitData = true;
     //print(disMeals[0].title);
   }
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId)
  {
    print("insisde of thissa ds asdasdasda");
    setState(() {
      displayedMeals!.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTile!),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              id: displayedMeals![index].id ,
              imgUrl: displayedMeals![index].imageUrl,
              title: displayedMeals![index].title,
              duration: displayedMeals![index].duration,
              complexity: displayedMeals![index].complexity,
              affordability: displayedMeals![index].affordability,
              removeItem: _removeMeal,
            );
          },
          itemCount: displayedMeals?.length,
        )

    );
  }
}
