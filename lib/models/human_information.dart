import 'package:carbs_tracker_ex/constants.dart';
import 'package:flutter/material.dart';
import 'package:carbs_tracker_ex/reuseable_widgets/button_bottom.dart';

class HumanInfor extends StatefulWidget {
  static String id = 'HumanInfor';

  @override
  _HumanInforState createState() => _HumanInforState();
}

class _HumanInforState extends State<HumanInfor> {
  String ddModeValue = 'Binh Thuong';

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
                  hint: Text('CHE DO AN UONG'),
                  value: ddModeValue,
                  icon: Icon(Icons.add),
                  iconSize: 24,
                  elevation: 2,
                  style: TextStyle(
                    color: Colors.lightBlueAccent,
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
                    'Binh Thuong',
                    'Giam can',
                    'Tang can',
                    'Tieu duong'
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
              textButton: 'CACULATE YOUR BMI',
              onTap: () {
                print('You pressed caculate button');
              },
            ),
          ],
        ),
      ),
    );
  }
}
