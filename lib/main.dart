import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/provider/app_language_provider.dart';
import 'package:news/provider/app_theme_provider.dart';
import 'package:news/ui/home/home_screen.dart';
import 'package:news/utils/app_routes.dart';
import 'package:news/utils/app_theme.dart';
import 'package:news/utils/my_bloc_observer.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Future.delayed(Duration(milliseconds: 1500));
  final appLanguageProvider = AppLanguageProvider();
  await appLanguageProvider.loadLocale();
  final appThemeProvider = AppThemeProvider();
  await appThemeProvider.loadTheme();
   Bloc.observer = MyBlocObserver();
  runApp(
    
    EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: Locale('en'),
      
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: appLanguageProvider),
          ChangeNotifierProvider.value(value: appThemeProvider),
        ],
        child: MyApp())
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
        AppRoute.homeRouteName : (context) => HomeScreen(),
      },
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: appThemeProvider.appTheme,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: Locale(languageProvider.appLanguage),
    );
  }
} 