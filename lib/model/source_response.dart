import 'package:hive/hive.dart';

part 'source_response.g.dart';

@HiveType(typeId: 1)
class Source extends HiveObject{
  @HiveField(0)
  String? id;

  @HiveField(1)
  String? name;

  @HiveField(2)
  String? description;

  @HiveField(3)
  String? url;

  @HiveField(4)
  String? category;

  @HiveField(5)
  String? language;

  @HiveField(6)
  String? country;

  Source({
    this.id,
    this.name,
    this.description,
    this.url,
    this.category,
    this.language,
    this.country,
  });

  Source copyWith({
    String? id,
    String? name,
    String? description,
    String? url,
    String? category,
    String? language,
    String? country,
  }) =>
      Source(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        url: url ?? this.url,
        category: category ?? this.category,
        language: language ?? this.language,
        country: country ?? this.country,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "url": url,
        "category": category,
        "language": language,
        "country": country,
      };

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        url: json["url"],
        category: json["category"],
        language: json["language"],
        country: json["country"],
      );
}

@HiveType(typeId: 2)
class SourceResponse extends HiveObject {
  @HiveField(0)
  String? status;

  @HiveField(1)
  List<Source>? sourcesList;

  @HiveField(2)
  String? code;

  @HiveField(3)
  String? message;

  SourceResponse({this.status, this.sourcesList, this.code, this.message});

  SourceResponse copyWith({
    String? status,
    List<Source>? sourcesList,
  }) =>
      SourceResponse(
        status: status ?? this.status,
        sourcesList: sourcesList ?? this.sourcesList,
        code: code ?? this.code,
        message: message ?? this.message,
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "sources": sourcesList?.map((v) => v.toJson()).toList(),
        "code": code,
        "message": message,
      };

  factory SourceResponse.fromJson(Map<String, dynamic> json) => SourceResponse(
        status: json["status"],
        code: json["code"],
        message: json["message"],
        sourcesList: json["sources"] != null
            ? (json["sources"] as List)
                .map((v) => Source.fromJson(v))
                .toList()
            : null,
      );
}