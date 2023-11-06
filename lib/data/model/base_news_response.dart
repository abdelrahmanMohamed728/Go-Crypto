
import 'package:go_crypto/data/model/go_model.dart';
import 'news.dart';
import 'package:go_crypto/data/model/rate_limiter.dart';


class BaseNewsResponse extends GoModel {
  int? type;
  String? message;
  List<News>? news;
  RateLimit? rateLimit;
  bool? hasWarning;

  BaseNewsResponse({this.type, this.message, this.news, this.rateLimit, this.hasWarning});

  BaseNewsResponse.fromJson(Map<String, dynamic> json) {
    type = json['Type'];
    message = json['Message'];
    if (json['Data'] != null) {
      news = <News>[];
      json['Data'].forEach((v) { news!.add(News.fromJson(v)); });
    }
    rateLimit = json['RateLimit'] != null ? RateLimit.fromJson(json['RateLimit']) : null;
    hasWarning = json['HasWarning'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Type'] = type;
    data['Message'] = message;
    if (news != null) {
      data['Data'] = news!.map((v) => v.toJson()).toList();
    }
    if (rateLimit != null) {
      data['RateLimit'] = rateLimit!.toJson();
    }
    data['HasWarning'] = hasWarning;
    return data;
  }
}