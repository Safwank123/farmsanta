//dark_theme.dart
// ignore_for_file: constant_identifier_names


import 'package:flutter/material.dart';

// Primary Text Theme
const Color APP_DARK_PRIMARY_COLOR = Color(0xFF005F1B);
const Color APP_DARK_LIGHT_PRIMARY_COLOR = Color(0xFFDFFFEB);

// Text Theme
const Color APP_TEXT_COLOR = Color(0xFFD9D9D9);
const Color APP_LIGHT_TEXT_COLOR = Color(0xFF7C7C7C);

// Accent Text Theme
const Color APP_ACCENT_TEXT_COLOR = Color(0xFFD9D9D9);
const Color APP_LIGHT_ACCENT_TEXT_COLOR = Color(0xFFFFFFFF);

// Others
const Color APP_ERROR_COLOR = Color(0xFFB40000);
const Color APP_DIVIDER_COLOR = Color(0xFF141D2B);
const Color LABEL_COLOR = Color(0xFF5E5E5E);

// Theme Data
const Color APP_PRIMARY_LIGHT_COLOR = Color(0xFFD7E4F9);
const Color APP_ACCENT_COLOR = Color(0xFF051222);
const Color APP_BACKGROUND_COLOR = Color(0xFF1B1B1B);
const Color APP_SCAFFOLD_COLOR = Color(0xFF1B1B1B);

