import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/components/icon_content.dart';
import 'package:bmi_calculator/logic/calculator_brain.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../utils/constants.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender genderSelected;
  int height = 180;
  int weigth = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(children: [
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        genderSelected = Gender.male;
                      });
                    },
                    color: genderSelected == Gender.male
                        ? kActiveCardBackgroundColor
                        : kInactiveCardBackgroundColor,
                    cardChild: IconWidget(
                      icon: FontAwesomeIcons.mars,
                      text: "MALE",
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        genderSelected = Gender.female;
                      });
                    },
                    color: genderSelected == Gender.female
                        ? kActiveCardBackgroundColor
                        : kInactiveCardBackgroundColor,
                    cardChild: IconWidget(
                      icon: FontAwesomeIcons.venus,
                      text: "FEMALE",
                    ),
                  ),
                )
              ]),
            ),
            Expanded(
              child: ReusableCard(
                color: kActiveCardBackgroundColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "HEIGHT",
                      style: kLabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: kNumberTextStyle,
                        ),
                        Text(
                          "cm",
                          style: kLabelTextStyle,
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        inactiveTickMarkColor: kSliderInactiveColor,
                        thumbColor: Color(0xFFEB1555),
                        overlayColor: Color(0x1fEB1555),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape:
                            (RoundSliderOverlayShape(overlayRadius: 30.0)),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120,
                        max: 220,
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(children: [
                Expanded(
                  child: ReusableCard(
                    color: kActiveCardBackgroundColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Weight".toUpperCase(),
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weigth.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPress: (() {
                                setState(() {
                                  weigth--;
                                });
                              }),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPress: (() {
                                setState(() {
                                  weigth++;
                                });
                              }),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: kActiveCardBackgroundColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Age".toUpperCase(),
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPress: (() {
                                setState(() {
                                  age--;
                                });
                              }),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPress: (() {
                                setState(() {
                                  age++;
                                });
                              }),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ]),
            ),
            BottomButton(
              title: "Calculate",
              ontap: () {
                CalculatorBrain calc =
                    CalculatorBrain(height: height, weight: weigth);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => ResultsPage(
                          calculatorBrain: calc,
                        )),
                  ),
                );
              },
            )
          ],
        ));
  }
}

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final Function onPress;

  RoundIconButton({@required this.icon, @required this.onPress});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      shape: CircleBorder(),
      elevation: 0.0,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      fillColor: kButtonBackgroundColor,
      onPressed: onPress,
      child: Icon(icon),
    );
  }
}
