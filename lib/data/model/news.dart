import 'source_info.dart';

class News {
  String? id;
  String? guid;
  int? publishedOn;
  String? imageurl;
  String? title;
  String? url;
  String? body;
  String? tags;
  String? lang;
  String? upvotes;
  String? downvotes;
  String? categories;
  SourceInfo? sourceInfo;
  String? source;

  News(
      {this.id,
      this.guid,
      this.publishedOn,
      this.imageurl,
      this.title,
      this.url,
      this.body,
      this.tags,
      this.lang,
      this.upvotes,
      this.downvotes,
      this.categories,
      this.sourceInfo,
      this.source});

  News.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    guid = json['guid'];
    publishedOn = json['published_on'];
    imageurl = json['imageurl'];
    title = json['title'];
    url = json['url'];
    body = json['body'];
    tags = json['tags'];
    lang = json['lang'];
    upvotes = json['upvotes'];
    downvotes = json['downvotes'];
    categories = json['categories'];
    sourceInfo = json['source_info'] != null
        ? SourceInfo.fromJson(json['source_info'])
        : null;
    source = json['source'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['guid'] = guid;
    data['published_on'] = publishedOn;
    data['imageurl'] = imageurl;
    data['title'] = title;
    data['url'] = url;
    data['body'] = body;
    data['tags'] = tags;
    data['lang'] = lang;
    data['upvotes'] = upvotes;
    data['downvotes'] = downvotes;
    data['categories'] = categories;
    if (sourceInfo != null) {
      data['source_info'] = sourceInfo!.toJson();
    }
    data['source'] = source;
    return data;
  }
}
