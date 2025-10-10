// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_response.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NewsAdapter extends TypeAdapter<News> {
  @override
  final int typeId = 3;

  @override
  News read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return News(
      source: fields[1] as Source?,
      author: fields[2] as String?,
      title: fields[3] as String?,
      description: fields[4] as String?,
      url: fields[5] as String?,
      urlToImage: fields[6] as String?,
      publishedAt: fields[7] as String?,
      content: fields[8] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, News obj) {
    writer
      ..writeByte(8)
      ..writeByte(1)
      ..write(obj.source)
      ..writeByte(2)
      ..write(obj.author)
      ..writeByte(3)
      ..write(obj.title)
      ..writeByte(4)
      ..write(obj.description)
      ..writeByte(5)
      ..write(obj.url)
      ..writeByte(6)
      ..write(obj.urlToImage)
      ..writeByte(7)
      ..write(obj.publishedAt)
      ..writeByte(8)
      ..write(obj.content);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NewsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class NewsResponseAdapter extends TypeAdapter<NewsResponse> {
  @override
  final int typeId = 4;

  @override
  NewsResponse read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NewsResponse(
      status: fields[1] as String?,
      totalResults: fields[2] as num?,
      articlesList: (fields[3] as List?)?.cast<News>(),
      code: fields[4] as String?,
      message: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, NewsResponse obj) {
    writer
      ..writeByte(5)
      ..writeByte(1)
      ..write(obj.status)
      ..writeByte(2)
      ..write(obj.totalResults)
      ..writeByte(3)
      ..write(obj.articlesList)
      ..writeByte(4)
      ..write(obj.code)
      ..writeByte(5)
      ..write(obj.message);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NewsResponseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
