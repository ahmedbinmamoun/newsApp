import 'package:hive/hive.dart';
import 'package:news/data/repository/sources/data_sources/local/source_local_data_source.dart';
import 'package:news/model/source_response.dart';

class SourceLocalDataSourceImpl implements SourceLocalDataSource{
  @override
  Future<SourceResponse?> getSources(String categoryId) async{
    var box = await Hive.openBox('SourcesTab');
    var sourceTab = box.get(categoryId);
    return sourceTab;
  }

  @override
  void saveSources(SourceResponse? sourceResponse, String categoryId) async{
    var box = await Hive.openBox('SourcesTab');
    await box.put(categoryId, sourceResponse);
    await box.close();
  }

}