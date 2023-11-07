import 'package:go_crypto/data/model/raw.dart';

import 'coin_info.dart';

class CoinsData {
  CoinInfo? coinInfo;
  RAW? display;

  CoinsData({this.coinInfo, this.display});

  CoinsData.fromJson(Map<String, dynamic> json) {
    coinInfo =
        json['CoinInfo'] != null ? CoinInfo.fromJson(json['CoinInfo']) : null;
    display = json['DISPLAY'] != null ? RAW.fromJson(json['DISPLAY']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (coinInfo != null) {
      data['CoinInfo'] = coinInfo!.toJson();
    }
    if (display != null) {
      data['DISPLAY'] = display!.toJson();
    }
    return data;
  }
}
