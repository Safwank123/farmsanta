// ignore_for_file: empty_catches, depend_on_referenced_packages

import 'dart:convert';
import 'dart:io';


import 'package:farmsanta_new/Pages/SupportPlace/Market/market.dart' as AppThemeColors;
import 'package:farmsanta_new/themeFiles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:velocity_x/velocity_x.dart';

import '../Constants/api_constants.dart';
import '../main.dart';

bool isEmailValid(String text) {
  String validString =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp red = RegExp(validString);

  return red.hasMatch(text);
}

double getWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

List<TextEditingController> getTextController(int count) {
  return List.generate(count, (index) => TextEditingController());
}

void showToast(String message) {
  Fluttertoast.showToast(msg: message);
}

void navigateToPageReplaceMent(var newPage, {BuildContext? context}) {
  try {
    Navigator.pushAndRemoveUntil(
        context ?? navigatorKey.currentContext!,
        MaterialPageRoute(
          builder: (context) => newPage,
        ),
        (route) => false);
  } catch (e) {
    navigateToPageWithoutReplaceMent(newPage);
  }
}

void navigateToPageReplaceMentNamed(String newPage) {
  try {
    Navigator.pushNamedAndRemoveUntil(
        navigatorKey.currentContext!, newPage, (route) => false);
  } catch (e) {
    navigateToPageWithoutReplaceMentNamed(newPage);
  }
}

void navigateToPageWithoutReplaceMent(var newPage) {
  Navigator.push(
      navigatorKey.currentContext!,
      MaterialPageRoute(
        builder: (context) => newPage,
      ));
}

Future<dynamic> navigateToPageWithoutReplaceMentNamed(
  String routeName, {
  Object? arguments,  // Add this named parameter
}) {
  return Navigator.pushNamed(
    navigatorKey.currentContext!,
    routeName,
    arguments: arguments,  // Pass the arguments
  );
}

void directToScreenAccordingToNotification(String title) {
  //
  //TODO
  var page = "";
  try {
    navigatorKey.currentState!.pushNamed(page);
  } catch (e) {}
}

String parseString(String name, int count) {
  return name.length > count ? "${name.substring(0, count - 1)} ..." : name;
}

bool checkDate(DateTime d1, DateTime d2) {
  return d1.day == d2.day && d1.month == d2.month && d1.year == d2.year;
}

bool checkDateIsAfter(DateTime d2) {
  DateTime d1 = DateTime.now();

  return d1.isAfter(d2);
}

BorderRadius getBorderRadiusAll(double radius) {
  return BorderRadius.circular(radius);
}

BorderRadius getBorderRadiusTop(double radius) {
  return BorderRadius.only(
      topLeft: Radius.circular(radius), topRight: Radius.circular(radius));
}

ShapeBorder cardShapeBorder(double radius) {
  return RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(radius)));
}

ShapeBorder cardShapeBorderTop(double radius) {
  return RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(radius), topRight: Radius.circular(radius)));
}

BoxDecoration getBoxDecorationTop(double radius, Color color) {
  return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(radius), topRight: Radius.circular(radius)));
}

BoxDecoration getBoxDecorationBottom(double radius, Color color) {
  return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(radius),
          bottomRight: Radius.circular(radius)));
}

BoxDecoration getBoxDecorationAll(double radius, Color color) {
  return BoxDecoration(
      color: color, borderRadius: BorderRadius.all(Radius.circular(radius)));
}

BoxDecoration getBoxDecorationAllBorder(
  double radius,
  Color color,
  Color border,
) {
  return BoxDecoration(
    color: color,
    borderRadius: BorderRadius.all(Radius.circular(radius)),
    border: Border.all(
      color: border, // Set the border color to green
      width: 1.0, // Set the border width (optional)
    ),
  );
}

BoxShadow getBoxShadow() {
  return BoxShadow(
      color: AppThemeColors.getColor(AppThemeColorsEnum.shadowColor)
          .withOpacity(0.25),
      blurRadius: 4,
      offset: const Offset(0, 4));
}

String parseDoubleString(double value) {
  return value.toDoubleStringAsPrecised(length: 2);
}

String getPriceParsed(double price) {
  return price.toString();
}

Future<String?> getOwnToken() async {
  // return await FirebaseMessaging.instance.getToken();
  return "";
}

//function to update or create notification push token
Future<void> updateTokenNotification() async {
  // TODO
  // String? token = await getOwnToken();
  // bool resp = await AuthController.instance.updateField({"id": SharedHelper.id, "token": token!});
  // if (resp) {
  //   UserModel model = SharedHelper.userModel!;
  //   model.token = token;
  //   SharedHelper.userModel = model;
  //   await SharedPrefData.setModelDetails(model.toMap(), SharedPrefKeys.userDetailKey);
  // }
}

String getImagePath(String image) {
  return ApiConstants.s3ImageBaseUrl + image;
}

String getFormatedDateTime1(DateTime date) {
  return DateFormat('dd MMM, yyyy').format(date);
}
