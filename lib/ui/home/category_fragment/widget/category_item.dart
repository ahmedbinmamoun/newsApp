import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:news/model/category.dart';
import 'package:news/provider/app_language_provider.dart';
import 'package:news/utils/app_colors.dart';
import 'package:provider/provider.dart';

class CategoryItem extends StatelessWidget {
  Category category;
  int index;
   CategoryItem({super.key, required this.category, required this.index});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    bool isEven = index % 2 == 0;
    var appLanguageProvider = Provider.of<AppLanguageProvider>(context);
    return SizedBox(
      width: width,
      child: Stack(
        alignment: isEven ? Alignment.bottomRight : Alignment.bottomLeft,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Image.asset(category.image),
            
          ),
          Container(
            width: width * 0.4,
            margin: EdgeInsets.symmetric(
              horizontal: width * 0.04,
              vertical: height * 0.02
            ),
            padding: isEven ? EdgeInsetsDirectional.only(
              start:appLanguageProvider.isEnglish() ? width * 0.02 : 0,
              end: appLanguageProvider.isEnglish() ? 0 : width * 0.02,
            ) : 
                    EdgeInsetsDirectional.only(
              start: !appLanguageProvider.isEnglish() ? width * 0.02 : 0,
              end: !appLanguageProvider.isEnglish() ? 0 : width * 0.02,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(84),
              color: AppColors.greyColor,
            ),
            child: Row(
              textDirection: isEven ? ui.TextDirection.ltr : ui.TextDirection.rtl,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(context.tr('view_all'),style: Theme.of(context).textTheme.headlineMedium,),
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Theme.of(context).primaryColor,
                  child: Icon(
                    isEven ?
                    Icons.arrow_forward_ios
                    :Icons.arrow_back_ios_new,
                    color: Theme.of(context).indicatorColor,),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}