import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news/ui/category_details/category_details.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title: Text(
          context.tr('home'),
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: CategoryDetails(),
    );
  }
}
