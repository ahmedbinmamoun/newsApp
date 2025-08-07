import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news/ui/home/home_screen.dart';
import 'package:news/utils/app_routes.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Future.delayed(Duration(milliseconds: 1500));
  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: Locale('en'),
      child: MyApp()
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      initialRoute: AppRoute.homeRouteName,
      routes: {
        AppRoute.homeRouteName : (context) => HomeScreen(),
      },
      themeMode: ThemeMode.dark,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
  }
} 