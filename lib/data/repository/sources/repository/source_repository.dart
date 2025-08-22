import 'package:news/model/SourseResponse.dart';

abstract class SourceRepository {

  Future<SourseResponse?> getSourcees(String categoryId);
}