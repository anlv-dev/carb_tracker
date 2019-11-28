import 'package:carbs_tracker_ex/utils/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:carbs_tracker_ex/models/foodBank.dart';
import 'package:carbs_tracker_ex/models/food_Banks.dart';

class SearchPageExample extends StatefulWidget {
  static String id = 'SearchFoods';
  @override
  _SearchPageExampleState createState() => _SearchPageExampleState();
}

class _SearchPageExampleState extends State<SearchPageExample> {
  List<String> items = new List();

  var _db = new DatabaseHelper();

  @override
  void initState() {
    var a = new FoodBank();
    for (int i = 0; i < a.lstFoods.length; i++) {
      items.add(a.lstFoods[i].foodName);
    }

    print(items);
    super.initState();
  }

  void _getAllFoods() async {
    var _foodsList = await _db.getAllFoods();

    for (int i = 0; i < _foodsList.length; i++) {
      FoodBanker _food = FoodBanker.map(_foodsList[i]);
      print(_food.foodName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(
          child: Text('Tìm kiếm ...'),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: DataSearch(cities: this.items),
              );
            },
          )
        ],
      ),
    );
  }
}

class DataSearch extends SearchDelegate<String> {
  List<String> cities = new List();
  DataSearch({@required this.cities});
  int idIndex;
  var aListTitle = new FoodBank();

  final recentCities = ["COM TRANG", "COM TAM", "PHO", "HU TIEU MI"];

  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    // actions of AppBar
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    assert(context != null);
    final ThemeData theme = Theme.of(context);
    assert(theme != null);
    return theme.copyWith(
      primaryColor: theme.primaryColor,
      primaryIconTheme: theme.primaryIconTheme,
      primaryColorBrightness: theme.primaryColorBrightness,
      primaryTextTheme: theme.primaryTextTheme,
    );
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    // leading icons on the left of app bar
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return Card(
      color: Colors.white,
      elevation: 2.0,
      child: ListTile(
        leading: Icon(
          Icons.fastfood,
          color: Colors.blue,
          size: 45.0,
        ),
        title: Text(
          cities[idIndex].toString().toUpperCase(),
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
        ),
        subtitle:
            Text(aListTitle.lstFoods[idIndex].carbs.toString() + " Carbs"),
        trailing: IconButton(
          icon: Icon(
            Icons.add,
            size: 30.0,
            color: Colors.blue,
          ),
          onPressed: () {
            Navigator.pop(context);
            Navigator.pop(context, idIndex);
          },
        ),
        dense: true,
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    final suggestionList = query.isEmpty
        ? recentCities
        : cities.where((p) => p.startsWith(query.toUpperCase())).toList();
    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) => Card(
        color: Colors.white,
        elevation: 2.0,
        child: ListTile(
          onTap: () {
            print(suggestionList[index]);
            idIndex = cities.indexOf(suggestionList[index]);
            showResults(context);
          },
          leading: Icon(
            Icons.fastfood,
            size: 30.0,
            color: Colors.blue,
          ),
          title: Text(
            suggestionList[index].toUpperCase(),
            style: TextStyle(color: Colors.blue),
          ),
        ),
      ),
    );
  }
}
