import 'package:bmi_calculator/utils/constants.dart';
import 'package:flutter/material.dart';
import 'screens/input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: kAppBaseColor,
        scaffoldBackgroundColor: kAppBaseColor,
      ),
      home: InputPage(),
    );
  }
}
