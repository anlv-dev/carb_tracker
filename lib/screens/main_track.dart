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
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

const String notification1 =
    "Lượng carbs nạp vào quá ít, có nguy cơ hạ đường huyết hoặc ảnh hường đến sức khỏe của não bộ. Chỉ ăn: cơm, xôi, hủ tiếu, bún, phở, bánh mì thôi";
const String notification2 =
    "Lượng carbs nạp vào gần đủ, nên chọn thức ăn ít Carbs nhé. Chỉ ăn các loại thịt, cá, rau, trái cây thôi";
const String notification3 =
    "Lượng carbs nạp vào nhiều hơn mức cần thiết, có nguy cơ tăng cân, tăng lượng đường trong máu sẽ dẫn đến tiểu đường.  Đề nghị ăn các loại thịt, cá, rau và tăng cường vận động bạn nhé";
const String notification4 =
    "Lượng carbs “xấu” nạp vào nhiều, có nguy cơ bị tiểu đường và nghiện đồ ngọt. Tăng cường ăn thức ăn từ rau, củ, quả tự nhiên nhé";

class MyHomePage extends StatefulWidget {
  static String id = 'Main_Track';
  final String emailText;
  MyHomePage(this.emailText);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  var _db;
  String _bmiIndex = "";
  double _minCalo = 0;
  double _totalCarb = 0;
  double _percentCarb = 0;
  double _dailyCarb = 0;

  //Variables for daily group(X,Y,Z,T) Carb
  double _totalCarbX = 0;
  double _totalCarbY = 0;
  double _totalCarbZ = 0;
  double _totalCarbT = 0;

  String _username;
  int _noOfItems = 0;
  List _listFoods;
  List _listIdFood = [];
  List _listIdNo = [];

  FoodBank foodBank = new FoodBank();

  String selectedDate = new DateFormat('dd-MMM-yyyy').format(DateTime.now());

  void refreshList() {
    setState(() {
      getSomeData();
      _loadEatFood();
    });
  }

  void getSomeData() async {
    //username : tvanh@vn.vn
    //get BMI
    if (widget.emailText != null) {
      _username = widget.emailText;
      UserEnergy _userEnergy;
      _userEnergy = await _db.getUserEnergy(_username);
      _bmiIndex = _userEnergy.bmi;
      _minCalo = _userEnergy.mincalo.roundToDouble();
      _totalCarb = _userEnergy.totalcarb;
    }
  }

