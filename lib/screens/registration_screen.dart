import 'package:carbs_tracker_ex/screens/human_information.dart';
import 'package:carbs_tracker_ex/models/user.dart';
import 'package:carbs_tracker_ex/utils/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:carbs_tracker_ex/utils/router.dart';

class RegistrationScreen extends StatefulWidget {
  static String id = 'Registration_Screen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  var _db = new DatabaseHelper();

  String emailText;
  String passwordText;

  //If not exist in db
  // -> Create New
  //otherwise -> ShowDialog "Da ton tai user vui long su dung chung nang dang nhap --> Welcome Screen"

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Hero(
                tag: 'logo',
                child: Container(
                  height: 200.0,
                  child: Image.asset('images/lotus1.png'),
                )),
            SizedBox(
              height: 20.0,
            ),
            TextField(
              onChanged: (value) {
                //Do something with the user input.
                emailText = value;
              },
              style: new TextStyle(color: Colors.blue),
              decoration: InputDecoration(
                hintText: 'Vui lòng nhập Email',
                hintStyle: new TextStyle(color: Colors.blue),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            TextField(
              obscureText: true,
              onChanged: (value) {
                passwordText = value;
                //Do something with the user input.
              },
              style: new TextStyle(color: Colors.blue),
              decoration: InputDecoration(
                hintText: 'Vui lòng nhập mật khẩu',
                hintStyle: new TextStyle(color: Colors.blue),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                elevation: 5.0,
                child: MaterialButton(
                  onPressed: () {
                    //Implement registration functionality.
                    //save to db (table user)
                    _saveUser();
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: Text(
                    'Đăng ký',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _saveUser() async {
    int saveResult;
    if (emailText != null && passwordText != null) {
      //int result = await _db.saveUser(new User(emailText, passwordText));
      int result = await _db.checkExistUser(emailText);
      //Check if not Exist in DB --> Save to DB
      if (result == 0) {
        saveResult = await _db.saveUser(new User(emailText, passwordText));
        Navigator.pushNamed(context, humanInfoRoute, arguments: emailText);
      } else {
        Navigator.pop(context);
      }
      print(saveResult);
    }
  }
}
