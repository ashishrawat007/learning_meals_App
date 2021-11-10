import 'package:flutter/material.dart';
import '../ models/meal.dart';
import '../widgets/main_drawer.dart';
import 'categories_screen.dart';
import 'favourite_screen.dart';

class TabsScreen extends StatefulWidget {


  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {

  List<Map<String, dynamic>> pages = [];

  @override
  initState()
  {
    pages =[
      {'page': CategoriesScreen(), 'title': 'Categories'},
      {'page': FavouriteScreen(), 'title': "Favourite"}
    ];
    super.initState();
  }
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {


    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            title: Text(pages[_selectedPageIndex]['title']),
            // bottom: const TabBar(
            //     tabs: [
            //       Tab(
            //         icon: Icon(Icons.category),
            //         text: "category",
            //       ),
            //       Tab(
            //         icon: Icon(Icons.star),
            //         text: "favourite",
            //       )
            //     ]
            // )
          ),
          drawer: MainDrawer(),
          body: pages[_selectedPageIndex]['page'] as Widget,
          // TabBarView(
          //   children: <Widget>[
          //     CategoriesScreen(),
          //     FavouriteScreen()
          //   ],
          // )
          bottomNavigationBar: BottomNavigationBar(
            onTap: _selectPage,
            unselectedItemColor: Colors.white,
            selectedItemColor: Theme.of(context).accentColor,
            backgroundColor: Theme.of(context).primaryColor,
            currentIndex: _selectedPageIndex,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.category), label: 'category'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.star), label: 'favourite'),
            ],
          )),
    );
  }
}
