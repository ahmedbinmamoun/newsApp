import 'package:news/model/news_response.dart';

abstract class NewsLocalDataSource {

Future<NewsResponse?> getNewsBySourceId(String sourceId,{int page = 1, int pageSize = 20});
 void saveNews(NewsResponse? newsResponse, String sourceId);

}