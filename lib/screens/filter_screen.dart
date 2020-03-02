import 'package:flutter/material.dart';
import 'package:foodi/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const String routeName = "/filter_screen";
  final Function setFilter;
  final Map<String, bool> currentFilters;

  FilterScreen(this.setFilter, this.currentFilters);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _vegan = false;
  bool _vegetarian = false;
  bool _lactoseFree = false;

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
  void initState() {
    _glutenFree = widget.currentFilters['_glutenFree'];
    _vegan = widget.currentFilters['_vegan'];
    _vegetarian = widget.currentFilters['_vegetarian'];
    _lactoseFree = widget.currentFilters['_lactoseFree'];
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final filterData = {
                '_glutenFree': _glutenFree,
                '_vegan': _vegan,
                '_vegetarian': _vegetarian,
                '_lactoseFree': _lactoseFree,
              };
              widget.setFilter(filterData);
            },
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            child: Text(
              'Adjust your Filters here',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
              child: ListView(
            children: <Widget>[
              _buildSwitchListTile(
                'Gluten Free',
                'only gluten free meals are selected',
                _glutenFree,
                (value) {
                  setState(() {
                    _glutenFree = value;
                  });
                },
              ),
              _buildSwitchListTile(
                'Vegan',
                'only Vegan free meals are selected',
                _vegan,
                (value) {
                  setState(() {
                    _vegan = value;
                  });
                },
              ),
              _buildSwitchListTile(
                'Vegetarian',
                'only Vegetarian free meals are selected',
                _vegetarian,
                (value) {
                  setState(() {
                    _vegetarian = value;
                  });
                },
              ),
              _buildSwitchListTile(
                'Lactose Free',
                'only Lactose free meals are selected',
                _lactoseFree,
                (value) {
                  setState(() {
                    _lactoseFree = value;
                  });
                },
              )
            ],
          ))
        ],
      ),
    );
  }
}
