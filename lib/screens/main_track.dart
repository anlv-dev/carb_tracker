import 'package:carbs_tracker_ex/models/food_Banks.dart';
import 'package:carbs_tracker_ex/models/foodBank.dart';
import 'package:carbs_tracker_ex/models/usereatfoods.dart';
import 'package:carbs_tracker_ex/models/userenergy.dart';
import 'package:carbs_tracker_ex/screens/search_delegate.dart';
import 'package:carbs_tracker_ex/utils/database_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:intl/intl.dart';

class MyHomePage extends StatefulWidget {
  static String id = 'Main_Track';
  String emailText;
  MyHomePage(this.emailText);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _db = new DatabaseHelper();
  String _bmiIndex = "";
  double _minCalo = 0;
  double _totalCarb = 0;
  double _percentCarb = 0;
  double _dailyCarb = 0;
  String _username;
  int _noOfItems = 0;
  List _listFoods;
  FoodBank foodBank = new FoodBank();

  String selectedDate = new DateFormat('dd-MMM-yyyy').format(DateTime.now());

  void getSomeData() async {
    //username : tvanh@vn.vn
    //get BMI
    if (widget.emailText != null) {
      UserEnergy _userEnergy;
      _userEnergy = await _db.getUserEnergy(widget.emailText);
      _username = widget.emailText;
      //_bmiIndex = _userEnergy.bmi;
      //_minCalo = _userEnergy.mincalo.roundToDouble();
      //_totalCarb = _userEnergy.totalcarb;
      //_percentCarb = _dailyCarb / _totalCarb;
      print(_username);
      print(_bmiIndex);
    }
  }

  @override
  void initState() {
    getSomeData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Track Carbohydrate',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        //backgroundColor: Colors.white,
      ),
      home: Scaffold(
        //backgroundColor: Colors.white,
        appBar: AppBar(
          leading: Icon(Icons.launch),
          title: Text('Track Carbohydrate'),
          backgroundColor: Colors.blue,
        ),
        body: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              FlatButton(
                  onPressed: () {
                    DatePicker.showDatePicker(context,
                        showTitleActions: true,
                        minTime: DateTime(2018, 1, 1),
                        maxTime: DateTime(2020, 12, 31), onChanged: (date) {
                      print('change $date');
                    }, onConfirm: (date) {
                      print('confirm $date');
                      setState(() {
                        selectedDate =
                            new DateFormat('dd-MMM-yyyy').format(date);
                      });
                    }, currentTime: DateTime.now(), locale: LocaleType.vi);
                  },
                  child: Text(
                    '$selectedDate',
                    style: TextStyle(color: Colors.blue),
                  )),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  new CircularPercentIndicator(
                    radius: 100.0,
                    lineWidth: 5.0,
                    percent: 1.0,
                    center: new Text("$_bmiIndex"),
                    progressColor: Colors.green,
                    footer: new Text(
                      "BMI",
                      style: new TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17.0,
                          color: Colors.teal,
                          letterSpacing: 2.0),
                    ),
                  ),
                  CircularPercentIndicator(
                    radius: 120.0,
                    lineWidth: 13.0,
                    animation: true,
                    percent: _percentCarb,
                    center: new Text(
                      "$_percentCarb%",
                      style: new TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.0),
                    ),
                    footer: new Text(
                      "CARB",
                      style: new TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17.0,
                          color: Colors.teal,
                          letterSpacing: 2.0),
                    ),
                    circularStrokeCap: CircularStrokeCap.round,
                    progressColor: Colors.purple,
                  ),
                  new CircularPercentIndicator(
                    radius: 100.0,
                    lineWidth: 5.0,
                    percent: 1.0,
                    center: new Text("$_minCalo"),
                    backgroundColor: Colors.grey,
                    progressColor: Colors.blue,
                    footer: new Text(
                      "CALO",
                      style: new TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17.0,
                          color: Colors.teal,
                          letterSpacing: 2.0),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: <Widget>[
                  Text(
                    '${_dailyCarb.roundToDouble().toString()}',
                    style: TextStyle(fontSize: 50.0, color: Colors.blue),
                  ),
                  Text(
                    '/$_totalCarb',
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
              Expanded(
                  child: ListView.builder(
                itemCount: _noOfItems,
                itemBuilder: (context, int position) {
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
                        'ABC',
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.blue,
                        ),
                      ),
                      subtitle: Text('01 BAT'),
                      trailing: Container(
                        width: 150.0,
                        child: Row(
                          children: <Widget>[
                            SizedBox(width: 30.0),
                            Text(
                              '20 Carb',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                            SizedBox(
                              width: 30.0,
                            ),
                            Icon(
                              Icons.delete,
                              color: Colors.amber,
                            )
                          ],
                        ),
                      ),
                      dense: true,
                    ),
                  );
                },
              ))
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          elevation: 2.0,
          onPressed: () {
            //navigateScreens();
            //getSomeData();
            //_save();
            //_getCountFoodBanks();
            _loadEatFood();
          },
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.yellow,
          child: Container(
            height: 50.0,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }

  void _save() async {
    int re = await _db
        .saveFoodBanks(new FoodBanker('COM TRANG', 'BAT', 44.2, 0, 'X'));

    //FoodBanker('COM TRANG', 'BAT', 44.2, 0, 'X')
    if (re > 0) {
      print('Save successful!');
    }
  }

  void _getCountFoodBanks() async {
    int re = await _db.getCountFoodBanks();
    print(re);
  }

  void navigateScreens() async {
    String result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SearchPageExample()),
    );
    print('ID Return from search page : $result');

    if (result != null) {
      setState(() {
        _noOfItems = int.parse(result);
        _saveEateFood(_noOfItems);
        _loadEatFood();
      });
      //int res = int.parse(result);

    }
  }

  void _saveEateFood(int res) async {
    if (res > 0 && _username != null) {
      await _db.saveUserEatFood(UserEatFoods(_username, selectedDate, res, 1));
      if (res > 0) {
        int re2 = await _db.getCountUserEatFood();
        print(re2);
      }
    }
  }

  void _loadEatFood() async {
    _listFoods = await _db.getFoodIdByDate(selectedDate, _username);
    print(_listFoods);

    for (int i = 0; i < _listFoods.length; i++) {
      UserEatFoods userEatFoods = UserEatFoods.map(_listFoods[i]);
      print('ID FOOD: ${userEatFoods.idFood}');
      print(foodBank.lstFoods[userEatFoods.idFood - 1].foodName);
      _totalCarb = _totalCarb +
          foodBank.lstFoods[userEatFoods.idFood - 1].carbs.toDouble();
    }
  }
}
