import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function saveFilters;
final Map<String ,bool > currentFilters;
  FilterScreen(this.saveFilters,this.currentFilters);


  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;
@override
  initState(){
  _glutenFree=widget.currentFilters['gluten'];
  _lactoseFree=widget.currentFilters['lactose'];
  _vegetarian=widget.currentFilters['vegetarian'];
  _vegan=widget.currentFilters['vegan'];
super.initState();
  }

  Widget _buildSwitchListTile(String title, String description,
      bool currentValue, Function updateValue) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(description),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Filters"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final selectedFilters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
              };
              widget.saveFilters(selectedFilters);
            },
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "Adjust Your Selection Meal",
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
              child: ListView(
            children: <Widget>[
              _buildSwitchListTile(
                  'Gluten-Free', 'only include Gluten-free meaLs', _glutenFree,
                  (newValue) {
                setState(
                  () {
                    _glutenFree = newValue;
                  },
                );
              }),
              _buildSwitchListTile('Lactose-Free',
                  'only include Lactose-free meaLs', _lactoseFree, (newValue) {
                setState(
                  () {
                    _lactoseFree = newValue;
                  },
                );
              }),
              _buildSwitchListTile(
                  'Vegetarian',
                  'only include vegetarian-free meaLs',
                  _vegetarian, (newValue) {
                setState(
                  () {
                    _vegetarian = newValue;
                  },
                );
              }),
              _buildSwitchListTile(
                  "Vegan", 'only include Vegan-free meals', _vegan, (newValue) {
                setState(() {
                  _vegan = newValue;
                });
              }),
            ],
          ))
        ],
      ),
    );
  }
}
