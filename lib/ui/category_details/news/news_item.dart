import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/model/NewsResponse.dart';
import 'package:news/utils/app_colors.dart';
import 'package:news/widget/bottom_sheet_widget.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsItem extends StatelessWidget {
  News news;
  NewsItem({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return InkWell(
      onTap: (){
        showModalBottomSheet(
          backgroundColor: AppColors.transparentColor,
          context: context
        , builder: (context) {
          return BottomSheetWidget(news: news);
        },
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.02,
          vertical: height * 0.02,
        ),
        margin: EdgeInsets.only(bottom: height * 0.01),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Theme.of(context).indicatorColor, width: 1),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                imageUrl: news.urlToImage ?? '',
                placeholder:
                    (context, url) => Center(
                      child: CircularProgressIndicator(
                        color: AppColors.greyColor,
                      ),
                    ),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            SizedBox(height: height * 0.01),
            Text(news.title ?? '', style: Theme.of(context).textTheme.labelLarge),
            SizedBox(height: height * 0.01),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    'By: ${news.author}',
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ),
                Text(
                  timeago.format(DateTime.parse(news.publishedAt!).toLocal()),
                
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
