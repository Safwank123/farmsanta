// ignore_for_file: must_be_immutable, depend_on_referenced_packages


import 'package:farmsanta_new/Pages/SupportPlace/Market/market.dart' as AppThemeColors;
import 'package:farmsanta_new/Services/shared_helper.dart';
import 'package:farmsanta_new/themeFiles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CustomText extends StatelessWidget {
  String textKey;
  bool bold;
  Color? color = AppThemeColors.getColor(AppThemeColorsEnum.invert);
  TextAlign textAlign;
  double size;
  bool capatilize;
  bool showLine;
  bool underLine;
  bool semiBold;
  TextStyle? style;
  TextOverflow overflow;
  int lines;

  CustomText({
    super.key,
    required this.textKey,
    this.bold = false,
    this.capatilize = false,
    this.size = 14,
    this.color,
    this.textAlign = TextAlign.left,
    this.showLine = false,
    this.underLine = false,
    this.semiBold = false,
    this.style,
    this.overflow = TextOverflow.visible,
    this.lines = 100,
  });

  @override
  Widget build(BuildContext context) {
    TextStyle? style2 = TextStyle(
      decoration: showLine
          ? TextDecoration.lineThrough
          : underLine
              ? TextDecoration.underline
              : TextDecoration.none,
      fontWeight: bold
          ? FontWeight.bold
          : semiBold
              ? FontWeight.w400
              : FontWeight.normal,
      fontSize: size,
    );

    if (style != null) {
      style2 = style;
    }

    var a1 = SharedHelper.getTranslatedText(textKey).text.textStyle(style2).color(color).align(textAlign);
    return capatilize
        ? SharedHelper.getTranslatedText(textKey)
            .text
            .textStyle(style2)
            .color(color)
            .align(textAlign)
            .capitalize
            .overflow(overflow)
            .maxLines(lines)
            .make()
        : SharedHelper.getTranslatedText(textKey).text.textStyle(style2).color(color).align(textAlign).overflow(overflow).maxLines(lines).make();
  }
}

enum TranslationStringNameEnum {
  hello,
  sellall,
  mostbuysection,
  getstarted,
  verify,
  findperfectsolutionandbestadviceforyourcropissuesweareheretohelpyouinfarming,
  letusknowyourlocationandlanguage,
  edit,
  profile,
  viewfarm,
  title,
  subtitle,
  myfarm,
  mycrops,
  coriander,
  name,
  firstName,
  MiddleName,
  LastName,
  email,
  mobilenumber,
  dateofbirth,
  education,
  gender,
  male,
  female,
  datasource,
  havesmartphone,
  location,
  address,
  country,
  state,
  district,
  subdistrict,
  village,
  pincode,
  addressname,
  countryname,
  statename,
  districtname,
  subdistrictname,
  villagename,
  pincodenumber,
  done,
  exploreamazingfeature,
  welcometoapp,
  loreum
}
