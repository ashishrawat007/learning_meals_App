import 'package:flutter/material.dart';
import 'package:learning_meals_app/dummy_data.dart';
import ' models/meal.dart';
import 'screens/category_meals_screen.dart';
import 'screens/filters_screen.dart';
import 'screens/meal_detail_screen.dart';
import 'screens/tabs_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Map<String,bool> filters = {
    'gluten' : false ,
    'lactose' : false ,
    'vegan' : false ,
    'vegetarian' : false,
  };

List<Meal> _availableMeals = DUMMY_MEALS ;
final List<Meal> _favouriteMeals = [];

  void _setFilters(Map<String,bool> filterData)
  {
     setState(()
    {
      filters = filterData ;
      var glu = filters['gluten'] ?? false;
      var lac = filters['lactose'] ?? false;
      var vegan = filters['vegan'] ?? false;
      var vege = filters['vegetarian'] ?? false;

      _availableMeals = DUMMY_MEALS.where(
              (meal)
      {
        if( glu && meal.isGlutenFree )
          {
            return false ;
          }
        if( lac && meal.isLactoseFree )
          {
            return false ;
          }
        if( vegan && meal.isVegan )
          {
            return false ;
          }
        if( vege && meal.isVegetarian )
          {
            return false ;
          }
      return true;
      }

        ).toList();
        });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: Colors.pink,
            accentColor: Colors.amber,
            canvasColor: Color.fromRGBO(255, 254, 229, 1),
            fontFamily: 'Raleway',
            textTheme: ThemeData.light().textTheme.copyWith(
                bodyText1:
                    const TextStyle(color: Color.fromRGBO(25, 51, 51, 1)),
                bodyText2:
                    const TextStyle(color: Color.fromRGBO(25, 51, 51, 1)),
                subtitle1: const TextStyle(
                    fontSize: 20,
                    fontFamily: 'RobotoCondensed',
                    fontWeight: FontWeight.bold))),
        initialRoute: '/',
        routes: {
          '/': (ctx) => TabsScreen(),
          CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(_availableMeals),
          MealDetailScreen.routeName: (ctx)    => MealDetailScreen(),
          FilterScreen.routeName: (ctx)        => FilterScreen(filters ,_setFilters),

        },
      // onGenerateRoute: (settings)
      // {
      //   print("asdasdasd");
      //   print(settings.name);
      // },

      // onUnknownRoute: (setting)
      // {
      //
      // },

        );
  }
}
