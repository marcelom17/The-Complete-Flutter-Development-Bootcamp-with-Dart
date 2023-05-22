// To parse this JSON data, do
//
//     final coin = coinFromJson(jsonString);

import 'dart:convert';

Coin coinFromJson(String str) => Coin.fromJson(json.decode(str));

String coinToJson(Coin data) => json.encode(data.toJson());

class Coin {
  final DateTime time;
  final String assetIdBase;
  final String assetIdQuote;
  final double rate;

  Coin({
    this.time,
    this.assetIdBase,
    this.assetIdQuote,
    this.rate,
  });

  factory Coin.fromRawJson(String str) => Coin.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Coin.fromJson(Map<String, dynamic> json) => Coin(
        time: DateTime.parse(json["time"]),
        assetIdBase: json["asset_id_base"],
        assetIdQuote: json["asset_id_quote"],
        rate: json["rate"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "time": time.toIso8601String(),
        "asset_id_base": assetIdBase,
        "asset_id_quote": assetIdQuote,
        "rate": rate,
      };
}
