import 'package:news/data/repository/news/data_source/remote/news_remote_data_source.dart';
import 'package:news/data/repository/news/repository/news_repository.dart';
import 'package:news/model/NewsResponse.dart';

class NewsRepositoryImpl implements NewsRepository{
  NewsRemoteDataSource remoteDataSource;
  NewsRepositoryImpl({required this.remoteDataSource});
  @override
  Future<NewsResponse?> getNewsBySourceId(String sourceId,{int page = 1, int pageSize = 20}) {
    return remoteDataSource.getNewsBySourceId(sourceId);
  }

}