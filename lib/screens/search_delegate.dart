import 'package:flutter/material.dart';

class SearchPageExample extends StatefulWidget {
  @override
  _SearchPageExampleState createState() => _SearchPageExampleState();
}

class _SearchPageExampleState extends State<SearchPageExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search App'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: DataSearch());
            },
          )
        ],
      ),
    );
  }
}

class DataSearch extends SearchDelegate<String> {
  final cities = [
    "HO CHI MINH",
    "HA NOI",
    "DA NANG",
    "NHA TRANG",
    "QUANG NAM",
    "PLEIKU"
  ];
  final recentCities = ["HO CHI MINH", "HA NOI"];

  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    // actions of AppBar
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query="";
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
    return null;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    final suggestionList =
        query.isEmpty
            ? recentCities
            : cities.where( (p) => p.startsWith(query)).toList()
    ;
    return ListView.builder(
        itemCount: suggestionList.length,
        itemBuilder: (context, index) => ListTile(
              leading: Icon(Icons.location_city),
              title: Text(
                suggestionList[index],
              ),
            ),);
  }
}
