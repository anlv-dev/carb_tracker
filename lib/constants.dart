import 'package:flutter/material.dart';

const Color kColorReusableCard = Color(0xFF1E1F34);
const Color kColorBottomContainer = Color(0xFFEA1556);
const Color kInactiveCardColour = Color(0xFF111328);
const Color kActiveCardColour = Color(0xFF1D1E33); //0xFF1D1E33
const double kBottomContainerHeight = 80.0;
const Color kInActiveSliderColour = Color(0xFF7C7C8A);
const Color kActiveSliderColour = Color(0xFFEA1556);

const TextStyle kLabelNumberStyle = TextStyle(
  fontSize: 50.0,
  fontWeight: FontWeight.w900,
);

const TextStyle kLabelTextStyle = TextStyle(
  fontSize: 18,
  color: Color(0xFF8E8E9B),
);

const TextStyle kLargeButtonText = TextStyle(
  fontSize: 18.0,
  color: Colors.white,
  letterSpacing: 2.0,
);

const TextStyle kYourResultStyle = TextStyle(
  fontSize: 30.0,
  fontWeight: FontWeight.bold,
);
const TextStyle kOnTopBMIResult = TextStyle(
  fontSize: 18.0,
  fontWeight: FontWeight.bold,
  color: Colors.green,
);
const TextStyle kNumberBMI = TextStyle(
  fontSize: 100.0,
  fontWeight: FontWeight.bold,
);
const TextStyle kBottomText = TextStyle(
  fontSize: 18.0,
);
const kSendButtonTextStyle = TextStyle(
  color: Colors.lightBlueAccent,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
  ),
);
