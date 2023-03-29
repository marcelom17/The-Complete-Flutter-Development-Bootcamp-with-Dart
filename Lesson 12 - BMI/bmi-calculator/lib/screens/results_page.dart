import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/logic/calculator_brain.dart';
import 'package:flutter/material.dart';

import '../components/bottom_button.dart';
import '../utils/constants.dart';

class ResultsPage extends StatelessWidget {
  final CalculatorBrain calculatorBrain;

  ResultsPage({@required this.calculatorBrain});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator".toUpperCase()),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                "Your Result",
                style: kTitleTextStyle,
              ),
            ),
          ),
          Expanded(
              flex: 5,
              child: ReusableCard(
                color: kActiveCardBackgroundColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      calculatorBrain.getResult().toUpperCase(),
                      style: kResultsTextStyle,
                    ),
                    Text(
                      calculatorBrain.getBMIValue(),
                      style: kBMITextStyle,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        calculatorBrain.getInterpretation(),
                        style: kBodyTextStyle,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              )),
          BottomButton(
            title: "Re-Calculate",
            ontap: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
