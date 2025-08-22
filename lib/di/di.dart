import 'package:news/api/api_manager.dart';
import 'package:news/data/repository/news/data_source/remote/news_remote_data_source.dart';
import 'package:news/data/repository/news/data_source/remote/news_remote_data_source_impl.dart';
import 'package:news/data/repository/news/repository/news_repository.dart';
import 'package:news/data/repository/news/repository/news_repository_impl.dart';
import 'package:news/data/repository/sources/data_sources/remote/impl/source_remote_data_source_impl.dart';
import 'package:news/data/repository/sources/data_sources/remote/source_remote_data_source.dart';
import 'package:news/data/repository/sources/repository/impl/source_repository_impl.dart';
import 'package:news/data/repository/sources/repository/source_repository.dart';


SourceRepository injectSourceRepository(){
  return SourceRepositoryImpl(sourceRemoteDataSource: injectSourceRemoteDataSource());
}

SourceRemoteDataSource injectSourceRemoteDataSource(){
  return SourceRemoteDataSourceImpl(apiManager: injectApiManager());
}

ApiManager injectApiManager(){
  return ApiManager();
}

NewsRepository injectNewsRepository(){
  return NewsRepositoryImpl(remoteDataSource: injectNewsRemoteDataSource());
}

NewsRemoteDataSource injectNewsRemoteDataSource(){
  return NewsRemoteDataSourceImpl(apiManager: injectApiManager());
}