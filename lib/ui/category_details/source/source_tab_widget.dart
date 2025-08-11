import 'package:flutter/material.dart';
import 'package:news/model/SourseResponse.dart';
import 'package:news/model/category.dart';
import 'package:news/ui/category_details/news/news_widget.dart';
import 'package:news/ui/category_details/source/source_name.dart';
import 'package:news/utils/app_colors.dart';

class SourceTabWidget extends StatefulWidget {
  List<Source> sourcesList;
  Category category;
  SourceTabWidget({required this.sourcesList, required this.category});

  @override
  State<SourceTabWidget> createState() => _SourceTabWidgetState();
}

class _SourceTabWidgetState extends State<SourceTabWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return DefaultTabController(
      length: widget.sourcesList.length,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.02),
        child: Column(
          children: [
            TabBar(
              onTap: (index) {
                selectedIndex = index;
                setState(() {});
                        },
                    isScrollable: true,
                    indicatorColor: Theme.of(context).indicatorColor,
                    dividerColor: AppColors.transparentColor,
                    tabAlignment: TabAlignment.start,
                    tabs:
                    widget.sourcesList.map((source) {
                    return SourceName(
                      source: source,
                      isSelected:
                          selectedIndex == widget.sourcesList.indexOf(source),
                    );
                  }).toList(),
            ),
            SizedBox(height: height * 0.03,),
            Expanded(
              child: NewsWidget(source: widget.sourcesList[selectedIndex]),
            ),
          ],
        ),
      ),
    );
  }
}
