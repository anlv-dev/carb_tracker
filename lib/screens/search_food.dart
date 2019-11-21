import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  static String id = 'SearchPage';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MySearchPage(),
    );
  }
}

class MySearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Foods'),
        leading: IconButton(
          icon: (Icon(Icons.search)),
          onPressed: () {
            showSearch(context: context, delegate: DataSearch());
          },
        ),
      ),
    );
  }
}

class DataSearch extends SearchDelegate {
  final List<String> cities = [
    "Cơm trắng",
    "Phở bò",
    "Hủ tiếu",
    "Xôi bắp",
    "Bún bò",
    "Bánh canh",
    "Bánh tráng trộn",
    "Cá viên chiên",
    "Chè hạt sen",
    "Chè long nhãn",
    "....",
  ];

  final List<String> recentCities = [
    "Cơm trắng",
    "Phở bò",
    "Hủ tiếu",
    "Xôi bắp",
  ];

  String selectedItem = '';
  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
        icon: Icon(Icons.clear),
        color: Colors.red,
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.arrow_menu,
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
    return Container(
        width: 200,
        height: 100,
        child: Card(
          color: Colors.red,
          child: Center(
            child: Text(selectedItem),
          ),
        ));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    final suggestionList = query.isEmpty
        ? recentCities
        : cities.where((p) => p.startsWith(query)).toList();

    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          onTap: () {
            showResults(context);
            selectedItem = suggestionList[index];
          },
          leading: Icon(Icons.fastfood),
          title: RichText(
            text: TextSpan(
                text: suggestionList[index].substring(0, query.length),
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                children: [
                  TextSpan(
                    text: suggestionList[index].substring(query.length),
                    style: TextStyle(color: Colors.grey),
                  )
                ]),
          ),
        );
      },
      itemCount: suggestionList.length,
    );
  }
}
