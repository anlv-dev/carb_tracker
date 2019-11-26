import 'package:carbs_tracker_ex/models/human_information.dart';
import 'package:carbs_tracker_ex/screens/main_page.dart';
import 'package:carbs_tracker_ex/screens/search_food.dart';
import 'package:flutter/material.dart';
import 'package:carbs_tracker_ex/screens/welcome_screen.dart';
import 'package:carbs_tracker_ex/screens/login_screen.dart';
import 'package:carbs_tracker_ex/screens/registration_screen.dart';
import 'package:carbs_tracker_ex/screens/chat_screen.dart';

void main() => runApp(FlashChat());

class FlashChat extends StatelessWidget {
  //final String emailText = 'anlv.it.vn@vnn.vn';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark().copyWith(
          textTheme: TextTheme(
            body1: TextStyle(color: Colors.black54),
          ),
        ),
        initialRoute: WelcomeScreen.id,
        routes: {
          WelcomeScreen.id: (context) => WelcomeScreen(),
          LoginScreen.id: (context) => LoginScreen(),
          HumanInfor.id: (context) => HumanInfor(),
          RegistrationScreen.id: (context) => RegistrationScreen(),
          MainTab.id: (context) => MainTab(),
          SearchPage.id: (context) => SearchPage(),
          ChatScreen.id: (context) => ChatScreen(),
        });
  }
}
