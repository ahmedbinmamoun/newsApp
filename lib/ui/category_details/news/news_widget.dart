import 'package:flutter/material.dart';
import 'package:news/api/api_manager.dart';
import 'package:news/model/NewsResponse.dart';
import 'package:news/model/SourseResponse.dart';
import 'package:news/ui/category_details/news/news_item.dart';
import 'package:news/utils/app_colors.dart';

class NewsWidget extends StatefulWidget {
  Source source;
   NewsWidget({super.key, required this.source});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  late Future<NewsResponse?> _newsFuture;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _newsFuture = ApiManager.getNewsBySourceId(widget.source.id?? '');
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsResponse?>(
      future: _newsFuture = ApiManager.getNewsBySourceId(widget.source.id?? ''),
       builder: (context, snapshot) {
         if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(color: AppColors.greyColor),
          );
        } else if (snapshot.hasError) {
          return Column(
            children: [
              Text(
                'something went wrong..',
                style: Theme.of(context).textTheme.labelMedium,
              ),
              ElevatedButton(
                onPressed: () {
                  ApiManager.getSources();
                  setState(() {
                    
                  });
                },
                child: Text(
                  'Try Again',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
            ],
          );
        } else if (snapshot.data?.status != 'ok') {
          return Column(
            children: [
              Text(
                snapshot.data!.message!,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              ElevatedButton(
                onPressed: () {
                  ApiManager.getSources();
                  setState(() {
                    
                  });
                },
                child: Text(
                  'Try Again',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
            ],
          );
        }
        var newsList = snapshot.data?.articlesList ?? [];
        return ListView.builder(
          itemCount: newsList.length,
          itemBuilder: (context, index) {
            return NewsItem(news: newsList[index]);
          },
          );
       },
       );
  }
}