import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/api/api_manager.dart';
import 'package:news/model/NewsResponse.dart';
import 'package:news/model/SourseResponse.dart';
import 'package:news/model/category.dart';
import 'package:news/pagination/news_pagination_manager.dart';
import 'package:news/ui/category_details/news/cubit/news_states.dart';
import 'package:news/ui/category_details/news/cubit/news_view_model.dart';
import 'package:news/ui/category_details/news/news_item.dart';
import 'package:news/utils/app_colors.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

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
  NewsViewModel viewModel = NewsViewModel();
  
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
    viewModel.getNewsBySourceId(widget.source.id ?? '');

  }
  

  @override
void didUpdateWidget(covariant NewsWidget oldWidget) {
  super.didUpdateWidget(oldWidget);

  if (oldWidget.source.id != widget.source.id) {
    paginationManager.reset();
    articales.clear();
    loadMore();
    viewModel.getNewsBySourceId(widget.source.id ?? '');
  }
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
  
  return BlocBuilder<NewsViewModel,NewsStates>(
    bloc: viewModel,
    builder: (context, state) {
      if(state is NewsErrorState){
        WidgetsBinding.instance.addPostFrameCallback((_) {
          
             QuickAlert.show(
              context: context,
               type: QuickAlertType.error,
               title: context.tr('error'),
               text: context.tr(state.errorMessage),
               confirmBtnText: context.tr('try_again'),
               confirmBtnColor: AppColors.blackColor,
               onConfirmBtnTap: () {
                viewModel.getNewsBySourceId(widget.source.id ?? '');
                 Navigator.pop(context);
                 setState(() {
                   
                 });
               },
               );

          },);
          return Container(
            color: Theme.of(context).primaryColor,
          );
      }else if(state is NewsSuccessState){
     return   RefreshIndicator(
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
      }else{
       return Center(child: CircularProgressIndicator());
      }
    },
    );
  // articales.isEmpty && isLoading
  //     ? Center(child: CircularProgressIndicator())
  //     : RefreshIndicator(
  //         onRefresh: () async {
  //           paginationManager.reset();
  //           await loadMore();
  //         },
  //         child: ListView.builder(
  //           controller: scrollController,
  //           itemCount: articales.length + 1,
  //           itemBuilder: (context, index) {
  //             if (index == articales.length) {
  //               return isLoading
  //                   ? Padding(
  //                       padding: const EdgeInsets.all(8.0),
  //                       child: Center(child: CircularProgressIndicator()),
  //                     )
  //                   : SizedBox();
  //             }
  //             return NewsItem(news: articales[index]);
  //           },
  //         ),
  //       );
}
}