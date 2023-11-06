
class SourceInfo {
  String? name;
  String? img;
  String? lang;

  SourceInfo({this.name, this.img, this.lang});

  SourceInfo.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    img = json['img'];
    lang = json['lang'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = this.name;
    data['img'] = this.img;
    data['lang'] = this.lang;
    return data;
  }
}