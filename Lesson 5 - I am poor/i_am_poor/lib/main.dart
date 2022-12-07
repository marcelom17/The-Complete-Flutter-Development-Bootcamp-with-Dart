import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text('i am poor'),
        backgroundColor: Colors.brown,
      ),
      body: Center(
        child: Image(image: AssetImage('assets/icons8-rock.png')),
      ),
    ),
  ));
}
