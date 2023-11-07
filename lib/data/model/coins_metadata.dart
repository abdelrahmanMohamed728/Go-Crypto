class CoinsMetaData {
  int? count;

  CoinsMetaData({this.count});

  CoinsMetaData.fromJson(Map<String, dynamic> json) {
    count = json['Count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Count'] = count;
    return data;
  }
}