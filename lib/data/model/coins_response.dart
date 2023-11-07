import 'package:go_crypto/data/model/go_model.dart';
import 'package:go_crypto/data/model/rate_limiter.dart';

import 'coins_data.dart';
import 'coins_metadata.dart';

class CoinsResponse implements GoModel {
  String? message;
  int? type;
  CoinsMetaData? metaData;
  List<CoinsData>? data;
  RateLimit? rateLimit;
  bool? hasWarning;

  CoinsResponse({this.message, this.type, this.metaData,  this.data, this.rateLimit, this.hasWarning});

  CoinsResponse.fromJson(Map<String, dynamic> json) {
    message = json['Message'];
    type = json['Type'];
    metaData = json['MetaData'] != null ? CoinsMetaData.fromJson(json['MetaData']) : null;
    if (json['Data'] != null) {
      data = <CoinsData>[];
      json['Data'].forEach((v) { data!.add(CoinsData.fromJson(v)); });
    }
    rateLimit = json['RateLimit'] != null ? RateLimit.fromJson(json['RateLimit']) : null;
    hasWarning = json['HasWarning'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Message'] = message;
    data['Type'] = type;
    if (metaData != null) {
      data['MetaData'] = metaData!.toJson();
    }
    if (this.data != null) {
      data['Data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (rateLimit != null) {
      data['RateLimit'] = rateLimit!.toJson();
    }
    data['HasWarning'] = hasWarning;
    return data;
  }
}