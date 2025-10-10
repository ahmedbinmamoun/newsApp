import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:news/data/repository/news/data_source/local/news_local_data_source.dart';
import 'package:news/data/repository/news/data_source/remote/news_remote_data_source.dart';
import 'package:news/data/repository/news/repository/news_repository.dart';
import 'package:news/model/news_response.dart';

@Injectable(as: NewsRepository)
class NewsRepositoryImpl implements NewsRepository{
  NewsRemoteDataSource remoteDataSource;
  NewsLocalDataSource localDataSource;
  NewsRepositoryImpl({required this.remoteDataSource,required this.localDataSource});
  @override
  Future<NewsResponse?> getNewsBySourceId(String sourceId,{int page = 1, int pageSize = 20}) async{
    // return remoteDataSource.getNewsBySourceId(sourceId);
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      var newsResponse = await remoteDataSource.getNewsBySourceId(sourceId);
      localDataSource.saveNews(newsResponse, sourceId);
      return newsResponse;
    }else{
      var newsResponse = await localDataSource.getNewsBySourceId(sourceId);
      return newsResponse;
    }
  }

}