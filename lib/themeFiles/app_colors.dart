
import 'package:farmsanta_new/main.dart';
import 'package:flutter/material.dart';

abstract class AppColors {
  static Color primary = const Color(0xff005F1B);
  static Color skyblue = const Color.fromARGB(255, 83, 163, 255);
  static Color enabledBlue = const Color(0xFF1F86EF);
  static Color blueLight = const Color.fromRGBO(230, 243, 255, 1);
  static Color disabledBlue = const Color.fromARGB(75, 85, 104, 213);
  static Color lightpink = const Color(0xfff9e3dd);
  static Color rentalPrimary = const Color(0xffeb642d);
  static Color soilTestPrimary = const Color(0xff4c281c);
  static Color LightsoilTestPrimary = const Color(0xff72544a);
  static Color white = Colors.white;
  static Color red = Colors.red;
  static Color yellow = Colors.yellow;
  static Color transperant = Colors.transparent;
  static Color black = Colors.black;
  static Color gray = const Color(0xffC4C4C4);
  static Color grayLight = const Color(0xfff3f3f3);

  static Color orange = const Color(0xFFF9761C);
  static Color orangeLight = const Color.fromRGBO(255, 142, 36, 1);

  static Color pinkLight = const Color.fromRGBO(255, 224, 224, 1);
  static Color purple = const Color.fromRGBO(151, 71, 255, 1);

  static Color secondary =
      AppThemeColors.getSingleColor(AppThemeColorsEnum.secondaryColor);
  static Color invert = AppThemeColors.getColor(AppThemeColorsEnum.invert);
  static Color background =
      AppThemeColors.getColor(AppThemeColorsEnum.background);
  static Color textFieldBackground =
      AppThemeColors.getColor(AppThemeColorsEnum.textFieldBackground);
  static Color textFieldLintBackground =
      AppThemeColors.getColor(AppThemeColorsEnum.textFieldLintBackground);
  static Color subHeading =
      AppThemeColors.getColor(AppThemeColorsEnum.subHeading);

  static Color greenDisable =
      AppThemeColors.getColor(AppThemeColorsEnum.greenDisabled);
  static Color greenLight = const Color(0xFF649F08);
  static Color primaryLight = const Color(0xffb1ceb3);
  static Color blueDark = const Color.fromRGBO(34, 136, 241, 1);
}

class AppThemeColors {
  static List<Color> lightColors = const [
    Color(0xff005F1B), //primary color
    Color(0xffF8F8F8), //background
    Color(0xffF5F5F5), //textFieldBackground
    Color(0xffE5EFE7), //textFieldLintBackground
    Color(0xFF858B86), //textColorTextField
    Color(0xFF646979), //subHeading
    Color(0xFFD7D7D7), //secondaryColor
    Color(0xFF1C2227), //invert
    Color(0xff89CA12), //lightGreen
    Color.fromRGBO(229, 231, 235, 1), //gray200
    Colors.white,
    Color(0xFFF9761C), //orange
    Color(0xFFFFA101), //yellow
    Color(0xFFF0FFE8), //location background
    Color(0xFF7FAE8B), //greenDisabled

    Color(0xFFDBF3E1), //greenLight

    Color(0xFFFFC792), //orangeDisabled
    Color(0XFF5F5F5F), //titleColor
    Color(0xffD8D8D8), //borderColor
    Color(0xffA7A7A7), //bodyTextColor
    Color(0xff9C9C9C), //shadowColor
    Color.fromARGB(255, 255, 0, 0),
  ];
  static List<Color> darkColors = const [
    Color(0xff005F1B), //primary color
    Color(0xffF8F8F8), //background
    Color(0xffF5F5F5), //textFieldBackground
    Color(0xFFE5EFE7), //textFieldLintBackground
    Color(0xFF858B86), //textColorTextField
    Color(0xFF646979), //subHeadin
    Color(0xFF23272E), //secondaryColor
    Color(0xFFffffff), //invert
    Color(0xff89CA12), //lightGreen
    Color.fromRGBO(229, 231, 235, 1), //gray200
    Colors.white,
    Color(0xFFF9761C), //orange
    Color(0xFFFFA101), //yellow
    Color(0xFFF0FFE8), //location background

    Color(0xFF7FAE8B), //greenDisabled
    Color(0xFFDBF3E1), //greenLight

    Color(0xFFFFC792), //orangeDisabled
    Color(0XFF5F5F5F), //titleColor
    Color(0xffD8D8D8), //borderColor
    Color(0xffA7A7A7), //bodyTextColor
    Color(0xff9C9C9C), //shadowColor
    Color.fromARGB(255, 0, 255, 106),
  ];

  //function to get any color with light dark theme
  static Color getColor(AppThemeColorsEnum color) {
    return (Theme.of(navigatorKey.currentContext!).brightness) ==
            Brightness.light
        ? lightColors[color.index]
        : darkColors[color.index];
  }

  //function to get single color
  static Color getSingleColor(AppThemeColorsEnum color, {bool isDark = false}) {
    return isDark ? darkColors[color.index] : lightColors[color.index];
  }
}

enum AppThemeColorsEnum {
  primary,
  background,
  textFieldBackground,
  textFieldLintBackground,
  textColorTextField,
  subHeading,
  secondaryColor,
  invert,
  lightGreen,
  gray200,
  white,
  orange,
  yellow,
  locationBackground,
  greenDisabled,
  greenLight,
  orangeDisbled,
  titleColor,
  borderColor,
  bodyTextColor,
  shadowColor,
  example
}
