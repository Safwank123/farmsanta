// ignore_for_file: unnecessary_null_comparison

import 'dart:convert';

import 'package:intl/intl.dart';

import '../Constants/api_constants.dart';
import '../Models/message/comment.dart';
import '../Models/message/message.dart';
import '../api/message_service.dart';

class MessageController {
  static Future<bool> saveUserPost(Message message) async {
    String url = ApiConstants.messageServiceSave;

    try {
      var response = await MessageServiceApi.instance.post(
        message.toJson(),
        url: url,
      );

      if (response!.statusCode == 200 || response.statusCode == 201) {
        return true;
      }
    } catch (e) {}

    return false;
  }

  static Future<bool> saveUserComment(Comment comment) async {
    String url = ApiConstants.comment;

    try {
      var response = await MessageServiceApi.instance.post(
        comment.toJson(),
        url: url,
      );

      if (response!.statusCode == 200 || response.statusCode == 201) {
        return true;
      }
    } catch (e) {}

    return false;
  }

  static Future<bool> saveUserEditedComment(Comment comment) async {
    String url = "${ApiConstants.commentUpdate}/${comment.messageId}";
    try {
      var response = await MessageServiceApi.instance.put(
        comment.toJson(),
        url: url,
      );

      if (response!.statusCode == 200 || response.statusCode == 201) {
        return true;
      }
    } catch (e) {}

    return false;
  }

  static Future<bool> deleteUserComment(String uuid) async {
    String url = "${ApiConstants.commentDelete}/$uuid";

    try {
      var response = await MessageServiceApi.instance.delete(url: url);

      if (response!.statusCode == 200 || response.statusCode == 201) {
        return true;
      }
    } catch (e) {}

    return false;
  }

  static Future<List<Message>?> getPosts(String tag) async {
    String url = tag != null
        ? "${ApiConstants.messageService}/findby-trending-tag"
        : ApiConstants.message;

    url += "&searchTag=$tag";

    try {
      var response = await MessageServiceApi.instance.get(url: url);
      if (tag.isNotEmpty) {
        await Future.delayed(Duration(milliseconds: 1000));
      }
      if (response!.statusCode == 200 || response.statusCode == 201) {
        var jsonResponse = jsonDecode(response.body);
        List<Message> messages = (jsonResponse as List)
            .map((data) => Message.fromJson(data))
            .toList();
        List<Message> list = [];
        DateFormat sdf = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS", 'en_US');
        for (Message message in messages) {
          try {
            message.createdDate =
                sdf.parse(message.createdTimestamp).toString();
          } catch (e) {}
        }
        list.addAll(messages);
        list.sort();
        return messages != null ? list : null;
      }
    } catch (e) {}
    return null;
  }

  static Future<List<Message>?> getMostLikedPosts() async {
    String url = ApiConstants.mostLikedMessages;

    try {
      var response = await MessageServiceApi.instance.get(url: url);

      if (response!.statusCode == 200 || response.statusCode == 201) {
        var jsonResponse = jsonDecode(response.body);
        List<Message> messages = (jsonResponse as List)
            .map((data) => Message.fromJson(data))
            .toList();

        if (messages != null) {
          DateFormat sdf = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS", "en_US");

          for (Message message in messages) {
            try {
              message.createdDate =
                  sdf.parse(message.createdTimestamp).toString();
            } catch (e) {}
          }

          messages.sort();
        }

        return messages != null ? List<Message>.from(messages) : null;
      }
    } catch (e) {}

    return null;
  }

  static Future<List<Message>?> getMostCommentedPosts() async {
    String url = ApiConstants.mostCommentedMessages;

    try {
      var response = await MessageServiceApi.instance.get(url: url);

      if (response!.statusCode == 200 || response.statusCode == 201) {
        var jsonResponse = jsonDecode(response.body);
        List<Message> messages = (jsonResponse as List)
            .map((data) => Message.fromJson(data))
            .toList();

        if (messages != null) {
          DateFormat sdf = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS", "en_US");

          for (Message message in messages) {
            try {
              message.createdDate =
                  sdf.parse(message.createdTimestamp).toString();
            } catch (e) {}
          }

          messages.sort();
        }

        return messages != null ? List<Message>.from(messages) : null;
      }
    } catch (e) {}

    return null;
  }

