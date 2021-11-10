import 'package:flutter/material.dart';
import 'package:learning_meals_app/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function saveFilters ;
  final Map<String,bool> currentFilters;

  FilterScreen(this.currentFilters ,this.saveFilters);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {

  bool _GlutenFree = false;
  bool _Vegan = false;
  bool _Vegetarian = false;
  bool _LactoseFree = false;

  @override
  initState()
  {
    _GlutenFree  = widget.currentFilters['gluten'] ?? false;
    _Vegan = widget.currentFilters['vegan'] ?? false;
    _Vegetarian = widget.currentFilters['vegetarian'] ?? false;
    _LactoseFree = widget.currentFilters['lactose'] ?? false;
    super.initState();
  }
  Widget _buildSwitchListTile(String title, String description,
      bool currentValue, Function(bool) updateValue) {
    return SwitchListTile(
      title: Text(title),
     subtitle: Text(description),
      value: currentValue,
      onChanged: updateValue
    );
      }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: const Text('Your fingers'),
        actions: <Widget> [
          IconButton(
              icon: const Icon(Icons.save),
              onPressed: () {
                final selectedFilters = {
                'gluten' : _GlutenFree ,
                'lactose' : _Vegan,
                'vegan' : _Vegetarian ,
                'vegetarian' : _LactoseFree ,
              };
                widget.saveFilters(selectedFilters);
              }
          ),
        ]
      ),
        drawer: MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: Text(
                'Adjust Your Meal selection',
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  _buildSwitchListTile('Gluten-free',
                  'Only include gluten free meals' ,
                    _GlutenFree,
                    (newValue){
                      setState((){
                        _GlutenFree = newValue ;
                      }
                      );
                    },
                  ),

                  _buildSwitchListTile('Lactose-free',
                  'Only include lactose free meals' ,
                    _LactoseFree ,
                    (newValue){
                      setState((){
                        _LactoseFree = newValue ;
                      }
                      );
                    },
                  ),

                  _buildSwitchListTile('Vegetarian-free',
                    'Only include Vegetarian free meals' ,
                    _Vegetarian ,
                        (newValue){
                      setState((){
                        _Vegetarian = newValue ;
                      }
                      );
                    },
                  ),

                  _buildSwitchListTile('Vegan',
                    'Only include Vegan free meals' ,
                    _Vegan ,
                        (newValue){
                      setState((){
                        _Vegan = newValue ;
                      }
                      );
                    },
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
