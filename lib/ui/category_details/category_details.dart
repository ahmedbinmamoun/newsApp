import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news/api/api_manager.dart';
import 'package:news/model/SourseResponse.dart';
import 'package:news/model/category.dart';
import 'package:news/ui/category_details/source/source_tab_widget.dart';
import 'package:news/utils/app_colors.dart';
import 'package:quickalert/quickalert.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class CategoryDetails extends StatefulWidget {
  Category category;
   CategoryDetails({super.key, required this.category});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();

  
}

class _CategoryDetailsState extends State<CategoryDetails> {
  late Future<SourseResponse?> _sourcesFuture;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _sourcesFuture = ApiManager.getSources(widget.category.id);
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourseResponse?>(
      future: _sourcesFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
          
             QuickAlert.show(
              context: context,
               type: QuickAlertType.error,
               title: context.tr('error'),
               text: context.tr('something_went_wrong'),
               confirmBtnText: context.tr('okay'),
               confirmBtnColor: AppColors.blackColor,
               onConfirmBtnTap: () {
               _sourcesFuture = ApiManager.getSources(widget.category.id);
                 Navigator.pop(context);
                 setState(() {
                   
                 });
               },
               );

          },);
          return Container(
            color: Theme.of(context).primaryColor,
          );
        } else if (snapshot.data?.status != 'ok') {
          WidgetsBinding.instance.addPostFrameCallback((_) {
          
             QuickAlert.show(
              context: context,
               type: QuickAlertType.error,
               title: context.tr('error'),
               text: context.tr('something_went_wrong'),
               confirmBtnColor: AppColors.blackColor,
               onConfirmBtnTap: () {
               _sourcesFuture = ApiManager.getSources(widget.category.id);
                 Navigator.pop(context);
                 setState(() {
                   
                 });
               },
               );

          },);
          }
        var sourcesList = snapshot.data?.sourcesList ?? [];
        return SourceTabWidget(sourcesList:sourcesList,category: widget.category,newsList: [],);
      },
    );
  }
}
