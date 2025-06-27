// ignore_for_file: empty_catches

import 'dart:convert';

import '../Constants/api_constants.dart';
import '../Models/User/BookMark.dart';
import '../api/user_service.dart';

class UserController {
  static Future<bool> deleteBookmark(String uuid) async {
    try {
      var response = await UserServiceApi.instance
          .delete(url: "${ApiConstants.deleteBookmark}/$uuid");

      if (response!.statusCode == 200 || response.statusCode == 201) {
        return true;
      }
    } catch (e) {}

    return false;
  }

  //TODO Add this to POP
  static Future<List<BookMark>?> getBookmarkedPopList() async {
    try {
      var response = await UserServiceApi.instance
          .get(url: ApiConstants.getBookmarks, passToken: false);

      if (response!.statusCode == 200 || response.statusCode == 201) {
        var bookMarksJson = jsonDecode(response.body) as List;
        return bookMarksJson.map((item) => BookMark.fromJson(item)).toList();
      }
    } catch (e) {}

    return null;
  }

  static Future<List<BookMark>?> getAllBookMarks() async {
    try {
      var response = await UserServiceApi.instance.get(
        url: ApiConstants.getAllBookmarks,
        passToken: false,
      );

      if (response!.statusCode == 200 || response.statusCode == 201) {
        var bookMarksJson = jsonDecode(response.body) as List;
        return bookMarksJson.map((item) => BookMark.fromJson(item)).toList();
      }
    } catch (e) {}

    return null;
  }

  static Future<List<BookMark>?> getBookMarksByType(String type) async {
    try {
      var response =
          await UserServiceApi.instance.get(url: ApiConstants.getBookmarkType);

      if (response!.statusCode == 200 || response.statusCode == 201) {
        var bookMarksJson = jsonDecode(response.body) as List;
        return bookMarksJson.map((item) => BookMark.fromJson(item)).toList();
      }
    } catch (e) {}

    return null;
  }

  static Future<BookMark?> saveToBookMark(BookMark bookMark) async {
    try {
      var response = await UserServiceApi.instance.post(
        bookMark.toJson(),
        url: ApiConstants.saveBookmark,
      );

      if (response!.statusCode == 200 || response.statusCode == 201) {
        return BookMark.fromJson(jsonDecode(response.body));
      }
    } catch (e) {}

    return null;
  }
}
