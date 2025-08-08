class Sources {
  String? id;
  String? name;
  String? description;
  String? url;
  String? category;
  String? language;
  String? country;

  Sources({
    this.id,
    this.name,
    this.description,
    this.url,
    this.category,
    this.language,
    this.country,
  });

  Sources copyWith({
    String? id,
    String? name,
    String? description,
    String? url,
    String? category,
    String? language,
    String? country,
  }) => Sources(
    id: id ?? this.id,
    name: name ?? this.name,
    description: description ?? this.description,
    url: url ?? this.url,
    category: category ?? this.category,
    language: language ?? this.language,
    country: country ?? this.country,
  );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["id"] = id;
    map["name"] = name;
    map["description"] = description;
    map["url"] = url;
    map["category"] = category;
    map["language"] = language;
    map["country"] = country;
    return map;
  }

  Sources.fromJson(dynamic json) {
    id = json["id"];
    name = json["name"];
    description = json["description"];
    url = json["url"];
    category = json["category"];
    language = json["language"];
    country = json["country"];
  }
}

class SourseResponse {
  String? status;
  List<Sources>? sourcesList;
  String? code;
  String? message;

  SourseResponse({this.status, this.sourcesList, this.code, this.message});

  SourseResponse copyWith({String? status, List<Sources>? sourcesList}) =>
      SourseResponse(
        status: status ?? this.status,
        sourcesList: sourcesList ?? this.sourcesList,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["status"] = status;
    if (sourcesList != null) {
      map["sources"] = sourcesList?.map((v) => v.toJson()).toList();
    }
    return map;
  }

  SourseResponse.fromJson(dynamic json) {
    status = json["status"];
    code = json["code"];
    message = json["message"];
    if (json["sources"] != null) {
      sourcesList = [];
      json["sources"].forEach((v) {
        sourcesList?.add(Sources.fromJson(v));
      });
    }
  }
}
