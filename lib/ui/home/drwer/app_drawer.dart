import 'package:flutter/material.dart';
import 'package:news/provider/app_language_provider.dart';
import 'package:news/provider/app_theme_provider.dart';
import 'package:news/utils/app_assests.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';

class AppDrawer extends StatelessWidget {
  VoidCallback onGotoHomeClick;
   AppDrawer({super.key, required this.onGotoHomeClick});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<AppThemeProvider>(context);
    final languageProvider = Provider.of<AppLanguageProvider>(context);
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Drawer(
      child: Container(
        color: Theme.of(context).primaryColor,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration:  BoxDecoration(color: Theme.of(context).indicatorColor),
              child: Center(
                child: Text('News App',
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      color: Theme.of(context).primaryColor
                    )),
              ),
            ),
            ListTile(
              leading:  Image.asset(AppAssests.homeIcon,color: Theme.of(context).indicatorColor),
              title: Text(context.tr('go_to_home'), style: Theme.of(context).textTheme.titleLarge),
              onTap: () {
                onGotoHomeClick();
                Navigator.pop(context);
              },
            ),
            const Divider(),
            ListTile(
              title: Row(
                children: [
                  Image.asset(AppAssests.themeIcon,color: Theme.of(context).indicatorColor),
                  SizedBox(width: width * 0.02,),
                  Text(context.tr('theme'),style: Theme.of(context).textTheme.titleLarge,),
                ],
              ),
              subtitle: Container(
                margin: EdgeInsets.only(top: height * 0.01),
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.02
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: Theme.of(context).indicatorColor,
                    width: 1
                  )
                ),
                child: DropdownButton<String>(
                  value: themeProvider.isDarkMode() ? context.tr('dark') : context.tr('light'),
                  style: Theme.of(context).textTheme.labelMedium,
                  isExpanded: true,
                  dropdownColor: Theme.of(context).primaryColor,
                  underline: SizedBox(),
                  items: [
                    context.tr('dark'),
                   context.tr('light')]
                      .map((e) => DropdownMenuItem(
                            value: e,
                            child: Text(e.tr()),
                          ))
                      .toList(),
                  onChanged: (value) {
                    themeProvider.toggleTheme(value == context.tr('dark'));
                  },
                ),
              ),
            ),
            const Divider(),
            ListTile(
              title: Row(
                children: [
                  Image.asset(AppAssests.languageIcon,color: Theme.of(context).indicatorColor,),
                  SizedBox(width: width * 0.02,),
                  Text(context.tr('language'),style: Theme.of(context).textTheme.titleLarge,),
                ],
              ),
              subtitle: Container(
                margin: EdgeInsets.only(top: height * 0.01),
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.02
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: Theme.of(context).indicatorColor,
                    width: 1
                  )
                ),
                child: DropdownButton<String>(

                  value: languageProvider.locale.languageCode == 'en'
                      ? context.tr('english')
                      : context.tr('arabic'),
                      style: Theme.of(context).textTheme.labelMedium,
                      isExpanded: true,
                      dropdownColor: Theme.of(context).primaryColor,
                      underline: SizedBox(),
                      
                  items: [
                    context.tr('english'),
                    context.tr('arabic')]
                      .map((e) => DropdownMenuItem(
                            value: e,
                            child: Text(e),
                          ))
                      .toList(),
                  onChanged: (value) {
                    if (value == context.tr('english')) {
                      languageProvider.changeLanguage('en', context);
                    } else {
                      languageProvider.changeLanguage('ar', context);
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}