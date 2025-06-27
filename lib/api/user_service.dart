import 'dart:convert';



import 'package:farmsanta_new/Constants/api_constants.dart';
import 'package:farmsanta_new/Core/shared_pref.dart';
import 'package:farmsanta_new/Models/User/UserToken.dart';
import 'package:farmsanta_new/Services/crud_api.dart';
import 'package:farmsanta_new/Services/shared_helper.dart';

import '../Services/store_helper.dart';

class UserServiceApi extends CrudApi {
  UserServiceApi() : super();

  static Future<int> authenticate(data, {bool passToken = true}) async {
    try {
      var response = await createPostRequest(
          "${ApiConstants.authenticate}/${StoreHelper.store.role}",
          jsonEncode(data),
          passToken: false);
      print("response is ${response.body} ${response.statusCode}");
      if (response.statusCode == 200) {
        final jsonData = (jsonDecode(response.body));
        var data = UserToken.fromJson(jsonData);
        SharedHelper.authToken = data.token!;
        await SharedPref.setString(SharedPrefKeys.authTokenKey, data.token!);
        await SharedPref.setString(
            SharedPrefKeys.refreshToken, data.refreshToken!);
        await SharedPref.setBool(SharedPrefKeys.userLoggedIn, true);

        return 1;
      } else if (response.statusCode == 404) {
        return 2;
      }
    } catch (e) {}
    return 0;
  }

  static late UserServiceApi instance;

  static void init() {
    instance = UserServiceApi();
  }
}
