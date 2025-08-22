import 'package:news/api/api_manager.dart';
import 'package:news/data/repository/news/data_source/remote/news_remote_data_source.dart';
import 'package:news/model/NewsResponse.dart';

class NewsRemoteDataSourceImpl implements NewsRemoteDataSource{
  ApiManager apiManager;
  NewsRemoteDataSourceImpl({required this.apiManager});
  @override
  Future<NewsResponse?> getNewsBySourceId(String sourceId,{int page = 1, int pageSize = 20}) async{
    var response = await apiManager.getNewsBySourceId(sourceId);
    return response;
  }

}