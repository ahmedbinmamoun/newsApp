import 'package:news/api/api_manager.dart';
import 'package:news/data/repository/sources/data_sources/remote/source_remote_data_source.dart';
import 'package:news/model/SourseResponse.dart';

class SourceRemoteDataSourceImpl implements SourceRemoteDataSource{
  ApiManager apiManager;
  SourceRemoteDataSourceImpl({required this.apiManager});
  @override
  Future<SourseResponse?> getSourcees(String categoryId) async{
    var response = await apiManager.getSources(categoryId);
    return response;
  }

}