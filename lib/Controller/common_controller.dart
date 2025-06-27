// ignore_for_file: empty_catches

import 'dart:convert';

import '../Constants/api_constants.dart';
import '../api/common_service.dart';

class CommonController {
  static Future<String> generateOtp(String phone) async {
    String url = "${ApiConstants.generateOtp}/FARMER/$phone";

    try {
      var response = await CommonService.instance.get(url: url);

      if (response!.statusCode == 200 || response.statusCode == 201) {
        var jsonResponse = jsonDecode(response.body);

        return jsonResponse['otp'];
      }
    } catch (e) {}

    return "";
  }

  static Future<String> resetOtp(String phone) async {
    String url = "${ApiConstants.sendResetOtp}/FARMER/$phone";

    try {
      var response = await CommonService.instance.get(url: url);

      if (response!.statusCode == 200 || response.statusCode == 201) {
        var jsonResponse = jsonDecode(response.body);

        return jsonResponse['otp'];
      }
    } catch (e) {}

    return "";
  }

  static Future<bool> subscribeToPush() async {
    List<String> topics = ["weather", "crop-calender", "crop-advisory", "pop"];

    try {
      var response = await CommonService.instance.post(
          jsonEncode({"topics": topics}),
          url: ApiConstants.subscribePush);

      if (response!.statusCode == 200) {
        return true;
      }
    } catch (e) {}
    return false;
  }
}
