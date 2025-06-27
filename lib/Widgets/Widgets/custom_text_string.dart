// ignore_for_file: must_be_immutable, depend_on_referenced_packages
import 'package:farmsanta_new/Pages/SupportPlace/Market/market.dart' as AppThemeColors;
import 'package:farmsanta_new/themeFiles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CustomTextString extends StatelessWidget {
  String text;
  bool bold;
  Color? color =  AppThemeColors.getColor(AppThemeColorsEnum.invert);
  TextAlign textAlign;
  double size;
  bool capatilize;
  bool showLine;
  bool underLine;
  TextStyle? style;
  CustomTextString({
    Key? key,
    required this.text,
    this.bold = false,
    this.capatilize = false,
    this.size = 14,
    this.color,
    this.textAlign = TextAlign.left,
    this.showLine = false,
    this.underLine = false,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle? style2 = TextStyle(
      decoration: showLine
          ? TextDecoration.lineThrough
          : underLine
              ? TextDecoration.underline
              : TextDecoration.none,
      fontWeight: bold ? FontWeight.bold : FontWeight.normal,
      fontSize: size,
    );

    if (style != null) {
      style2 = style;
    }
    return capatilize
        ? text.text.textStyle(style2).color(color).align(textAlign).capitalize.make()
        : text.text.textStyle(style2).color(color).align(textAlign).make();
  }
}
