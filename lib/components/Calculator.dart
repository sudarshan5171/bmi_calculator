import 'dart:math';

import 'package:flutter/material.dart';

class Calculator {
  final double height;
  final double weight;
  double bmi = 0;

  Calculator({required this.height, required this.weight}) {
    bmi = (weight / pow(height / 100, 2));
    print(bmi);
    String str = bmi.toStringAsFixed(2);
    print(str);
    bmi = double.parse(str);
    print(bmi);
  }

  double getBmi() {
    return bmi;
  }

  String getResult() {
    if (bmi < 18.5) {
      return "Thin";
    } else if (bmi < 25) {
      return "Normal";
    } else if (bmi <= 30) {
      return "Overweight";
    } else {
      return "Obese";
    }
  }

  String getTip() {
    if (bmi < 18.5) {
      return 'You have a lower than normal body weight. You can eat a bit more.';
    } else if (bmi < 25) {
      return 'You have a normal body weight. Good job!';
    } else if (bmi <= 30) {
      return 'You have a higher than normal body weight. Try to exercise more.';
    } else {
      return 'Your weight is much higher than normal body weight. Take a good diet and exercise daily';
    }
  }

  Color getColor() {
    if (bmi < 18.5) {
      return Color(0xFFd38888);
    } else if (bmi < 25) {
      return Color(0xFF008137);
    } else if (bmi <= 30) {
      return Color(0xFFfada0f);
    } else {
      return Color(0xFFbc2020);
    }
  }
}
