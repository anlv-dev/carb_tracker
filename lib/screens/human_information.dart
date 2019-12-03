import 'package:carbs_tracker_ex/models/userenergy.dart';
import 'package:carbs_tracker_ex/utils/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:carbs_tracker_ex/reuseable_widgets/button_bottom.dart';
import 'package:carbs_tracker_ex/models/bmi_brain.dart';
import 'package:carbs_tracker_ex/utils/router.dart';

class HumanInfor extends StatefulWidget {
  static String id = 'HumanInfor';
  final String emailText;
  HumanInfor(this.emailText);

  @override
  _HumanInforState createState() => _HumanInforState();
}

class _HumanInforState extends State<HumanInfor> {
  var _db = new DatabaseHelper();
  String ddModeValue = 'Chọn chế độ';
  int height = 162;
  int weight = 52;
  int birth = 1982;
  String gen = 'NU';
  String cd = 'BT';
  String ddGT = 'NAM';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
          children: <Widget>[
            Text(
              'Vui lòng nhập thông tin của bạn',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.teal,
                letterSpacing: 2.0,
              ),
            ),

            SizedBox(
              height: 10.0,
              width: 150.0,
              child: Divider(
                color: Colors.teal.shade500,
              ),
            ),
            new TextFormField(
              onChanged: (ns) {
                setState(() {
                  birth = int.parse(ns);
                  //print(birth);
                });
              },
              style: TextStyle(
                color: Colors.lightBlueAccent,
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
              ),
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  icon: const Icon(
                    Icons.person,
                    color: Colors.lightBlueAccent,
                  ),
                  hintText: 'Năm sinh',
                  labelText: 'Năm sinh',
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                    color: Colors.teal,
                  )),
            ),
            SizedBox(
              height: 5.0,
            ),
            new TextFormField(
              onChanged: (hei) {
                setState(() {
                  height = int.parse(hei);
                });
              },
              style: TextStyle(
                color: Colors.lightBlueAccent,
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
              ),
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  icon: const Icon(
                    Icons.accessibility,
                    color: Colors.lightBlueAccent,
                  ),
                  hintText: 'Chiều cao',
                  labelText: 'Chiều cao',
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                    color: Colors.teal,
                  )),
            ),
            SizedBox(
              height: 5.0,
            ),
            new TextFormField(
              onChanged: (wei) {
                setState(() {
                  weight = int.parse(wei);
                });
              },
              style: TextStyle(
                color: Colors.lightBlueAccent,
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
              ),
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  icon: const Icon(
                    Icons.launch,
                    color: Colors.lightBlueAccent,
                  ),
                  hintText: 'Cân nặng',
                  labelText: 'Cân nặng',
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                    color: Colors.teal,
                  )),
            ),
            SizedBox(
              height: 5.0,
            ),

            Row(
              children: <Widget>[
                Icon(
                  Icons.assignment_ind,
                  color: Colors.lightBlueAccent,
                  size: 20.0,
                ),
                SizedBox(
                  width: 20.0,
                ),
                DropdownButton<String>(
                  value: ddGT,
                  style: TextStyle(
                    color: Colors.teal,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                  ),
                  underline: Container(
                    height: 2,
                    color: Colors.white,
                  ),
                  onChanged: (String newValue) {
                    setState(() {
                      ddGT = newValue;
                      //print(_viettatdropdownbox(newValue));
                      //cd = _viettatdropdownbox(newValue);
                    });
                  },
                  items: <String>['NAM', 'NU']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),

            Row(
              children: <Widget>[
                Icon(
                  Icons.mode_edit,
                  color: Colors.lightBlueAccent,
                  size: 20.0,
                ),
                SizedBox(
                  width: 20.0,
                ),
                DropdownButton<String>(
                  value: ddModeValue,
                  style: TextStyle(
                    color: Colors.teal,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                  ),
                  underline: Container(
                    height: 2,
                    color: Colors.white,
                  ),
                  onChanged: (String newValue) {
                    setState(() {
                      ddModeValue = newValue;
                      print(_viettatdropdownbox(newValue));
                      cd = _viettatdropdownbox(newValue);
                    });
                  },
                  items: <String>[
                    'Chọn chế độ',
                    'Bình Thường',
                    'Tăng cân',
                    'Giảm cân',
                    'Tiểu đường'
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),

            // DELETE FROM HERE
            SizedBox(
              height: 200.0,
            ),

            ButtonBottom(
              textButton: 'LƯU DỮ LIỆU',
              onTap: () {
                _saveEnergy(widget.emailText);
                //_printsomething();
                //_getCountRowUserEnergy();
                Navigator.pushNamed(context, mainTrackRoute,
                    arguments: widget.emailText);
                //Tinh toan BMI
                // -- Neu BMI
                //Cap nhat thong tin vao DB
              },
            ),
          ],
        ),
      ),
    );
  }

  void _saveEnergy(String email) async {
    BMIBrain cal = new BMIBrain(
        hei: height, wei: weight, birthday: birth, eatMode: cd, gender: ddGT);
    int res = await _db.saveUserEnergy(new UserEnergy(
        email,
        cal.birthday,
        cal.hei,
        cal.wei,
        cal.gender,
        cal.eatMode,
        cal.bmiResult() + '\n' + cal.getEvaluationBMI(),
        cal.minimizeCalories(),
        cal.getRequireCarbByMode(),
        1));
    //print('This is your username : $email');
    if (res > 0) {
      print('Save success!');
    }
  }

  void _getCountRowUserEnergy() async {
    int res = await _db.getCountUserEnergy();
    print(res);
  }

  void _printsomething() {
    BMIBrain cal = new BMIBrain(
        hei: height, wei: weight, birthday: birth, eatMode: cd, gender: ddGT);
    String res1 = cal.minimizeCalories().roundToDouble().toString();
    String res2 = cal.getRequireCarbByMode().roundToDouble().toString();
    String res3 = cal.bmiResult();

    print('Nam sinh : ${cal.birthday}');
    print('Chieu cao : ${cal.hei}');
    print('Can nang : ${cal.wei}');
    print('Gioi tinh : ${cal.gender}');
    print('Che do an uong : ${cal.eatMode}');
    print('Minimum Calo : $res1');
    print('Require Carb : $res2');
    print('BMI: $res3');
  }

  String _viettatdropdownbox(String vietbt) {
    String selected;
    switch (vietbt) {
      case "Bình Thường":
        selected = 'BT';
        break;
      case "Tăng cân":
        selected = 'TC';
        break;
      case "Giảm cân":
        selected = 'GC';
        break;
      case "Tiểu đường":
        selected = 'TD';
        break;
      default:
        selected = 'BT';
        break;
    }
    return selected;
  }

//  void printemailtext(){
//    print(emai)
//  }
}
