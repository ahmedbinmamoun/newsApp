import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:news/data/repository/sources/data_sources/local/source_local_data_source.dart';
import 'package:news/data/repository/sources/data_sources/remote/source_remote_data_source.dart';
import 'package:news/data/repository/sources/repository/source_repository.dart';
import 'package:news/model/source_response.dart';

@Injectable(as: SourceRepository)
class SourceRepositoryImpl implements SourceRepository {
  SourceRemoteDataSource remoteDataSource;
  SourceLocalDataSource localDataSource;
  SourceRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });
  @override
  Future<SourceResponse?> getSourcees(String categoryId) async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      var sourceResponse = await remoteDataSource.getSourcees(categoryId);
      localDataSource.saveSources(sourceResponse, categoryId);
      return sourceResponse;
    }else{
      var sourceResponse = await localDataSource.getSources(categoryId);
      return sourceResponse;
    }
  }
}
