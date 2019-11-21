import 'package:flutter/material.dart';
import '../constants.dart';

class ButtonBottom extends StatelessWidget {
  ButtonBottom({@required this.textButton, @required this.onTap});
  final String textButton;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            textButton,
            style: kLargeButtonText,
          ),
        ),
        margin: EdgeInsets.only(top: 10.0),
        color: Colors.teal,
        width: double.infinity,
        height: kBottomContainerHeight,
      ),
    );
  }
}