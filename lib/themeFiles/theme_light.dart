import 'package:flutter/material.dart';

import '../Constants/colors.dart';
import 'app_colors.dart';

ThemeData lightTheme() {
  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: primaryColor,
    primaryColorLight: lintLightColor,
    colorScheme: ColorScheme.fromSeed(
        seedColor: primaryColor, background: lintLightColor),
    scaffoldBackgroundColor: backgroundLightColor,
    fontFamily: 'Roboto',
    chipTheme: ChipThemeData(
        backgroundColor: whiteColor,
        selectedColor: primaryColor,
        disabledColor: whiteColor,
        side: BorderSide(color: primaryColor),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        showCheckmark: false),

    //Heading Text
    primaryTextTheme: const TextTheme(
      headlineLarge: TextStyle(
        letterSpacing: 0,
        fontWeight: FontWeight.w600,
        color: primaryColor,
      ),
      headlineMedium: TextStyle(
        letterSpacing: 0,
        fontWeight: FontWeight.w600,
        color: primaryColor,
      ),
      headlineSmall: TextStyle(
        letterSpacing: 0,
        fontWeight: FontWeight.w600,
        color: primaryColor,
      ),
      titleLarge: TextStyle(
        letterSpacing: 0,
        fontWeight: FontWeight.w600,
        color: primaryColor,
      ),
      titleMedium: TextStyle(
        letterSpacing: 0,
        fontWeight: FontWeight.w600,
        color: primaryColor,
      ),
      titleSmall: TextStyle(
        letterSpacing: 0,
        fontWeight: FontWeight.w600,
        color: primaryColor,
      ),
      bodyLarge: TextStyle(
        letterSpacing: 0,
        fontWeight: FontWeight.w400,
        color: primaryColor,
      ),
      bodyMedium: TextStyle(
        letterSpacing: 0,
        fontWeight: FontWeight.w400,
        color: primaryColor,
      ),
      bodySmall: TextStyle(
        letterSpacing: 0,
        fontWeight: FontWeight.w400,
        color: primaryColor,
      ),

      //Button Text
      labelLarge: TextStyle(
        letterSpacing: 0,
        fontWeight: FontWeight.w400,
      ),
      labelMedium: TextStyle(
        letterSpacing: 0,
        fontWeight: FontWeight.w400,
      ),
      labelSmall: TextStyle(
        letterSpacing: 0,
        fontWeight: FontWeight.w400,
      ),
    ),

    textTheme: const TextTheme(
      headlineLarge: TextStyle(
          fontSize: 36, fontWeight: FontWeight.w700, color: primaryColor),
      headlineMedium: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w700,
        letterSpacing: 0,
      ),
      headlineSmall: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w800,
        letterSpacing: 0,
      ),
      titleLarge: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        letterSpacing: 0,
      ),
      titleMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        letterSpacing: 0,
      ),
      titleSmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        letterSpacing: 0,
      ),
      bodyLarge: TextStyle(
        fontSize: 17,
        letterSpacing: 0,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        letterSpacing: 0,
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        letterSpacing: 0,
      ),
    ),

    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
            foregroundColor: WidgetStateProperty.all(primaryColor))),
    appBarTheme: const AppBarTheme(
        color: primaryColor,
        //titleTextStyle: Theme.of(context).textTheme.bodyLarge,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.white)),
    inputDecorationTheme: InputDecorationTheme(
      //contentPadding: const EdgeInsets.only(bottom: 3),
      labelStyle: const TextStyle(
        //height: 0.6,
        letterSpacing: 0,
        fontWeight: FontWeight.w400,
        color: primaryColor,
      ),
      hintStyle: TextStyle(
          fontSize: 14,
          color: AppThemeColors.getSingleColor(
              AppThemeColorsEnum.textColorTextField),
          fontWeight: FontWeight.w400),
      fillColor: AppThemeColors.getSingleColor(
          AppThemeColorsEnum.textFieldLintBackground),
      isDense: true,
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          color: primaryColor,
          width: 1,
        ),
      ),
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          color: primaryColor,
          width: 1,
        ),
      ),
    ),
    primaryIconTheme: const IconThemeData(
      color: primaryColor,
    ),
    iconTheme: const IconThemeData(
      color: primaryColor,
    ),
    dividerColor: dividerColor,
    drawerTheme: const DrawerThemeData(backgroundColor: backgroundLightColor),
    buttonTheme: ButtonThemeData(
      buttonColor: primaryColor,
      textTheme: ButtonTextTheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      focusColor: Colors.white,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
      shadowColor: primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      backgroundColor: primaryColor,
      textStyle: const TextStyle(color: backgroundLightColor),
    )),
    floatingActionButtonTheme:
        const FloatingActionButtonThemeData(backgroundColor: primaryColor),

    navigationBarTheme: NavigationBarThemeData(backgroundColor: whiteColor),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: backgroundLightColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
    ),
    cardColor: cardBackgroundColor,
    snackBarTheme: const SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: backgroundLightColor,
        actionTextColor: primaryColor),
    tabBarTheme: TabBarThemeData(
        labelColor: AppColors.primary, unselectedLabelColor: AppColors.gray), dialogTheme: DialogThemeData(backgroundColor: backgroundLightColor),
  );
}
