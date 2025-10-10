import 'package:hive/hive.dart';
import 'package:news/model/source_response.dart';
part 'news_response.g.dart';

@HiveType(typeId: 3)
class News extends HiveObject{
  @HiveField(1)
  Source? source;
  @HiveField(2)
  String? author;
  @HiveField(3)
  String? title;
  @HiveField(4)
  String? description;
  @HiveField(5)
  String? url;
  @HiveField(6)
  String? urlToImage;
  @HiveField(7)
  String? publishedAt;
  @HiveField(8)
  String? content;

  News({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  News copyWith({
    Source? source,
    String? author,
    String? title,
    String? description,
    String? url,
    String? urlToImage,
    String? publishedAt,
    String? content,
  }) => News(
    source: source ?? this.source,
    author: author ?? this.author,
    title: title ?? this.title,
    description: description ?? this.description,
    url: url ?? this.url,
    urlToImage: urlToImage ?? this.urlToImage,
    publishedAt: publishedAt ?? this.publishedAt,
    content: content ?? this.content,
  );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (source != null) {
      map["source"] = source?.toJson();
    }
    map["author"] = author;
    map["title"] = title;
    map["description"] = description;
    map["url"] = url;
    map["urlToImage"] = urlToImage;
    map["publishedAt"] = publishedAt;
    map["content"] = content;
    return map;
  }

  News.fromJson(dynamic json) {
    source = json["source"] != null ? Source.fromJson(json["source"]) : null;
    author = json["author"];
    title = json["title"];
    description = json["description"];
    url = json["url"];
    urlToImage = json["urlToImage"];
    publishedAt = json["publishedAt"];
    content = json["content"];
  }
}
@HiveType(typeId: 4)
class NewsResponse extends HiveObject{
  @HiveField(1)
  String? status;
  @HiveField(2)
  num? totalResults;
  @HiveField(3)
  List<News>? articlesList;
  @HiveField(4)
  String? code;
  @HiveField(5)
  String? message;

  NewsResponse({this.status, this.totalResults, this.articlesList, this.code, this.message});

  NewsResponse copyWith({
    String? status,
    num? totalResults,
    List<News>? articlesList,
  }) => NewsResponse(
    status: status ?? this.status,
    totalResults: totalResults ?? this.totalResults,
    articlesList: articlesList ?? this.articlesList,
  );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["status"] = status;
    map["totalResults"] = totalResults;
    if (articlesList != null) {
      map["articles"] = articlesList?.map((v) => v.toJson()).toList();
    }
    return map;
  }

  NewsResponse.fromJson(dynamic json) {
    status = json["status"];
    code = json["code"];
    message = json["message"];
    totalResults = json["totalResults"];
    if (json["articles"] != null) {
      articlesList = [];
      json["articles"].forEach((v) {
        articlesList?.add(News.fromJson(v));
      });
    }
  }
}
