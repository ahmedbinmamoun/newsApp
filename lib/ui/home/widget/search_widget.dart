import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news/api/api_manager.dart';
import 'package:news/model/NewsResponse.dart';
import 'package:news/ui/home/widget/custom_text_form_feild.dart';
import 'package:news/utils/app_assests.dart';

class SearchWidget extends StatefulWidget {
  final Function(List<News>) onResultChange;
  final VoidCallback onCancel;
   SearchWidget({super.key, required this.onResultChange, required this.onCancel});

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  bool isSearching = false;
  TextEditingController searchController = TextEditingController();
  List<News> searchResults = [];
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return SizedBox(
            height: height * 0.075,
            child: CustomTextFormFeild(
              
                onChange: (searchText) async {
                if (searchText.isEmpty) {
                  setState(() {
                    widget.onResultChange([]);
                  });
                  return;
                }

                var results = await ApiManager.searchNews(searchText);
                setState(() {
                  widget.onResultChange(results?.articlesList ?? []);
                });
              },
                controller: searchController,
                colorBorderSide: Theme.of(context).indicatorColor,
                cursorColor: Theme.of(context).indicatorColor,
                hintText: context.tr('search'),
                hintStyle: Theme.of(context).textTheme.headlineMedium,
                prefixIcon: Image.asset(AppAssests.searchIcon, color: Theme.of(context).indicatorColor,),
                suffixIcon: InkWell(
                  onTap: (){
                    isSearching = false;
                    searchController.clear();
                    widget.onCancel();
                    setState(() {
                      
                    });
                  },
                  child: Image.asset(AppAssests.crossIcon, color: Theme.of(context).indicatorColor,)),
                
              ),
          );
  }
}