import 'package:flutter/material.dart';

import 'package:carbs_tracker_ex/utils/router.dart';

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
      onGenerateRoute: Router.generateRoute,
      initialRoute: welcomeRoute,
    );
  }
}
