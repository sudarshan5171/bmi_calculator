import 'package:flutter/material.dart';
import 'screens/inputPage.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'BMI calculator',
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      home: MyApp(),
    ),
  );
}
