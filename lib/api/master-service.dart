// ignore_for_file: empty_catches

import 'dart:convert';


import 'package:farmsanta_new/Services/crud_api.dart';

import '../Constants/api_constants.dart';

class MasterService extends CrudApi {
  //get names of indicators - gender_ind,education_ind
  Future<List<String>> getByIndicator(String indicator) async {
    List<String> names = [];
    try {
      //TODo language id
      var response = await createGetRequest(
          "${ApiConstants.globalIndicatorsDetailsByGroup}/$indicator");
      if (response.statusCode == 200) {
        List jsonData = (jsonDecode(response.body));

        for (var element in jsonData) {
          names.add(element['name']);
        }
      }
    } catch (e) {}
    return names;
  }

  MasterService() : super();

  static late MasterService instance;

  static void init() {
    instance = MasterService();
  }
}
