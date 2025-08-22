import 'package:news/model/SourseResponse.dart';

abstract class SourceRemoteDataSource {

  Future<SourseResponse?> getSourcees(String categoryId);
}