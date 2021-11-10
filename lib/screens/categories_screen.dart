import 'package:flutter/material.dart';
import 'package:learning_meals_app/widgets/category_item.dart';
import '../dummy_data.dart';

class CategoriesScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GridView(
        padding : EdgeInsets.all(10),
        children: DUMMY_CATEGORIES.map(
                (catData) => CategoryItem( id: catData.id , title: catData.title,  clr:  catData.color) )
             .toList(),

        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3/2,
          crossAxisSpacing: 20,
          mainAxisSpacing:  20,
        ),

      );

  }
}
