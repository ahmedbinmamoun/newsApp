import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/di/di.dart';
import 'package:news/model/SourseResponse.dart';
import 'package:news/model/category.dart';
import 'package:news/ui/category_details/news/cubit/news_states.dart';
import 'package:news/ui/category_details/news/cubit/news_view_model.dart';
import 'package:news/ui/category_details/news/news_item.dart';
import 'package:news/utils/app_colors.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class NewsWidget extends StatefulWidget {
  final Source source;
  final Category? category;

  const NewsWidget({super.key, required this.source, this.category});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  final ScrollController scrollController = ScrollController();
  late NewsViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = NewsViewModel(newsRepository: injectNewsRepository());
    viewModel.loadInitialNews(widget.source.id ?? '');

    scrollController.addListener(() {
      if (scrollController.position.pixels >= scrollController.position.maxScrollExtent - 100) {
        viewModel.loadMoreNews(widget.source.id ?? '');
      }
    });
  }

  @override
  void didUpdateWidget(covariant NewsWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.source.id != widget.source.id) {
      viewModel.reset();
      viewModel.loadInitialNews(widget.source.id ?? '');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsViewModel, NewsStates>(
      bloc: viewModel,
      builder: (context, state) {
        if (state is NewsLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is NewsErrorState) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            QuickAlert.show(
              context: context,
              type: QuickAlertType.error,
              title: context.tr('error'),
              text: context.tr(state.errorMessage),
              confirmBtnText: context.tr('try_again'),
              confirmBtnColor: AppColors.blackColor,
              onConfirmBtnTap: () {
                Navigator.pop(context);
                viewModel.loadInitialNews(widget.source.id ?? '');
              },
            );
          });
          return Container();
        } else if (state is NewsSuccessState) {
          final articles = state.newsList;
          return RefreshIndicator(
            onRefresh: () async {
              viewModel.reset();
              await viewModel.loadInitialNews(widget.source.id ?? '');
            },
            child: ListView.builder(
              controller: scrollController,
              itemCount: articles.length + 1,
              itemBuilder: (context, index) {
                if (index == articles.length) {
                  return const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(child: CircularProgressIndicator()),
                  );
                }
                return NewsItem(news: articles[index]);
              },
            ),
          );
        }

        return const SizedBox();
      },
    );
  }
}