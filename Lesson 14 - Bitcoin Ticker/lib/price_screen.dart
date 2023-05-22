import 'dart:io' show Platform;
import 'dart:math';

import 'package:bitcoin_ticker/Model/coin_model.dart';
import 'package:bitcoin_ticker/coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = "USD";
  String crypto = "BTC";

  final service = CoinData();

  @override
  void initState() {
    super.initState();
    getCoinData("USD");
  }

  void getCoinData(String coin) async {
    var data = await service.getCoinData(crypto, coin);
    if (data != null) {
      // print(data.rate.toString());
    }
  }

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

  List<Widget> getiOSPickerList() {
    List<Widget> list = [];
    for (var value in currenciesList) {
      list.add(Text(value));
    }
    return list;
  }

  NotificationListener iOSPickerNotifier(List<Widget> list) {
    return NotificationListener<ScrollEndNotification>(
      onNotification: (notification) {
        if (notification.metrics is! FixedExtentMetrics) {
          return false;
        }
        final index = (notification.metrics as FixedExtentMetrics).itemIndex;

        // This would be your callback function. Could use items[index]
        // or something if that's more appropriate of course.
        //onItemChanged(index);
        print("position: $index - item: ${list[index]}");
        Text selected = list[index] as Text;
        setState(() {
          selectedCurrency = selected.data;
        });

        // False allows the event to bubble up further
        return false;
      },
      child: CupertinoPicker(
          itemExtent: 34.0, onSelectedItemChanged: null, children: list),
    );
  }

  @override
  Widget build(BuildContext context) {
    final coin = service.getCoinData(cryptoList[0], selectedCurrency);
    final coin2 = service.getCoinData(cryptoList[1], selectedCurrency);
    final coin3 = service.getCoinData(cryptoList[2], selectedCurrency);

    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          CoinWidget(
              coin: coin,
              crypto: cryptoList[0],
              selectedCurrency: selectedCurrency),
          CoinWidget(
              coin: coin2,
              crypto: cryptoList[1],
              selectedCurrency: selectedCurrency),
          CoinWidget(
              coin: coin3,
              crypto: cryptoList[2],
              selectedCurrency: selectedCurrency),
          Spacer(),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Platform.isIOS
                ? iOSPickerNotifier(getiOSPickerList())
                : getAndroidDropdownButton(),
          ),
        ],
      ),
    );
  }
}

class CoinWidget extends StatelessWidget {
  const CoinWidget({
    Key key,
    @required this.coin,
    @required this.crypto,
    @required this.selectedCurrency,
  }) : super(key: key);

  final Future<Coin> coin;
  final String crypto;
  final String selectedCurrency;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
      child: Card(
        color: Colors.lightBlueAccent,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: FutureBuilder(
              future: coin,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return CoinText("'1 $crypto = ? $selectedCurrency'");
                } else {
                  final coinData = snapshot.data as Coin;
                  return CoinText(
                      "'1 $crypto = ${truncateToDecimalPlaces(coinData.rate, 3)} $selectedCurrency'");
                }
              }),
        ),
      ),
    );
  }
}

double truncateToDecimalPlaces(num value, int fractionalDigits) =>
    (value * pow(10, fractionalDigits)).truncate() / pow(10, fractionalDigits);

class CoinText extends StatelessWidget {
  final String text;

  CoinText(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 20.0,
        color: Colors.white,
      ),
    );
  }
}