  static Future<List<Message>?> getMyPosts() async {
    String url = ApiConstants.myMessages;

    try {
      var response = await MessageServiceApi.instance.get(url: url);

      if (response!.statusCode == 200 || response.statusCode == 201) {
        var jsonResponse = jsonDecode(response.body);
        List<Message> messages = (jsonResponse as List)
            .map((data) => Message.fromJson(data))
            .toList();

        if (messages != null) {
          DateFormat sdf = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS", "en_US");

          for (Message message in messages) {
            try {
              message.createdDate =
                  sdf.parse(message.createdTimestamp).toString();
            } catch (e) {}
          }

          messages.sort();
        }

        return messages != null ? List<Message>.from(messages) : null;
      }
    } catch (e) {}

    return null;
  }

  static Future<List<Message>?> getCommentedPosts() async {
    String url = "${ApiConstants.messageService}/findCommentedPosts";

    try {
      var response = await MessageServiceApi.instance.get(url: url);

      if (response!.statusCode == 200 || response.statusCode == 201) {
        var jsonResponse = jsonDecode(response.body);
        List<Message> messages = (jsonResponse as List)
            .map((data) => Message.fromJson(data))
            .toList();

        if (messages != null) {
          DateFormat sdf = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS", "en_US");

          for (Message message in messages) {
            try {
              message.createdDate =
                  sdf.parse(message.createdTimestamp).toString();
            } catch (e) {}
          }

          messages.sort();
        }

        return messages != null ? List<Message>.from(messages) : null;
      }
    } catch (e) {}

    return null;
  }

  static Future<List<Message>?> getLikedPosts() async {
    String url = "${ApiConstants.messageService}/findLikedPosts";

    try {
      var response = await MessageServiceApi.instance.get(url: url);

      if (response!.statusCode == 200 || response.statusCode == 201) {
        var jsonResponse = jsonDecode(response.body);
        List<Message> messages = (jsonResponse as List)
            .map((data) => Message.fromJson(data))
            .toList();

        if (messages != null) {
          DateFormat sdf = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS", "en_US");

          for (Message message in messages) {
            try {
              message.createdDate =
                  sdf.parse(message.createdTimestamp).toString();
            } catch (e) {}
          }

          messages.sort();
        }

        return messages != null ? List<Message>.from(messages) : null;
      }
    } catch (e) {}

    return null;
  }

  static Future<bool> deleteMyPost(String uuid) async {
    String url = "${ApiConstants.messageService}/$uuid";

    try {
      var response = await MessageServiceApi.instance.delete(url: url);

      if (response!.statusCode == 200 || response.statusCode == 201) {
        return true;
      }
    } catch (e) {}

    return false;
  }

  static Future<List<Message>?> getSearchedTalks(String keyword) async {
    String url = ApiConstants.searchMessages;

    // Create the query parameters
    Map<String, dynamic> queryParams = {
      "searchText": keyword,
    };

    // Create the full URL with query parameters
    Uri uri = Uri.parse(url).replace(queryParameters: queryParams);

    try {
      var response = await MessageServiceApi.instance.get(url: uri.toString());

      if (response!.statusCode == 200 || response.statusCode == 201) {
        var jsonResponse = jsonDecode(response.body);
        List<Message> talksList =
            List<Message>.from(jsonResponse.map((x) => Message.fromJson(x)));
        return talksList;
      }
    } catch (e) {}

    return null;
  }

  static Future<bool> saveMessageDislike(String uuid, String languageId) async {
    String url = "${ApiConstants.saveMessageDislike}/$uuid";

    try {
      var response = await MessageServiceApi.instance.post(
        {"languageId": languageId},
        url: url,
      );

      if (response!.statusCode == 200 || response.statusCode == 201) {
        return true;
      }
    } catch (e) {}

    return false;
  }
}
