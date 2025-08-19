import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news/model/NewsResponse.dart';
import 'package:news/model/category.dart';
import 'package:news/ui/category_details/sources_details.dart';
import 'package:news/ui/category_details/news/news_item.dart';
import 'package:news/ui/home/category_fragment/category_fragment.dart';
import 'package:news/ui/home/drwer/app_drawer.dart';
import 'package:news/ui/home/widget/search_widget.dart';
import 'package:news/utils/app_assests.dart';

class HomeScreen extends StatefulWidget {
   const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> {
  bool isSearching = false;
  TextEditingController searchController = TextEditingController();
  List<News> searchResults = [];
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      drawer: isSearching ? null : AppDrawer(onGotoHomeClick: onGotoHomeClick),
      appBar: AppBar(
        title: AnimatedSwitcher(
          duration: Duration(milliseconds: 600),
          transitionBuilder: (child, animation) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: Offset(1, 0),
                end: Offset.zero
              ).animate(animation),
              child: FadeTransition(opacity: animation, child: child,),
              );
          },
          child: isSearching ?
            SizedBox(
              height: kToolbarHeight * 0.9,
              child: SearchWidget(
                onResultChange: (result) {
                  searchResults = result;
                  setState(() {
                    
                  });
                },
                onCancel: (){
                  isSearching = false;
                  searchResults = [];
                  setState(() {
                    
                  });
                },
              ),
            )
           :
            Text(
            selectedCategory == null ?
            context.tr('home'):
            context.tr(selectedCategory!.id)
            ,style: Theme.of(context).textTheme.labelLarge,),
        )
          ,
          actions: [
             
            if(!isSearching)
            IconButton(
              onPressed: (){
                isSearching = true;
                setState(() {
                  
                });
              },
               icon: Image.asset(AppAssests.searchIcon,color: Theme.of(context).indicatorColor,))
          ],
      ),

      body: Padding(
  padding: EdgeInsets.only(top: height * 0.01),
  child: isSearching
      ? ListView.builder(
          itemCount: searchResults.length,
          itemBuilder: (context, index) {
            var news = searchResults[index];
            return NewsItem(
              news:news );
          },
        )
      : selectedCategory == null
          ? CategoryFragment(onCategoryItemClick: onCategoryItemClick)
          : SourceDetails(category: selectedCategory!),
),
      
    );
  }
  Category? selectedCategory;
  void onCategoryItemClick(Category newSelectedCategory){
    selectedCategory = newSelectedCategory;
    setState(() {
      
    });
  }
  void onGotoHomeClick(){
    selectedCategory = null;
        setState(() {
          
        });
  }
}