const Color APP_APPBAR_THEME_COLOR = Color(0xFF051222);
const Color APP_APPBAR_BACKGROUND_COLOR = Color(0xFF232D44);
const Color SNACKBAR_BACKGROUND_COLOR = Color(0xFFEDEDED);
const Color BOTTOM_SHEET_BACKGROUND_COLOR = Color(0xFF051222);
const Color APP_PRIMARY_ICON_THEME_COLOR = Color(0xFFFF6700);
const Color APP_ICON_THEME_COLOR = Color(0xFFFFFFFF);
const Color APP_ACCENT_ICON_THEME_COLOR = Color(0xFF666666);
const Color APP_INPUT_FILL_COLOR = Color(0xFF051222);
const Color BLACK_COLOR = Color(0xFF000000);
const Color APP_FOCUS_INPUT_BORDER_COLOR = Color(0xFFEAEBEC);
const Color APP_DIALOG_BACKGROUND_COLOR = Color(0xFF777777);
ThemeData darkTheme() {
  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: APP_DARK_PRIMARY_COLOR,
    primaryColorLight: APP_PRIMARY_LIGHT_COLOR,
    primaryColorDark: APP_DARK_LIGHT_PRIMARY_COLOR,
    scaffoldBackgroundColor: APP_SCAFFOLD_COLOR,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    fontFamily: 'Roboto',
    primaryTextTheme: const TextTheme(
      displayLarge: TextStyle(
        letterSpacing: 0,
        fontWeight: FontWeight.w600,
        color: APP_DARK_PRIMARY_COLOR,
      ),
      displayMedium: TextStyle(
        letterSpacing: 0,
        fontWeight: FontWeight.w600,
        color: APP_DARK_PRIMARY_COLOR,
      ),
      displaySmall: TextStyle(
        letterSpacing: 0,
        fontWeight: FontWeight.w600,
        color: APP_DARK_PRIMARY_COLOR,
      ),
      headlineMedium: TextStyle(
        letterSpacing: 0,
        fontWeight: FontWeight.w400,
        color: APP_DARK_PRIMARY_COLOR,
      ),
      headlineLarge: TextStyle(
        letterSpacing: 0,
        fontWeight: FontWeight.w600,
        color: APP_DARK_PRIMARY_COLOR,
      ),
      titleLarge: TextStyle(
        letterSpacing: 0,
        fontWeight: FontWeight.w600,
        color: APP_DARK_PRIMARY_COLOR,
      ),
      titleMedium: TextStyle(
        letterSpacing: 0,
        fontWeight: FontWeight.w600,
        color: APP_DARK_PRIMARY_COLOR,
      ),
      titleSmall: TextStyle(
        letterSpacing: 0,
        fontWeight: FontWeight.w600,
        color: APP_DARK_PRIMARY_COLOR,
      ),
      bodyMedium: TextStyle(
        letterSpacing: 0,
        fontWeight: FontWeight.w400,
        color: APP_DARK_PRIMARY_COLOR,
      ),
      bodyLarge: TextStyle(
        letterSpacing: 0,
        fontWeight: FontWeight.w400,
        color: APP_DARK_PRIMARY_COLOR,
      ),
      labelLarge: TextStyle(
        letterSpacing: 0,
        fontWeight: FontWeight.w600,
        color: APP_DARK_PRIMARY_COLOR,
      ),
      bodySmall: TextStyle(
        letterSpacing: 0,
        fontWeight: FontWeight.w400,
        color: APP_DARK_PRIMARY_COLOR,
      ),
      labelSmall: TextStyle(
        letterSpacing: 0,
        fontWeight: FontWeight.w400,
        color: APP_DARK_PRIMARY_COLOR,
      ),
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.w700,
          color: APP_DARK_PRIMARY_COLOR),
      displayMedium: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w700,
        letterSpacing: 0,
      ),
      displaySmall: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w800,
        letterSpacing: 0,
      ),
      titleMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        letterSpacing: 0,
      ),
      titleSmall: TextStyle(
        fontSize: 16,
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
      labelLarge: TextStyle(
        letterSpacing: 0,
      ),
      bodySmall: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w300,
        letterSpacing: 0,
      ),
      labelSmall: TextStyle(
        letterSpacing: 0,
      ),
    ),
    // accentTextTheme: TextTheme(
    //   headline6: TextStyle(
    //     letterSpacing: 0,
    //     fontWeight: FontWeight.w600,
    //     color: APP_ACCENT_TEXT_COLOR,
    //   ),
    //   headline5: TextStyle(
    //     letterSpacing: 0,
    //     fontWeight: FontWeight.w600,
    //     color: APP_ACCENT_TEXT_COLOR,
    //   ),
    //   headline4: TextStyle(
    //     letterSpacing: 0,
    //     fontWeight: FontWeight.w400,
    //     color: APP_ACCENT_TEXT_COLOR,
    //   ),
    //   headline3: TextStyle(
    //     letterSpacing: 0,
    //     fontWeight: FontWeight.w600,
    //     color: APP_ACCENT_TEXT_COLOR,
    //   ),
    //   headline2: TextStyle(
    //     letterSpacing: 0,
    //     fontWeight: FontWeight.w600,
    //     color: APP_ACCENT_TEXT_COLOR,
    //   ),
    //   headline1: TextStyle(
    //     letterSpacing: 0,
    //     fontWeight: FontWeight.w600,
    //     color: APP_ACCENT_TEXT_COLOR,
    //   ),
    //   subtitle1: TextStyle(
    //     letterSpacing: 0,
    //     fontWeight: FontWeight.w600,
    //     color: APP_LIGHT_ACCENT_TEXT_COLOR,
    //   ),
    //   subtitle2: TextStyle(
    //     letterSpacing: 0,
    //     fontWeight: FontWeight.w600,
    //     color: APP_LIGHT_ACCENT_TEXT_COLOR,
    //   ),
    //   bodyText2: TextStyle(
    //     letterSpacing: 0,
    //     fontWeight: FontWeight.w500,
    //     color: APP_ACCENT_TEXT_COLOR,
    //   ),
    //   bodyText1: TextStyle(
    //     letterSpacing: 0,
    //     fontWeight: FontWeight.w500,
    //     color: APP_ACCENT_TEXT_COLOR,
    //   ),
    //   button: TextStyle(
    //     letterSpacing: 0,
    //     fontWeight: FontWeight.w600,
    //     color: APP_LIGHT_ACCENT_TEXT_COLOR,
    //   ),
    //   caption: TextStyle(
    //     letterSpacing: 0,
    //     fontWeight: FontWeight.w400,
    //     color: APP_LIGHT_ACCENT_TEXT_COLOR,
    //   ),
    //   overline: TextStyle(
    //     letterSpacing: 0,
    //     fontWeight: FontWeight.w400,
    //     color: APP_LIGHT_ACCENT_TEXT_COLOR,
    //   ),
    // ),
    appBarTheme: const AppBarTheme(
      color: APP_APPBAR_BACKGROUND_COLOR,
      elevation: 0.0,
    ),
    navigationBarTheme: NavigationBarThemeData(
      indicatorColor: Colors.green[900],
    ),
    inputDecorationTheme: InputDecorationTheme(
      //contentPadding: const EdgeInsets.only(bottom: 3),
      labelStyle: TextStyle(
        //height: 0.6,
        letterSpacing: 0,
        fontWeight: FontWeight.w400,
        color: LABEL_COLOR,
      ),
      fillColor: APP_INPUT_FILL_COLOR,
      isDense: true,
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          color: APP_FOCUS_INPUT_BORDER_COLOR,
          width: 1,
        ),
      ),
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          color: APP_FOCUS_INPUT_BORDER_COLOR,
          width: 1,
        ),
      ),
    ),
    primaryIconTheme: const IconThemeData(
      color: APP_PRIMARY_ICON_THEME_COLOR,
    ),
    iconTheme: const IconThemeData(
      color: APP_ICON_THEME_COLOR,
    ),
    // accentIconTheme: const IconThemeData(
    //   color: APP_ACCENT_ICON_THEME_COLOR,
    // ),
    cardColor: APP_ERROR_COLOR,
    dividerColor: APP_DIVIDER_COLOR,
    drawerTheme: DrawerThemeData(backgroundColor: APP_BACKGROUND_COLOR),
    buttonTheme: ButtonThemeData(
      buttonColor: APP_DARK_PRIMARY_COLOR,
      shape: RoundedRectangleBorder(),
      focusColor: Colors.white,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            shadowColor: APP_DARK_PRIMARY_COLOR,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            backgroundColor: APP_DARK_PRIMARY_COLOR,
            textStyle: TextStyle(color: APP_LIGHT_ACCENT_TEXT_COLOR)
            // onPrimary: Colors.yellow,
            // primary: Colors.blue,
            )),
    floatingActionButtonTheme:
        FloatingActionButtonThemeData(backgroundColor: APP_DARK_PRIMARY_COLOR),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: BOTTOM_SHEET_BACKGROUND_COLOR,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25),
        ),
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: APP_ERROR_COLOR,
        backgroundColor: APP_APPBAR_THEME_COLOR),
    snackBarTheme: const SnackBarThemeData(
      backgroundColor: SNACKBAR_BACKGROUND_COLOR,
    ), checkboxTheme: CheckboxThemeData(
 fillColor: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
 if (states.contains(WidgetState.disabled)) { return null; }
 if (states.contains(WidgetState.selected)) { return APP_DARK_PRIMARY_COLOR; }
 return null;
 }),
 ), radioTheme: RadioThemeData(
 fillColor: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
 if (states.contains(WidgetState.disabled)) { return null; }
 if (states.contains(WidgetState.selected)) { return APP_DARK_PRIMARY_COLOR; }
 return null;
 }),
 ), switchTheme: SwitchThemeData(
 thumbColor: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
 if (states.contains(WidgetState.disabled)) { return null; }
 if (states.contains(WidgetState.selected)) { return APP_DARK_PRIMARY_COLOR; }
 return null;
 }),
 trackColor: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
 if (states.contains(WidgetState.disabled)) { return null; }
 if (states.contains(WidgetState.selected)) { return APP_DARK_PRIMARY_COLOR; }
 return null;
 }),
 ), colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.green)
        .copyWith(secondary: Colors.greenAccent, brightness: Brightness.dark).copyWith(surface: APP_BACKGROUND_COLOR), bottomAppBarTheme: BottomAppBarTheme(color: APP_ACCENT_COLOR), dialogTheme: DialogThemeData(backgroundColor: APP_DIALOG_BACKGROUND_COLOR),
    // accentColor: APP_ACCENT_COLOR,
  );
}
