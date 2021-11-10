import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:learning_meals_app/screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(
      {required String title, required IconData icon, required VoidCallback tapHandler}) {
    return ListTile(
      leading: Icon(icon, size: 26),
      title: Text(
        title,
        style: const TextStyle(
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
    return Drawer(
      child: Column(
        children: [
          Container(color: Colors.yellow, height: 40),
          Container(
            color: Colors.yellow,
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            child: Text(
              'Cooking Up',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Theme.of(context).primaryColor),
            ),
          ),
          const SizedBox(height: 20),
          buildListTile(
              icon: Icons.restaurant,
              title: "Meals",
              tapHandler: () {
                Navigator.of(context).pushReplacementNamed('/');
              }
          ),
          buildListTile(
              icon: Icons.settings,
              title: "filter",
              tapHandler: () {
                Navigator.of(context).pushReplacementNamed(FilterScreen.routeName);
              }
          )
        ],
      ),
    );
  }
}
