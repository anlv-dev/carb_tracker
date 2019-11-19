import 'package:flutter/material.dart';
import 'package:carbs_tracker_ex/models/foodBank.dart';
import 'package:carbs_tracker_ex/screens/reusable_card.dart';
import 'package:carbs_tracker_ex/constants.dart';
import 'package:carbs_tracker_ex/screens/round_icon_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchPageExample extends StatefulWidget {
  @override
  _SearchPageExampleState createState() => _SearchPageExampleState();
}

class _SearchPageExampleState extends State<SearchPageExample> {
  List<String> items = new List();
  @override
  void initState() {
    var a = new FoodBank();

    for (int i = 0; i < a.lstFoods.length; i++) {
      items.add(a.lstFoods[i].foodName);
    }

    print(items);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search App'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                  context: context, delegate: DataSearch(cities: this.items));
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

  //static var a = new FoodBank();
  //final cities = a.getFoodList();

//  final cities = [
//    "HO CHI MINH",
//    "HA NOI",
//    "DA NANG",
//    "NHA TRANG",
//    "QUANG NAM",
//    "PLEIKU"
//  ];
  final recentCities = ["HO CHI MINH", "HA NOI"];

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
    return ListTile(
      leading: Icon(
        Icons.fastfood,
        color: Colors.blue,
        size: 45.0,
      ),
      title: Text(
        cities[idIndex].toString(),
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(aListTitle.lstFoods[idIndex].carbs.toString() + " Carbs"),
      trailing: IconButton(
        icon: Icon(Icons.add),
        onPressed: () {
          Navigator.pop(context);
          Navigator.pop(context, idIndex);
        },
      ),
      dense: true,
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    final suggestionList = query.isEmpty
        ? recentCities
        : cities.where((p) => p.startsWith(query)).toList();
    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          print(suggestionList[index]);
          idIndex = cities.indexOf(suggestionList[index]);
          showResults(context);
        },
        leading: Icon(Icons.location_city),
        title: Text(
          suggestionList[index],
        ),
      ),
    );
  }
}
