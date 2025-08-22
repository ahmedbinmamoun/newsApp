import 'package:news/data/repository/sources/data_sources/remote/source_remote_data_source.dart';
import 'package:news/data/repository/sources/repository/source_repository.dart';
import 'package:news/model/SourseResponse.dart';

class SourceRepositoryImpl implements SourceRepository{
  SourceRemoteDataSource sourceRemoteDataSource;
  SourceRepositoryImpl({required this.sourceRemoteDataSource});
  @override
  Future<SourseResponse?> getSourcees(String categoryId) async{
    return sourceRemoteDataSource.getSourcees(categoryId);
  }

}