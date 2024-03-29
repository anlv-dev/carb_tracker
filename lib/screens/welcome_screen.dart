import 'package:carbs_tracker_ex/models/foodBank.dart';
import 'package:carbs_tracker_ex/screens/login_screen.dart';
import 'package:carbs_tracker_ex/screens/registration_screen.dart';
import 'package:carbs_tracker_ex/utils/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:carbs_tracker_ex/models/food_Banks.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'WelcomeScreen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  var _db = DatabaseHelper();
  static String id = 'Welcome_Screen';

  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();
    //_db = DatabaseHelper();
    _initFoodBank();

    controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );

    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(controller);
    controller.forward();

    //controller.reverse(from: 1.0);

    controller.addListener(() {
      setState(() {});
      //print(animation.value);
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/lotus1.png'),
                    height: 60.0,
                  ),
                ),
                Text(
                  'Track Carbohydrate',
                  style: TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                elevation: 5.0,
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.circular(30.0),
                child: MaterialButton(
                  onPressed: () {
                    //Go to login screen.
                    Navigator.pushNamed(context, LoginScreen.id);
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: Text(
                    'Đăng nhập',
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(30.0),
                elevation: 5.0,
                child: MaterialButton(
                  onPressed: () {
                    //Go to registration screen.
                    Navigator.pushNamed(context, RegistrationScreen.id);
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: Text(
                    'Đăng ký',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _initFoodBank() async {
    int _countRecord = await _db.getCountFoodBanks();
    //print('Number of records of FoodBank table: $_countRecord');
    var _foodBank = new FoodBank();
    if (_countRecord == 0) {
      for(int i =0; i < _foodBank.lstFoods.length; i++){
        await _db.saveFoodBanks(new FoodBanker(
            _foodBank.lstFoods[i].foodName, _foodBank.lstFoods[i].dv, _foodBank.lstFoods[i].carbs, 0, _foodBank.lstFoods[i].group));
        }
    }
    //int _resultRecord = await _db.getCountFoodBanks();
    //print('Number of records of FoodBank table: $_resultRecord');
  }



}
