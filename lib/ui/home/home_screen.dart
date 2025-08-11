import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news/model/category.dart';
import 'package:news/ui/category_details/category_details.dart';
import 'package:news/ui/home/category_fragment/category_fragment.dart';
import 'package:news/ui/home/drwer/app_drawer.dart';

class HomeScreen extends StatefulWidget {
   HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: AppDrawer(onGotoHomeClick: onGotoHomeClick),
      appBar: AppBar(
        title: Text(
          selectedCategory == null ?
          context.tr('home'):
          context.tr(selectedCategory!.id)
          ,style: Theme.of(context).textTheme.labelLarge,),
      ),

      body: Padding(
        padding:  EdgeInsets.only(top: height * 0.01),
        child:selectedCategory == null ?
         CategoryFragment(onCategoryItemClick: onCategoryItemClick,):
         CategoryDetails(category: selectedCategory!,),
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
