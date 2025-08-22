import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/api/api_manager.dart';
import 'package:news/data/repository/news/repository/news_repository.dart';
import 'package:news/model/NewsResponse.dart';
import 'package:news/ui/category_details/news/cubit/news_states.dart';

class NewsViewModel extends Cubit<NewsStates> {
  final NewsRepository newsRepository;
  int _page = 1;
  final int pageSize = 20;
  bool _hasMore = true;
  bool _isLoading = false;
  List<News> _articles = [];

  NewsViewModel({required this.newsRepository}) : super(NewsLoadingState());

  Future<void> loadInitialNews(String sourceId) async {
    _page = 1;
    _articles.clear();
    _hasMore = true;
    await _fetchNews(sourceId, isInitial: true);
  }

  Future<void> loadMoreNews(String sourceId) async {
    if (_isLoading || !_hasMore) return;
    await _fetchNews(sourceId);
  }

  Future<void> _fetchNews(String sourceId, {bool isInitial = false}) async {
    _isLoading = true;
    try {
      if (isInitial) emit(NewsLoadingState());

      final response = await newsRepository.getNewsBySourceId(
        sourceId,
        page: _page,
        pageSize: pageSize,
      );

      if (response?.status == 'ok' && response?.articlesList != null) {
        if (response!.articlesList!.isEmpty) {
          _hasMore = false;
        } else {
          _articles.addAll(response.articlesList!);
          _page++;
        }
        emit(NewsSuccessState(newsList: List.from(_articles)));
      } else {
        emit(NewsErrorState(errorMessage: response?.message ?? 'Unknown error'));
      }
    } catch (e) {
      emit(NewsErrorState(errorMessage: e.toString()));
    } finally {
      _isLoading = false;
    }
  }

  void reset() {
    _page = 1;
    _articles.clear();
    _hasMore = true;
    _isLoading = false;
  }
}