class USD {
  String? type;
  String? price;
  String? changeHour;

  USD({this.type, this.price, this.changeHour});

  USD.fromJson(Map<String, dynamic> json) {
    type = json['TYPE'];
    price = json['PRICE'];
    changeHour = json['CHANGEHOUR'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['TYPE'] = type;
    data['PRICE'] = price;
    data['CHANGEHOUR'] = changeHour;
    return data;
  }
}