  @override
  void initState() {
    setState(() {
      _db = DatabaseHelper();
      _username = widget.emailText;
      //_listFoods = _db.getFoodIdByDate(selectedDate, _username);
      refreshList();

    });

    super.initState();
    var initializationSettingsAndroid =
        new AndroidInitializationSettings('app_icon');
    var initializationSettingsIOS = new IOSInitializationSettings();
    var initializationSettings = new InitializationSettings(
        initializationSettingsAndroid, initializationSettingsIOS);
    flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: _onSelectNotification);
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
                    percent: 1.0,
                    center: new Text(
                      "${_percentCarb.roundToDouble()}%",
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
                    '$_dailyCarb',
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
                        '${foodBank.lstFoods[(_listIdFood[position]) - 1].foodName}',
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.blue,
                        ),
                      ),
                      subtitle: Text(
                        '01 ${foodBank.lstFoods[(_listIdFood[position]) - 1].dv}',
                        style: TextStyle(
                          fontSize: 10.0,
                        ),
                      ),
                      trailing: Container(
                        width: 150.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text(
                              '${foodBank.lstFoods[(_listIdFood[position]) - 1].carbs}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                _deleteItem(_listIdNo[position]);
                                setState(() {
                                  _noOfItems = _noOfItems -1;
                                  refreshList();


                                });
                              },
                              icon: Icon(
                                Icons.delete,
                                color: Colors.amber,
                              ),
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
            navigateScreens();
            //_showNotificationWithDefaultSound();
            //getSomeData();
            //_save();
            //_getCountFoodBanks();
            //_loadEatFood();
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
    //print('ID Return from search page : $result');

    if (result != null) {
      setState(() {
        //_noOfItems = _noOfItems + 1;
        _saveEateFood(int.parse(result));
        //print('ID Return from search page : ${int.parse(result)}');
        _loadEatFood();
      });
      //int res = int.parse(result);

    }
  }

  void _saveEateFood(int res) async {
    if (res > 0 && _username != null) {
      await _db.saveUserEatFood(UserEatFoods(_username, selectedDate, res, 1));
      print('ID is inserted to db : $res');
      if (res > 0) {
        int re2 = await _db.getCountUserEatFood();
        print('Number of records in the table : $re2');
      }
    }
  }

  void _getCountRowInUserEatFood() async {
    int re2 = await _db.getCountUserEatFood();
    print('Number of records in the table : $re2');
  }

  void _getTest() async {
    List<FoodBanker> _lst;
    //await dbc.getAllEatListFoods('anhlq', '02-Dec-2019');
    //print( await _db.getAllEatListFoods('anhlq', '02-Dec-2019'));
    _lst = await _db.getAllEatListFoods('anhlq', '02-Dec-2019');
    print('Chieu dai cua list:${_lst.length}');
  }

  void _deleteItem(int idFood) async {
    await _db.deleteUserEatFood1(idFood);
    print('Delete funtion called');
  }

  void _loadEatFood() async {
    _listFoods = await _db.getFoodIdByDate(selectedDate, _username);
    _listIdFood = [];
    _listIdNo = [];
    _noOfItems = _listFoods.length;
    _dailyCarb = 0;
    _totalCarbX = 0;
    _totalCarbY = 0;
    _totalCarbZ = 0;
    String _group = "";

    if (_noOfItems > 0) {
      for (int i = 0; i < _listFoods.length; i++) {
        UserEatFoods userEatFoods = UserEatFoods.map(_listFoods[i]);
        _listIdFood.add(userEatFoods.idFood);
        _listIdNo.add((userEatFoods.id));

//      _foodName = foodBank.lstFoods[userEatFoods.idFood].foodName;
//      _foodDvt = foodBank.lstFoods[userEatFoods.idFood].dv;
//      _foodCarb = foodBank.lstFoods[userEatFoods.idFood].carbs;
//      print('ID FOOD: ${userEatFoods.idFood}');
//      print(foodBank.lstFoods[userEatFoods.idFood].foodName);
        _dailyCarb =
            _dailyCarb + foodBank.lstFoods[userEatFoods.idFood - 1].carbs;

        _group = foodBank.lstFoods[userEatFoods.idFood - 1].group;
        //Calculated carbohydrate for each group

        if (_group == 'X') {
          _totalCarbX =
              _totalCarbX + foodBank.lstFoods[userEatFoods.idFood - 1].carbs;
        } else if (_group == 'Y') {
          _totalCarbY =
              _totalCarbY + foodBank.lstFoods[userEatFoods.idFood - 1].carbs;
        } else if (_group == 'Z') {
          _totalCarbZ =
              _totalCarbZ + foodBank.lstFoods[userEatFoods.idFood - 1].carbs;
        } else if (_group == 'T') {
          _totalCarbT =
              _totalCarbT + foodBank.lstFoods[userEatFoods.idFood - 1].carbs;
        }
      }
      _dailyCarb = _dailyCarb.roundToDouble();
      _percentCarb = ((_dailyCarb / _totalCarb) * 100).roundToDouble();

      _showNotificationWithDefaultSound(_carbGroupToString(
          _totalCarbX, _totalCarbY, _totalCarbZ, _totalCarbT));
      print('Number of Food :$_listIdFood');
      print('Number of auto id in table :$_listIdNo');
    }
  }

  //Function Carbohydrate to String
  String _carbGroupToString(
      double groupX, double groupY, double groupZ, double groupT) {
    String notification = "";
    if ((groupX + groupY + groupZ + groupT) < (_totalCarb * 0.5)) {
      notification = notification1;
    }
    if (((groupX + groupY + groupZ + groupT) > (_totalCarb * 0.9)) &&
        ((groupX + groupY + groupZ + groupT) < (_totalCarb * 1.1))) {
      notification = notification2;
    }

    if (((groupX + groupY + groupZ + groupT) > (_totalCarb * 1.1))) {
      notification = notification3;
    }

    if ((groupY + groupZ) > (_totalCarb * 0.4)) {
      notification = notification4;
    }

    return notification;
  }

  Future _onSelectNotification(String payload) async {
    showDialog(
      context: context,
      builder: (_) {
        return new AlertDialog(
          title: Text("TrackCarb"),
          content: Text(
            "Khuyến nghị : $payload",
            style: TextStyle(color: Colors.blue),
          ),
        );
      },
    );
  }

  Future _showNotificationWithDefaultSound(String _notify) async {
    var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
        'your channel id', 'your channel name', 'your channel description',
        importance: Importance.Max, priority: Priority.High);
    var iOSPlatformChannelSpecifics = new IOSNotificationDetails();
    var platformChannelSpecifics = new NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
      0,
      'Track Your Carbohydrate',
      '$_notify',
      platformChannelSpecifics,
      payload: '$_notify',
    );
  }
}
