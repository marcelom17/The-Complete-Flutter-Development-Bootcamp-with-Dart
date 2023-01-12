import 'dart:developer';
import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({Key key}) : super(key: key);

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int d1 = 1, d2 = 2;

  void changeDice() {
    d1 = Random().nextInt(6) + 1;
    d2 = Random().nextInt(6) + 1;
    print(d1);
    print(d2);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Row(
          children: [
            Expanded(
              child: TextButton(
                  onPressed: () {
                    setState(() {
                      changeDice();
                    });
                  },
                  child: Image.asset('images/dice$d1.png')),
            ),
            Expanded(
              child: TextButton(
                  onPressed: () {
                    setState(() {
                      changeDice();
                    });
                  },
                  child: Image.asset('images/dice$d2.png')),
            ),
          ],
        ),
      ),
    );
  }
}
