import 'package:bmi_calculator/screens/my_bottom_button.dart';
import 'package:bmi_calculator/screens/outputPage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/MyCard.dart';
import '../components/RoundIconButton.dart';
import '../components/constants.dart';
import 'package:bmi_calculator/components/Calculator.dart';

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double height = 150.0;
  double weight = 60.0;
  int age = 25;
  Gender selectedGender = Gender.male;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI Calculator"),
        backgroundColor: const Color(0xFF090C22),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: MyCard(
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          FontAwesomeIcons.person,
                          size: 80,
                        ),
                        const Text(
                          "male",
                          style: labelTextStyle,
                        ),
                      ],
                    ),
                    () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    selectedGender == Gender.male
                        ? kActiveCardColour
                        : kInactiveCardColour,
                  ),
                ),
                Expanded(
                  child: MyCard(
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            FontAwesomeIcons.personDress,
                            size: 80,
                          ),
                          const Text(
                            "female",
                            style: labelTextStyle,
                          ),
                        ],
                      ), () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                      selectedGender == Gender.female
                          ? kActiveCardColour
                          : kInactiveCardColour),
                ),
              ],
            ),
          ),
          Expanded(
            child: MyCard(
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "HEIGHT",
                      style: labelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      textBaseline: TextBaseline.alphabetic,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      children: [
                        Text(
                          height.toInt().toString(),
                          style: numberTextStyle,
                        ),
                        const Text(
                          "cm",
                          style: labelTextStyle,
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: const Color(0xFF8D8E98),
                        thumbColor: const Color(0xFFEB1555),
                        overlayColor: const Color(0x29EB1555),
                        thumbShape: const RoundSliderThumbShape(
                            enabledThumbRadius: 15.0),
                        overlayShape:
                            const RoundSliderOverlayShape(overlayRadius: 25.0),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        onChanged: (value) {
                          setState(() {
                            height = value;
                          });
                        },
                        min: 120.0,
                        max: 220.0,
                      ),
                    ),
                  ],
                ), () {
              print("click");
            }, kInactiveCardColour),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: MyCard(
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "WEIGHT",
                            style: labelTextStyle,
                          ),
                          Text(
                            weight.toInt().toString(),
                            style: numberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton.name(FontAwesomeIcons.minus, () {
                                setState(() {
                                  weight--;
                                });
                              }),
                              const SizedBox(
                                width: 10,
                              ),
                              RoundIconButton.name(FontAwesomeIcons.plus, () {
                                setState(() {
                                  weight++;
                                });
                              }),
                            ],
                          )
                        ],
                      ), () {
                    print("click");
                  }, kInactiveCardColour),
                ),
                Expanded(
                  child: MyCard(
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "AGE",
                            style: labelTextStyle,
                          ),
                          Text(
                            age.toString(),
                            style: numberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton.name(FontAwesomeIcons.minus, () {
                                setState(() {
                                  age--;
                                });
                              }),
                              const SizedBox(
                                width: 10,
                              ),
                              RoundIconButton.name(FontAwesomeIcons.plus, () {
                                setState(() {
                                  age++;
                                });
                              }),
                            ],
                          ),
                        ],
                      ), () {
                    print("click");
                  }, kInactiveCardColour),
                ),
              ],
            ),
          ),
          MyBottomButton(
            textVal: "Calculate",
            onPress: () {
              Calculator calc = Calculator(height: height, weight: weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => OutputPage(
                    bmi: calc.getBmi(),
                    result: calc.getResult(),
                    tip: calc.getTip(),
                    changeColor: calc.getColor(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

//my card template
