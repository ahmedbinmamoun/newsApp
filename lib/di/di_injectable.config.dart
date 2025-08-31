// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../api/api_manager.dart' as _i1047;
import '../data/repository/news/data_source/local/news_local_data_source.dart'
    as _i138;
import '../data/repository/news/data_source/local/news_local_data_source_impl.dart'
    as _i469;
import '../data/repository/news/data_source/remote/news_remote_data_source.dart'
    as _i319;
import '../data/repository/news/data_source/remote/news_remote_data_source_impl.dart'
    as _i149;
import '../data/repository/news/repository/news_repository.dart' as _i912;
import '../data/repository/news/repository/news_repository_impl.dart' as _i905;
import '../data/repository/sources/data_sources/local/source_local_data_source.dart'
    as _i316;
import '../data/repository/sources/data_sources/local/source_local_data_source_impl.dart'
    as _i821;
import '../data/repository/sources/data_sources/remote/impl/source_remote_data_source_impl.dart'
    as _i868;
import '../data/repository/sources/data_sources/remote/source_remote_data_source.dart'
    as _i567;
import '../data/repository/sources/repository/impl/source_repository_impl.dart'
    as _i250;
import '../data/repository/sources/repository/source_repository.dart' as _i522;
import '../ui/category_details/cubit/sources_view_model.dart' as _i980;
import '../ui/category_details/news/cubit/news_view_model.dart' as _i47;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i1047.ApiManager>(() => _i1047.ApiManager());
    gh.factory<_i319.NewsRemoteDataSource>(() =>
        _i149.NewsRemoteDataSourceImpl(apiManager: gh<_i1047.ApiManager>()));
    gh.factory<_i138.NewsLocalDataSource>(
        () => _i469.NewsLocalDataSourceImpl());
    gh.factory<_i316.SourceLocalDataSource>(
        () => _i821.SourceLocalDataSourceImpl());
    gh.factory<_i567.SourceRemoteDataSource>(() =>
        _i868.SourceRemoteDataSourceImpl(apiManager: gh<_i1047.ApiManager>()));
    gh.factory<_i912.NewsRepository>(() => _i905.NewsRepositoryImpl(
          remoteDataSource: gh<_i319.NewsRemoteDataSource>(),
          localDataSource: gh<_i138.NewsLocalDataSource>(),
        ));
    gh.factory<_i522.SourceRepository>(() => _i250.SourceRepositoryImpl(
          remoteDataSource: gh<_i567.SourceRemoteDataSource>(),
          localDataSource: gh<_i316.SourceLocalDataSource>(),
        ));
    gh.factory<_i47.NewsViewModel>(
        () => _i47.NewsViewModel(newsRepository: gh<_i912.NewsRepository>()));
    gh.factory<_i980.SourcesViewModel>(() =>
        _i980.SourcesViewModel(sourceRepository: gh<_i522.SourceRepository>()));
    return this;
  }
}
