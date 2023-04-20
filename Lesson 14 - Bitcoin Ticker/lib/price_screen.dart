import 'dart:io' show Platform;

import 'package:bitcoin_ticker/coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = "USD";

  DropdownButton<String> getAndroidDropdownButton() {
    List<DropdownMenuItem<String>> list = [];
    for (var value in currenciesList) {
      list.add(DropdownMenuItem(
        child: Text(value),
        value: value,
      ));
    }
    return DropdownButton(
      items: list,
      onChanged: ((value) {
        setState(() {
          selectedCurrency = value;
        });
      }),
    );
  }

  CupertinoPicker getiOSPicker() {
    List<Widget> list = [];
    for (var value in currenciesList) {
      list.add(Text(value));
    }
    return CupertinoPicker(
        itemExtent: 34.0,
        onSelectedItemChanged: ((value) {
          print("pos: $value");
        }),
        children: list);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = ? USD',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Platform.isIOS ? getiOSPicker() : getAndroidDropdownButton(),
          ),
        ],
      ),
    );
  }
}
