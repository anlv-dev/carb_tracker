import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:carbs_tracker_ex/models/company.dart';
import 'package:percent_indicator/percent_indicator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Company> _companies = Company.getCompanies();
  List<DropdownMenuItem<Company>> _dropDownMenuItems;
  Company _selectedCompany;

  @override
  void initState() {
    // TODO: implement initState
    _dropDownMenuItems = buildDropdownMenuItems(_companies);
    _selectedCompany = _dropDownMenuItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<Company>> buildDropdownMenuItems(List companies) {
    List<DropdownMenuItem<Company>> items = List();
    for (Company company in companies) {
      items.add(DropdownMenuItem(
        value: company,
        child: Text(company.name),
      ));
    }
    return items;
  }

  onChangedDropdownItem(Company selectedCompany) {
    setState(() {
      _selectedCompany = selectedCompany;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.person),
        title: Text(DateFormat.yMMMd().format(new DateTime.now()).toString()),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Main Goal',
                  style: TextStyle(fontSize: 17.0),
                ),
                SizedBox(
                  width: 10.0,
                ),
                DropdownButton(
                  value: _selectedCompany,
                  items: _dropDownMenuItems,
                  onChanged: onChangedDropdownItem,
                ),
                Text(
                  '36%',
                  style: TextStyle(fontSize: 17.0),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                LinearPercentIndicator(
                  width: 390.0,
                  lineHeight: 14.0,
                  percent: 0.5,
                  backgroundColor: Colors.grey,
                  progressColor: Colors.blue,
                ),
              ],
            ),
            SizedBox(
              height: 30.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: <Widget>[
                Text(
                  '776',
                  style: TextStyle(fontSize: 70.0, color: Colors.blue),
                ),
                Text(
                  '/1700',
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Card(
                  child: Container(
                    width: 90.0,
                    child: Column(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            'FAT',
                            style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.blue.shade600,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Text(
                          '130.5',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.blue.shade300,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Container(
                    width: 90.0,
                    child: Column(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            'PROTEIN',
                            style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.yellow.shade600,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Text(
                          '32.5',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.yellow,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Container(
                    width: 90.0,
                    child: Column(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            'CARB',
                            style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.red.shade600,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Text(
                          '3.5',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30.0,
            ),
            Row(
              children: <Widget>[
                Text('MEAL'),
              ],
            ),
            Row(
              children: <Widget>[
                Container(
                  height: 1.0,
                  width: 380,
                  color: Colors.teal,
                )
              ],
            ),
            ListView(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.fastfood),
                  title: Text('ABC'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
