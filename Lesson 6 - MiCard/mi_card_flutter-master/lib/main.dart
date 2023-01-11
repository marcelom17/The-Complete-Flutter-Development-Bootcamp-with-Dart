import 'dart:convert';

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.center,
            //mainAxisSize: MainAxisSize.min,
            //verticalDirection: VerticalDirection.up,
            children: <Widget>[
              CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage('assets/rock.png'),
              ),
              Text(
                'Rock',
                style: TextStyle(
                    fontSize: 40.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Pacifico'),
              ),
              Text(
                'Rockstar Flutter Developer',
                style: TextStyle(
                    fontSize: 22.0,
                    color: Colors.teal.shade100,
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'SourceSansPro'),
              ),
              SizedBox(
                height: 40.0,
                width: 200.0,
                child: Divider(color: Colors.teal.shade100),
              ),
              Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  leading: Icon(
                    Icons.phone,
                    color: Colors.teal.shade600,
                  ),
                  title: Text(
                    "+123 123 456 789",
                    style: TextStyle(
                      color: Colors.teal.shade900,
                      fontFamily: 'SourceSansPro',
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ),
              Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  leading: Icon(
                    Icons.mail,
                    color: Colors.teal.shade600,
                  ),
                  title: Text(
                    "flutter_rockstar_dev@email.com",
                    style: TextStyle(
                      color: Colors.teal.shade900,
                      fontFamily: 'SourceSansPro',
                      fontSize: 18.0,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
