import 'package:go_crypto/data/model/rating.dart';

class CoinInfo {
  String? id;
  String? name;
  String? fullName;
  String? internal;
  String? imageUrl;
  String? url;
  String? algorithm;
  String? proofType;
  Rating? rating;

  CoinInfo({
    this.id,
    this.name,
    this.fullName,
    this.internal,
    this.imageUrl,
    this.url,
    this.algorithm,
    this.proofType,
    this.rating,
  });

  CoinInfo.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    name = json['Name'];
    fullName = json['FullName'];
    internal = json['Internal'];
    imageUrl = json['ImageUrl'];
    url = json['Url'];
    algorithm = json['Algorithm'];
    proofType = json['ProofType'];
    rating = json['Rating'] != null ? Rating.fromJson(json['Rating']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['Name'] = name;
    data['FullName'] = fullName;
    data['Internal'] = internal;
    data['ImageUrl'] = imageUrl;
    data['Url'] = url;
    data['Algorithm'] = algorithm;
    data['ProofType'] = proofType;
    if (rating != null) {
      data['Rating'] = rating!.toJson();
    }
    return data;
  }
}
