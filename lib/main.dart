import 'package:flutter/material.dart';
import 'package:bmi/input.dart';
import 'dart:ui';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: InputPage(),
        theme: ThemeData(
            primaryColor: Color.fromARGB(189, 91, 52, 216),
            scaffoldBackgroundColor: Color.fromARGB(155, 24, 0, 48),
            textTheme: TextTheme(bodyMedium: TextStyle(color: Colors.white))));
  }
}
