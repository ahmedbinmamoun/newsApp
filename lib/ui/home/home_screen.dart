import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news/ui/category_details/category_details.dart';
import 'package:news/ui/home/drwer/app_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text(context.tr('home'),style: Theme.of(context).textTheme.labelLarge,),
      ),

      body: Padding(
        padding:  EdgeInsets.only(top: height * 0.03),
        child: CategoryDetails(),
      ),
      
    );
  }
}
