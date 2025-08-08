import 'package:news/model/SourseResponse.dart';

class News {
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
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

class NewsResponse {
  String? status;
  num? totalResults;
  List<News>? articlesList;
  String? code;
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
