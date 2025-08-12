import 'package:news/api/api_manager.dart';
import 'package:news/model/NewsResponse.dart';

class NewsPaginationManager {
  int _page = 1;
  bool _isLoading = false;
  bool _hasMore = true;

  final int pageSize;
  List<News> _articles = [];

  NewsPaginationManager({this.pageSize = 20});

  Future<List<News>> fetchNextPage(String sourceId) async {
    if (_isLoading || !_hasMore) return _articles;

    _isLoading = true;
    try {
      NewsResponse? response = await ApiManager.getNewsBySourceId(
        sourceId,
        page: _page,
        pageSize: pageSize,
      );

      if (response?.articlesList != null &&
          response!.articlesList!.isNotEmpty) {
        _articles.addAll(response.articlesList!);
        _page++;
      } else {
        _hasMore = false;
      }
    } finally {
      _isLoading = false;
    }

    return _articles;
  }

  void reset() {
    _page = 1;
    _articles.clear();
    _hasMore = true;
  }
}