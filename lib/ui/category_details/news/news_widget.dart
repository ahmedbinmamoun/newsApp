import 'package:flutter/material.dart';
import 'package:news/api/api_manager.dart';
import 'package:news/model/NewsResponse.dart';
import 'package:news/model/SourseResponse.dart';
import 'package:news/model/category.dart';
import 'package:news/pagination/news_pagination_manager.dart';
import 'package:news/ui/category_details/news/news_item.dart';
import 'package:news/utils/app_colors.dart';

class NewsWidget extends StatefulWidget {
  Source source;
  Category? category;
   NewsWidget({super.key, required this.source});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  late Future<NewsResponse?> _newsFuture;
  final NewsPaginationManager paginationManager = NewsPaginationManager(pageSize: 20);
  final ScrollController scrollController = ScrollController();
  bool isLoading = false; 
  List<News> articales = []; 
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _newsFuture = ApiManager.getNewsBySourceId(widget.source.id?? '');
    loadMore();
    scrollController.addListener(() {
      if (scrollController.position.pixels >= scrollController.position.maxScrollExtent - 20) {
        loadMore();
      }
    },);

  }
  
  Future<void> loadMore() async{
    if(isLoading)return;
    setState(() {
      isLoading = true;
    });
    var newsArticales = await paginationManager.fetchNextPage(widget.source.id ?? '');
    setState(() {
      articales = newsArticales;
      isLoading = false;
    });
  }
  @override
Widget build(BuildContext context) {
  return articales.isEmpty && isLoading
      ? Center(child: CircularProgressIndicator())
      : RefreshIndicator(
          onRefresh: () async {
            paginationManager.reset();
            await loadMore();
          },
          child: ListView.builder(
            controller: scrollController,
            itemCount: articales.length + 1,
            itemBuilder: (context, index) {
              if (index == articales.length) {
                return isLoading
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(child: CircularProgressIndicator()),
                      )
                    : SizedBox();
              }
              return NewsItem(news: articales[index]);
            },
          ),
        );
}
}