import 'package:bmi_calculator/screens/outputPage.dart';
import 'package:flutter/material.dart';

class MyBottomButton extends StatelessWidget {
  final String textVal;
  final VoidCallback onPress;

  MyBottomButton({required this.onPress, required this.textVal});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: 80,
        color: Color(0xFFEB1555),
        child: Text(
          textVal,
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
