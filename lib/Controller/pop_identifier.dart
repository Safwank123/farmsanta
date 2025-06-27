import 'dart:convert';

import 'package:farmsanta_new/api/pop_identifier.dart';

import '../Constants/api_constants.dart';
import '../Models/SupportPlace/farmscout/cultivation_type.dart';

class POPIdentifier {
  static Future<List<CultivationType>?> getCultivationType() async {
    String url = "${ApiConstants.referenceData}/CultivationType";
    try {
      var response = await POPIdentifierApi.instance.get(url: url);

      if (response!.statusCode == 200 || response.statusCode == 201) {
        var jsonResponse = jsonDecode(response.body);
        List<CultivationType> cultivationTypes = (jsonResponse as List)
            .map((data) => CultivationType.fromJson(data))
            .toList();
        return cultivationTypes;
      }
    } catch (e) {}

    return null;
  }

  static Future<List<CultivationType>?> getCropVariety() async {
    var url = "${ApiConstants.referenceData}/CropVariety";

    try {
      var response = await POPIdentifierApi.instance.get(url: url);

      if (response!.statusCode == 200 || response.statusCode == 201) {
        var jsonResponse = jsonDecode(response.body);
        List<CultivationType> cropVarieties = List<CultivationType>.from(
            jsonResponse.map((data) => CultivationType.fromJson(data)));
        return cropVarieties;
      }
    } catch (e) {}

    return null;
  }
}
