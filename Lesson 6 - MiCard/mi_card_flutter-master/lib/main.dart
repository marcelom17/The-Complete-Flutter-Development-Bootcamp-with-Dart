import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Row(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            //mainAxisSize: MainAxisSize.min,
            //verticalDirection: VerticalDirection.up,
            children: <Widget>[
              Container(
                width: 100.0,
                //margin: EdgeInsets.symmetric(vertical: 50.0, horizontal: 20.0),
                padding: EdgeInsets.all(10.0),
                color: Colors.red,
                child: Text("Container 1"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
