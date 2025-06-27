// ignore_for_file: empty_catches

import 'dart:convert';

import '../Constants/api_constants.dart';
import '../Models/SupportPlace/POP/PopDetailsDTO.dart';
import '../Models/SupportPlace/POP/PopDto.dart';
import '../api/pop_service.dart';

class POPController {
  static Future<PoPModel?> getPopDetailsResponse(String uuid) async {
    String url = "${ApiConstants.popSections}/$uuid";

    try {
      var response = await POPService.instance.get(url: url);

      if (response!.statusCode == 200 || response.statusCode == 201) {
        var jsonResponse = jsonDecode(response.body);
        return PoPModel.fromJson(jsonResponse);
      }
    } catch (e) {}

    return null;
  }

  static Future<List<PopSectionModel>?> getSearchedPops(String keyword) async {
    String url = "${ApiConstants.popSearch}$keyword";

    try {
      var response = await POPService.instance.get(url: url);

      if (response!.statusCode == 200 || response.statusCode == 201) {
        var jsonResponse = jsonDecode(response.body);
        List<PopSectionModel> popsList = List<PopSectionModel>.from(
            jsonResponse.map((x) => PopSectionModel.fromJson(x)));
        return popsList;
      }
    } catch (e) {}

    return null;
  }

  static Future<List<PoPModel>?> getPopList() async {
    String url = ApiConstants.popServiceUser;

    try {
      var response = await POPService.instance.get(url: url);
      if (response!.statusCode == 200 || response.statusCode == 201) {
        var jsonResponse = jsonDecode(response.body);
        List<PoPModel> popList = List<PoPModel>.from(
            jsonResponse.map((x) => PoPModel.fromJson(x)));
        return popList;
      }
    } catch (e) {}

    return null;
  }
}
