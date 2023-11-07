import 'package:go_crypto/data/model/weiss.dart';

class Rating {
  Weiss? weiss;

  Rating({this.weiss});

  Rating.fromJson(Map<String, dynamic> json) {
    weiss = json['Weiss'] != null ? Weiss.fromJson(json['Weiss']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.weiss != null) {
      data['Weiss'] = this.weiss!.toJson();
    }
    return data;
  }
}