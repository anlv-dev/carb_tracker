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
    "COM TAM",
    "PHO BO",
    "HU TIEU NAMG VANG",
    "CANH CHUA CA LOC",
    "BUN BO",
    "BUN THIT NUONG",
    "BUN MAM"
  ];
  final recentCities = [
    "COM TAM",
    "PHO BO",
  ];
  int cityIndex;

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
    return Center(
        child: Container(
      width: 100.0,
      height: 100.0,
      child: Card(
        color: Colors.red,
        child: Center(child: Text(query)),
      ),
    ));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    final suggestionList = query.isEmpty
        ? recentCities
        : cities.where((k) => k.startsWith(query)).toList();
    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          query = suggestionList[index];
          showResults(context);
          print(cities.indexOf(query));
        },
        leading: Icon(Icons.fastfood),
        title: Text(suggestionList[index]),
      ),
    );
  }
}
