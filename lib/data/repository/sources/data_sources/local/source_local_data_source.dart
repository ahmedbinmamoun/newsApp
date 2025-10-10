import 'package:news/model/source_response.dart';

abstract class SourceLocalDataSource {
 Future<SourceResponse?> getSources(String categoryId);
 void saveSources(SourceResponse? sourceResponse, String categoryId);
}