import 'package:flutter/material.dart';
import 'package:news/api/api_manager.dart';
import 'package:news/model/SourseResponse.dart';
import 'package:news/ui/category_details/source/source_tab_widget.dart';
import 'package:news/utils/app_colors.dart';

class CategoryDetails extends StatefulWidget {
  const CategoryDetails({super.key});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();

  
}

class _CategoryDetailsState extends State<CategoryDetails> {
  late Future<SourseResponse?> _sourcesFuture;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _sourcesFuture = ApiManager.getSources();
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourseResponse?>(
      future: _sourcesFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(color: AppColors.greyColor),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Column(
              children: [
                Text(
                  'something went wrong..',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                ElevatedButton(
                  onPressed: () {
                    _sourcesFuture = ApiManager.getSources();
                    setState(() {
                      
                    });
                  },
                  child: Text(
                    'Try Again',
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: Theme.of(context).primaryColor
                    ),
                  ),
                ),
              ],
            ),
          );
        } else if (snapshot.data?.status != 'ok') {
          return Center(
            child: Column(
              children: [
                Text(
                  snapshot.data!.message!,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                ElevatedButton(
                  onPressed: () {
                    _sourcesFuture = ApiManager.getSources();
                    setState(() {
                      
                    });
                  },
                  child: Text(
                    'Try Again',
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: Theme.of(context).primaryColor
                    ),
                  ),
                ),
              ],
            ),
          );
        }
        var sourcesList = snapshot.data?.sourcesList ?? [];
        return SourceTabWidget(sourcesList:sourcesList,);
      },
    );
  }
}
