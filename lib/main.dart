import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:news/di/di_injectable.dart';
import 'package:news/model/news_response.dart';
import 'package:news/model/source_response.dart';
import 'package:news/provider/app_language_provider.dart';
import 'package:news/provider/app_theme_provider.dart';
import 'package:news/ui/home/home_screen.dart';
import 'package:news/utils/app_routes.dart';
import 'package:news/utils/app_theme.dart';
import 'package:news/utils/my_bloc_observer.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Future.delayed(const Duration(milliseconds: 100));
  final appLanguageProvider = AppLanguageProvider();
  await appLanguageProvider.loadLocale();
  final appThemeProvider = AppThemeProvider();
  await appThemeProvider.loadTheme();
   Bloc.observer = MyBlocObserver();
   final Directory appDocumentsDir = await getApplicationDocumentsDirectory();
   Hive.init(appDocumentsDir.path);
   Hive.registerAdapter(SourceAdapter());
   Hive.registerAdapter(SourceResponseAdapter());
   Hive.registerAdapter(NewsAdapter());
   Hive.registerAdapter(NewsResponseAdapter());
    configureDependencies();  
  runApp(
    
    EasyLocalization(
      supportedLocales: const [ Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: appLanguageProvider),
          ChangeNotifierProvider.value(value: appThemeProvider),
        ],
        child: const MyApp())
    ),
    
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
   var languageProvider = Provider.of<AppLanguageProvider>(context);
   var appThemeProvider = Provider.of<AppThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      initialRoute: AppRoute.homeRouteName,
      routes: {
        AppRoute.homeRouteName : (context) => const HomeScreen(),
      },
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: appThemeProvider.appTheme,
      themeAnimationCurve: Curves.fastOutSlowIn,
      themeAnimationDuration: const Duration(milliseconds: 100),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: Locale(languageProvider.appLanguage),
    );
  }
} 