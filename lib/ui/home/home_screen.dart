import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news/provider/app_language_provider.dart';
import 'package:news/utils/app_colors.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var app_language_provider = Provider.of<AppLanguageProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        title: Text(context.tr('home')),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            app_language_provider.changeLanguage('ar',context);
            setState(() {
              
            });
          } ,
           child: Text(context.tr('english'))),
      ),
    );
  }
}