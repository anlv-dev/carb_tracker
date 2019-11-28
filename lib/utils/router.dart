import 'package:flutter/material.dart';
import 'package:carbs_tracker_ex/screens/login_screen.dart';
import 'package:carbs_tracker_ex/screens/welcome_screen.dart';
import 'package:carbs_tracker_ex/screens/registration_screen.dart';
import 'package:carbs_tracker_ex/screens/human_information.dart';
import 'package:carbs_tracker_ex/screens/main_track.dart';
import 'package:carbs_tracker_ex/screens/search_food.dart';
import 'package:carbs_tracker_ex/screens/search_delegate.dart';

/// This file contains all the routing constants used within the app

const String welcomeRoute = 'WelcomeScreen';
const String loginRoute = 'Login_Screen';
const String registerRoute = 'Registration_Screen';
const String humanInfoRoute = 'HumanInfor';
const String mainTrackRoute = 'Main_Track';
const String searchFoodRoute = 'SearchFoods';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case welcomeRoute:
        return MaterialPageRoute(builder: (_) => WelcomeScreen());
        break;
      case loginRoute:
        return MaterialPageRoute(builder: (_) => LoginScreen());
        break;
      case registerRoute:
        return MaterialPageRoute(builder: (_) => RegistrationScreen());
        break;
      case humanInfoRoute:
        var data = settings.arguments as String;
        return MaterialPageRoute(builder: (_) => HumanInfor(data));
        break;
      case mainTrackRoute:
        var data = settings.arguments as String;
        return MaterialPageRoute(builder: (_) => MyHomePage(data));
        break;
      case searchFoodRoute:
        return MaterialPageRoute(builder: (_) => SearchPageExample());
        break;

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
