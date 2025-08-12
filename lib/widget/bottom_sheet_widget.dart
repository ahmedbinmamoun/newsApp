import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news/model/NewsResponse.dart';
import 'package:news/utils/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';

class BottomSheetWidget extends StatefulWidget {
  News news;
  BottomSheetWidget({super.key, required this.news});

  @override
  State<BottomSheetWidget> createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Container(
      height: height * 0.7,
      width: width,
      margin: EdgeInsets.symmetric(horizontal: width * 0.02),
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.02,
        vertical: height * 0.01,
      ),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        color: Theme.of(context).indicatorColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: CachedNetworkImage(
              imageUrl: widget.news.urlToImage ?? '',
              placeholder:
                  (context, url) => Center(
                    child: CircularProgressIndicator(
                      color: AppColors.greyColor,
                    ),
                  ),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          SizedBox(height: height * 0.02),
          Expanded(
            child: SingleChildScrollView(
              child: Text(
                widget.news.content ?? '',
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ),
          SizedBox(height: height * 0.02),
          InkWell(
            onTap: () async {
              final Uri uri = Uri.parse(widget.news.url!);
              if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
                print("Could not launch $uri");
              }
            },
            child: Container(
              alignment: Alignment.center,
              height: height * 0.07,
              margin: EdgeInsets.only(bottom: height * 0.01),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Theme.of(context).primaryColor,
              ),
              child: Text(
                context.tr('view_full_artical'),
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
