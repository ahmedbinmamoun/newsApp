import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:news/data/repository/news/data_source/local/news_local_data_source.dart';
import 'package:news/model/news_response.dart';

@Injectable(as: NewsLocalDataSource)
class NewsLocalDataSourceImpl implements NewsLocalDataSource{
  @override
  Future<NewsResponse?> getNewsBySourceId(String sourceId, {int page = 1, int pageSize = 20}) async{
    var box = await Hive.openBox('localNews');
    var localNews = box.get(sourceId);
    return localNews;
  }

  @override
  void saveNews(NewsResponse? newsResponse, String sourceId) async{
    var box = await Hive.openBox('localNews');
    await box.put(sourceId, newsResponse);
    await box.close();
  }

}