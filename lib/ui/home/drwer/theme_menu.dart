import 'package:flutter/material.dart';

class ThemeMenu extends StatelessWidget{
  final ThemeMode themeMode;
  final Function(ThemeMode) onThemeChanged;

  const ThemeMenu({super.key, 
    required this.themeMode,
    required this.onThemeChanged,
  });

  @override
  double get height => 80;

  @override
  Widget build(BuildContext context) {
    return PopupMenuItem(
      value: 'theme',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Theme'),
          SizedBox(height: 8),
          Row(
            children: [
              Radio<ThemeMode>(
                value: ThemeMode.light,
                groupValue: themeMode,
                onChanged: (ThemeMode? value) {
                  if (value != null) onThemeChanged(value);
                },
              ),
              Text('Light'),
              SizedBox(width: 16),
              Radio<ThemeMode>(
                value: ThemeMode.dark,
                groupValue: themeMode,
                onChanged: (ThemeMode? value) {
                  if (value != null) onThemeChanged(value);
                },
              ),
              Text('Dark'),
            ],
          ),
        ],
      ),
    );
  }
}