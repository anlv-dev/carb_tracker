import 'package:carbs_tracker_ex/utils/database_helper.dart';
import 'package:flutter/material.dart';
import 'main_page.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'Login_Screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var _db = new DatabaseHelper();

  String emailText;
  String passwordText;

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
              height: 10.0,
            ),
            TextField(
              onChanged: (value) {
                emailText = value;
                //Do something with the user input.
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
                  borderSide:
                      BorderSide(color: Colors.lightBlueAccent, width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            TextField(
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
                  borderSide:
                      BorderSide(color: Colors.lightBlueAccent, width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
              ),
            ),
            SizedBox(
              height: 24.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                elevation: 1.0,
                child: MaterialButton(
                  onPressed: () {
                    _checkLogin();
                  },
                  minWidth: 200.0,
                  height: 20.0,
                  child: Text(
                    'Đăng nhập',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _checkLogin() async {
    if (emailText != null && passwordText != null) {
      //int result = await _db.saveUser(new User(emailText, passwordText));
      int result = await _db.checkLogin(emailText, passwordText);
      //Check if not Exist in DB --> Save to DB
      if (result == 1) {
        //saveResult = await _db.saveUser(new User(emailText, passwordText));
        //Navigator.pushNamed(context, HumanInfor.id);
        print('Ban da dang nhap thanh cong');
      } else {
        print('Email hoac mat khau khong dung!');
      }
    }
  }
}
