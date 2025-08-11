import 'package:flutter/material.dart';
import 'package:news/utils/app_colors.dart';
import 'package:news/utils/app_styles.dart';


  typedef OnValidator = String? Function(String?)?;
class CustomTextFormFeild extends StatelessWidget {
  Color colorBorderSide;
  Color? cursorColor;
  String? hintText;
  TextStyle? hintStyle;
  Widget? prefixIcon;
  Widget? suffixIcon;
  TextEditingController controller;
  TextInputType keyboardType;
  OnValidator? validator;
  TextStyle? textStyle;
  Function(String)? onChange;
   CustomTextFormFeild({
    super.key,
    
    this.colorBorderSide = AppColors.greyColor,
    this.cursorColor,
    this.hintText,
    this.hintStyle,
    this.prefixIcon,
    this.suffixIcon,
    required this.controller,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.textStyle,
    this.onChange
   });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: textStyle ?? Theme.of(context).textTheme.headlineMedium,
      decoration: InputDecoration(
        enabledBorder: builtDecorationBorder(colorBorderSide: colorBorderSide),
        focusedBorder: builtDecorationBorder(colorBorderSide: colorBorderSide),
        hintText: hintText,
        hintStyle: hintStyle ?? Theme.of(context).textTheme.headlineMedium,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        
        
      ),
      cursorColor: cursorColor,
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      onChanged: onChange,
      
      
      
    );
  }
  OutlineInputBorder builtDecorationBorder({required Color colorBorderSide}){
    return OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: colorBorderSide,
            width: 1,
          ),
        );
  }
}