import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  final Function setFilters;
  FilterScreen(this.setFilters);
  //const FilterScreen({Key key}) : super(key: key);
  static const routeName = '/filters';

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _glutenFree = false;
  var _vegeterian = false;
  var _vegan = false;
  var _lactoseFree = false;

  Widget _buildSwitchListTile(
    String title,
    String description,
    bool currentValue,
    Function updateValue,
  ) {
    return SwitchListTile(
      value: currentValue,
      onChanged: updateValue,
      title: Text(title),
      subtitle: Text(description),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: const Text('Your Filters!!'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final selectedFilters = {
                'gluten': false,
                'lactose': false,
                'vegan': false,
                'vegetarian': false,
              };
              widget.setFilters(selectedFilters);
            },
          )
        ],
      ),
      body: Column(children: [
        Container(
          padding: EdgeInsets.all(20),
          child: Text(
            'Adjust your meal selection',
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        Expanded(
            child: ListView(
          children: [
            _buildSwitchListTile(
              'Gluten-free',
              'Only include gluten-free meals.',
              _glutenFree,
              (newValue) {
                setState(
                  () {
                    _glutenFree = newValue;
                  },
                );
              },
            ),
            _buildSwitchListTile(
              'Lactose-free',
              'Only include lactose-free meals.',
              _lactoseFree,
              (newValue) {
                setState(
                  () {
                    _lactoseFree = newValue;
                  },
                );
              },
            ),
            _buildSwitchListTile(
              'Vegeterian',
              'Only include vegeterian meals.',
              _vegeterian,
              (newValue) {
                setState(
                  () {
                    _vegeterian = newValue;
                  },
                );
              },
            ),
            _buildSwitchListTile(
              'Vegan',
              'Only include vegan meals.',
              _vegan,
              (newValue) {
                setState(
                  () {
                    _vegan = newValue;
                  },
                );
              },
            ),
          ],
        ))
      ]),
    );
  }
}
