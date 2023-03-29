import 'dart:math';

class CalculatorBrain {
  final int height;
  final int weight;

  double _bmi;

  CalculatorBrain({this.height, this.weight}) {
    _bmi = weight / pow(height / 100, 2);
  }

  String getBMIValue() {
    return _bmi.toStringAsFixed(1); //double as string with 1 decimal value
  }

  String getResult() {
    if (_bmi >= 25) {
      return "Overweight";
    } else if (_bmi > 18.5) {
      return "Normal";
    } else {
      return "Underweight";
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return "You have a higher than normal body weight. Try to exercise more.";
    } else if (_bmi > 18.5) {
      return "You have a normal body weight. Good job! Maintain.";
    } else {
      return "You have a lower than normal body weight. you can eat a bit more.";
    }
  }
}
