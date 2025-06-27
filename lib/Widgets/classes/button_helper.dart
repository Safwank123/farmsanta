
import 'package:farmsanta_new/Widgets/classes/style_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../themeFiles/app_colors.dart';
import '../Widgets/custom_text.dart';

class ButtonHelper{
  static Widget buttonWithText(String text, Color textColor, Color buttonColor){
    return SizedBox(
      child: CustomText(textKey: text, color: textColor,).centered(),
      width: width*0.5 ,
      height: 50,
    ).color(buttonColor);
  }
}