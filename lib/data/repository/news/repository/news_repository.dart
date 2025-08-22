import 'package:news/model/NewsResponse.dart';

abstract class NewsRepository {

  Future<NewsResponse?> getNewsBySourceId(String sourceId,{int page = 1, int pageSize = 20});
}