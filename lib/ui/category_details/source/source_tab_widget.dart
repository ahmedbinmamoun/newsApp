import 'package:flutter/material.dart';
import 'package:news/model/SourseResponse.dart';
import 'package:news/ui/category_details/source/source_name.dart';
import 'package:news/utils/app_colors.dart';

class SourceTabWidget extends StatelessWidget {
  List<Sources> sourcesList;
  SourceTabWidget({required this.sourcesList});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: sourcesList.length,
       child: Column(
        children: [
          TabBar(
            isScrollable: true,
            indicatorColor: Theme.of(context).indicatorColor,
            dividerColor: AppColors.transparentColor,
            tabAlignment: TabAlignment.start,
            tabs: sourcesList.map((source) {
            return SourceName(source: source,
            isSelected: true,);
          },).toList())
        ],
       )
       );
  }
}