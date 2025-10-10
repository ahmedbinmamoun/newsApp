import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news/model/category.dart';
import 'package:news/provider/app_theme_provider.dart';
import 'package:news/ui/home/category_fragment/widget/category_item.dart';
import 'package:provider/provider.dart';

typedef OnCategoryItemClick = void Function(Category);
class CategoryFragment extends StatelessWidget {
  List<Category> categoriesList = [];
  OnCategoryItemClick onCategoryItemClick;
   CategoryFragment({super.key, required this.onCategoryItemClick});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var appThemeProvider = Provider.of<AppThemeProvider>(context);
    categoriesList = Category.getCategoriesList(appThemeProvider.isDarkMode());
    return Padding(
      padding:  EdgeInsets.symmetric(
        horizontal: width * 0.03,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(context.tr('good_morning'),style: Theme.of(context).textTheme.headlineMedium,),
          Text(context.tr('here_some_news_for_you'),style: Theme.of(context).textTheme.headlineMedium,),
          SizedBox(height: height * 0.02,),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: (){
                      onCategoryItemClick(categoriesList[index]);
                  },
                  child: CategoryItem(category: categoriesList[index],index: index,));
              },
               separatorBuilder: (context, index) => SizedBox(height: height * 0.02,),
                itemCount: categoriesList.length),
          ),
        ],
      ),
    );
  }
}