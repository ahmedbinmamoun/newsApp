import 'package:flutter/material.dart';

class LanguageMenu extends StatelessWidget {
  final bool isEnglish;
  final Function(bool) onLanguageChanged;

  const LanguageMenu({
    required this.isEnglish,
    required this.onLanguageChanged,
  });

  @override
  double get height => 80;

  @override
  Widget build(BuildContext context) {
    return PopupMenuItem(
      value: 'language',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Language'),
          SizedBox(height: 8),
          Row(
            children: [
              Radio<bool>(
                value: true,
                groupValue: isEnglish,
                onChanged: (bool? value) {
                  if (value != null) onLanguageChanged(value);
                },
              ),
              Text('English'),
              SizedBox(width: 16),
              Radio<bool>(
                value: false,
                groupValue: isEnglish,
                onChanged: (bool? value) {
                  if (value != null) onLanguageChanged(value);
                },
              ),
              Text('العربية'),
            ],
          ),
        ],
      ),
    );
  }
}