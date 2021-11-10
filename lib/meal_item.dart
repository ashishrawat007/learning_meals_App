import 'package:flutter/material.dart';
import 'package:learning_meals_app/%20models/meal.dart';

import 'screens/meal_detail_screen.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String imgUrl;
  final String title;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final Function removeItem;

  MealItem(
      {required this.id,
      required this.imgUrl,
      required this.title,
      required this.duration,
      required this.complexity,
      required this.affordability,
      required this.removeItem

      });

  String get complexityText{
    switch (complexity)
    {
        case Complexity.Simple:
        return 'simple';
        break ;
        case Complexity.Challenging :
        return 'Challenging';
        break ;
        case Complexity.Hard :
        return 'Hard';
        break ;
      default : return 'unknown';
    }
}

  String get affordabilityText{
    switch (affordability)
    {
      case Affordability.Affordable:
        return 'Affordable';
        break ;
      case Affordability.Luxurious :
        return 'Luxurious';
        break ;
      case Affordability.Pricey :
        return 'Pricey';
        break ;
      default : return 'unknown';
    }
  }


  @override
  Widget build(BuildContext context) {


    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(MealDetailScreen.routeName,
        arguments: id
        ).then((result) {
        if(result!= null)
          {
            removeItem(result);
          }
        });
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imgUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right:10,
                  child: Container(
                    color: Colors.black45,
                    width: 300,
                    child: Text(title,
                      style: const TextStyle(
                          fontSize:26,
                          color: Colors.white
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: [
                      const Icon(Icons.schedule),
                      const SizedBox(width: 6,),
                      Text('$duration min')
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.work),
                      const SizedBox(width: 6,),
                      Text('$complexityText ')
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.attach_money),
                      const SizedBox(width: 6,),
                      Text('$affordabilityText ')
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
