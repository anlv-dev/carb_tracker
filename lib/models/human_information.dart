import 'package:carbs_tracker_ex/constants.dart';
import 'package:flutter/material.dart';
import 'package:carbs_tracker_ex/reuseable_widgets/button_bottom.dart';
import 'package:carbs_tracker_ex/models/bmi_brain.dart';

class HumanInfor extends StatefulWidget {
  static String id = 'HumanInfor';

  @override
  _HumanInforState createState() => _HumanInforState();
}

class _HumanInforState extends State<HumanInfor> {
  String ddModeValue = 'Chọn chế độ';
  int height = 162;
  int weight = 52;
  int age = 37;

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
              onChanged: (hei){
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
              onChanged: (wei){
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
            new TextFormField(
              style: TextStyle(
                color: Colors.lightBlueAccent,
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
              ),
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  icon: const Icon(
                    Icons.assignment_ind,
                    color: Colors.lightBlueAccent,
                  ),
                  hintText: 'Giới tính',
                  labelText: 'Giới tính',
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                    color: Colors.teal,
                  )),
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
              textButton: 'BMI',
              onTap: () {
                print('You pressed caculate button');
                //print('$ns');
                print(height);
                BMIBrain cal = new BMIBrain(hei: height, wei: weight);
                print(cal.bmiResult());
                print(cal.getEvaluationBMI());
                print(cal.getInterpretation());
                var currentYear = DateTime.now().year;
                print(currentYear.toString());


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
}
