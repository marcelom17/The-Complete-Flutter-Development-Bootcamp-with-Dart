import 'package:bitcoin_ticker/Model/coin_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'constants.dart';

class CoinData {
  Future<Coin> getCoinData(String from, String to) async {
    var url = Uri.parse("$baseURL/$from/$to?apikey=$apiKey");

    print(url.toString());

    final http.Response response = await http.get(url);
    return Coin.fromRawJson(response.body);
    /* if (response.statusCode == 200) {
      print("response: 200");
      final coin = coinFromJson(response.body);
    } else {
      print("response code : ${response.statusCode}");
    } */
  }
}
