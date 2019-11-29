import 'package:carbs_tracker_ex/models/foodBank.dart';
import 'package:carbs_tracker_ex/models/usereatfoods.dart';
import 'package:carbs_tracker_ex/screens/search_delegate.dart';
import 'package:carbs_tracker_ex/utils/database_helper_test.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:carbs_tracker_ex/models/company.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:intl/intl.dart';

List idList;
FoodBank foodBank = new FoodBank();
double totalCarb = 0;
void main() async {
  int userid = 1;
  //List idList;
  var db = new DatabaseHelperTest();
  //int re = await db.saveUser(new UserEatFoods(1, "21-Nov-2019", 7, 174.1));
  //print(re);

  idList = await db.getFoodIdByDate('21-Nov-2019', userid);
  print(idList);

  for (int i = 0; i < idList.length; i++) {
    UserEatFoods userEatFoods = UserEatFoods.map(idList[i]);
    print('ID FOOD: ${userEatFoods.idFood}');
    print(foodBank.lstFoods[userEatFoods.idFood - 1].foodName);
    totalCarb =
        totalCarb + foodBank.lstFoods[userEatFoods.idFood - 1].carbs.toDouble();
  }

  //print(idList);

  //db.getCountUser()

  //Algorithm
  //- Count record by Date
  //----Date : Now
  //----Date : Input Manual
  //- getIdThucAn from db --> List
  //-- Tuong ung voi moi id se lay cac gia tri dua vao ListView.Builder(idThucAn = id trong Food Class)
  //----- Gia tri do la : tenFood, Carb, DVT, tong luong carb
  // doi voi nut delete trong listTitle --> Delete id trong db va update view

  // Doi voi UpdateView() se co mot so truong hop sau:
  // -- Khi khoi dong se lay ngay hien tai --> UpdateView
  // -- Khi nguoi dung delete item on ListTittle --> UpdateView
  // -- Khi nguoi dung thay doi ngay --> UpdateView
  // -- Khi nguoi dung thay doi ngay va deleteitem --> UpdateView

  // Doi voi DeleteItem tren ListTittle se luu y bien dau vao gom : date & idthucan can xoa

  runApp(MyApp());
}

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

  String selectedDate = new DateFormat('dd-MMM-yyyy').format(DateTime.now());

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
        leading: Icon(Icons.launch),
        title: Text('Track Carbohydrate'),
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
                      selectedDate = new DateFormat('dd-MMM-yyyy').format(date);
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
                  center: new Text("22.2 - Normal"),
                  progressColor: Colors.green,
                ),
                new CircularPercentIndicator(
                  radius: 130.0,
                  lineWidth: 5.0,
                  percent: 1.0,
                  center: new Text("CARB 100%"),
                  progressColor: Colors.red,
                ),
                new CircularPercentIndicator(
                  radius: 100.0,
                  lineWidth: 5.0,
                  percent: 1.0,
                  center: new Text("CALO 100%"),
                  progressColor: Colors.yellow,
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
                  '$totalCarb',
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
            Expanded(
                child: ListView.builder(
              itemCount: idList.length,
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
                      '${foodBank.lstFoods[position].foodName}',
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.blue,
                      ),
                    ),
                    subtitle: Text('01 ${foodBank.lstFoods[position].dv}'),
                    trailing: Container(
                      width: 150.0,
                      child: Row(
                        children: <Widget>[
                          SizedBox(width: 30.0),
                          Text(
                            '${foodBank.lstFoods[position].carbs}',
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
          navigateScreens();
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
    );
  }

  void navigateScreens() async {
    int result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SearchPageExample()),
    );
    print(result);
  }
}
