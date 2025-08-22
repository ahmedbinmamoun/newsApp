import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/api/api_manager.dart';
import 'package:news/di/di.dart';
import 'package:news/model/SourseResponse.dart';
import 'package:news/model/category.dart';
import 'package:news/ui/category_details/cubit/sources_states.dart';
import 'package:news/ui/category_details/cubit/sources_view_model.dart';
import 'package:news/ui/category_details/source/source_tab_widget.dart';
import 'package:news/utils/app_colors.dart';
import 'package:quickalert/quickalert.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class SourceDetails extends StatefulWidget {
  Category category;
   SourceDetails({super.key, required this.category});

  @override
  State<SourceDetails> createState() => _SourceDetailsState();

  
}

class _SourceDetailsState extends State<SourceDetails> {
  late Future<SourseResponse?> _sourcesFuture;
  SourcesViewModel viewModel = SourcesViewModel(sourceRepository: injectSourceRepository());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _sourcesFuture = ApiManager.getSources(widget.category.id);
    viewModel.getSources(widget.category.id);
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SourcesViewModel,SourceStates>(
      bloc: viewModel,
      builder: (context, state) {
        if (state is SourceSuccessState) {
          return SourceTabWidget(sourcesList:state.sourcesList,category: widget.category,newsList: [],);
        }else if(state is SourceErrorState){
          WidgetsBinding.instance.addPostFrameCallback((_) {
          
             QuickAlert.show(
              context: context,
               type: QuickAlertType.error,
               title: context.tr('error'),
               text: context.tr(state.errorMessage),
               confirmBtnText: context.tr('try_again'),
               confirmBtnColor: AppColors.blackColor,
               onConfirmBtnTap: () {
                viewModel.getSources(widget.category.id);
                 Navigator.pop(context);
                 setState(() {
                   
                 });
               },
               );

          },);
          return Container(
            color: Theme.of(context).primaryColor,
          );
        }else{
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
      );
    // FutureBuilder<SourseResponse?>(
    //   future: _sourcesFuture,
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return Center(
    //         child: CircularProgressIndicator(),
    //       );
    //     } else if (snapshot.hasError) {
    //       WidgetsBinding.instance.addPostFrameCallback((_) {
          
    //          QuickAlert.show(
    //           context: context,
    //            type: QuickAlertType.error,
    //            title: context.tr('error'),
    //            text: context.tr('something_went_wrong'),
    //            confirmBtnText: context.tr('okay'),
    //            confirmBtnColor: AppColors.blackColor,
    //            onConfirmBtnTap: () {
    //            _sourcesFuture = ApiManager.getSources(widget.category.id);
    //              Navigator.pop(context);
    //              setState(() {
                   
    //              });
    //            },
    //            );

    //       },);
    //       return Container(
    //         color: Theme.of(context).primaryColor,
    //       );
    //     } else if (snapshot.data?.status != 'ok') {
    //       WidgetsBinding.instance.addPostFrameCallback((_) {
          
    //          QuickAlert.show(
    //           context: context,
    //            type: QuickAlertType.error,
    //            title: context.tr('error'),
    //            text: context.tr('something_went_wrong'),
    //            confirmBtnColor: AppColors.blackColor,
    //            onConfirmBtnTap: () {
    //            _sourcesFuture = ApiManager.getSources(widget.category.id);
    //              Navigator.pop(context);
    //              setState(() {
                   
    //              });
    //            },
    //            );

    //       },);
    //       }
    //     var sourcesList = snapshot.data?.sourcesList ?? [];
    //     return SourceTabWidget(sourcesList:sourcesList,category: widget.category,newsList: [],);
    //   },
    // );
  }
}
