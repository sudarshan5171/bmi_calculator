import 'package:bmi_calculator/components/MyCard.dart';
import 'package:bmi_calculator/components/constants.dart';
import 'package:bmi_calculator/screens/my_bottom_button.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/components/linear_progress_bar.dart';

class OutputPage extends StatelessWidget {
  double bmi;
  final String result;
  final String tip;
  Color changeColor;

  OutputPage(
      {required this.bmi,
      required this.result,
      required this.tip,
      required this.changeColor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF090C22),
        title: Text("BMI Calculator"),
      ),
      body: Column(
        children: [
          Expanded(
            child: MyCard(
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Your Result",
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        bmi.toStringAsFixed(1),
                        style: TextStyle(
                          fontSize: 100,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Center(
                          child: FAProgressBar(
                            size: 70,
                            progressColor: Colors.greenAccent,
                            backgroundColor: Colors.blueAccent,
                            animatedDuration: const Duration(seconds: 3),
                            changeProgressColor: changeColor,
                            changeColorValue: (bmi - 5).toInt(),
                            maxValue: 40,
                            currentValue: bmi,
                            displayText: "  $result ",
                            displayTextStyle: TextStyle(
                              letterSpacing: 1,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        tip,
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.redAccent,
                        ),
                      )
                    ],
                  ),
                ),
                () {},
                kActiveCardColour),
          ),
          MyBottomButton(
              onPress: () {
                Navigator.pop(context);
              },
              textVal: "RE-CALCULATE"),
        ],
      ),
    );
  }
}
