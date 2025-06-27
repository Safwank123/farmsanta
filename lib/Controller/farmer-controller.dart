// ignore_for_file: empty_catches

import 'dart:convert';

import 'package:farmsanta_new/api/farmer_service.dart';
import 'package:velocity_x/velocity_x.dart';

import '../Constants/api_constants.dart';
import '../Models/Farmer/Farmer.dart';
import '../Models/SupportPlace/farmscout/advisory.dart';
import '../Models/SupportPlace/farmscout/farm_scouting.dart';
import '../Models/User/UserToken.dart';

class FarmerController {
  static Future<FarmScouting?> saveFarmScouting(
      FarmScouting farmScouting) async {
    try {
      var response = await FarmerServiceApi.instance.post(
        farmScouting.toJson(),
        url: ApiConstants.farmScouting,
      );

      if (response != null) {
        return FarmScouting.fromJson(jsonDecode(response.body));
      }
    } catch (e) {}

    return null;
  }

  static Future<List<String>?> getUserGroups() async {
    String url = ApiConstants.farmerGroups;

    try {
      var response = await FarmerServiceApi.instance.get(url: url);

      if (response!.statusCode == 200 || response.statusCode == 201) {
        var jsonResponse = jsonDecode(response.body);
        List<String> groups = List<String>.from(jsonResponse);
        return groups;
      }
    } catch (e) {}

    return null;
  }

  static Future<List<FarmScouting>?> getFarmScoutings(
      String landId, String farmerId) async {
    String url = ApiConstants.farmScouting;
    if (landId != null && landId.isNotEmpty) {
      url = "${ApiConstants.farmScoutingByLand}/$landId";
    } else if (farmerId != null && farmerId.isNotEmpty) {
      url = "${ApiConstants.farmScoutingByFarmer}/$farmerId";
    }

    try {
      var response = await FarmerServiceApi.instance.get(url: url);

      if (response!.statusCode == 200 || response.statusCode == 201) {
        var jsonResponse = jsonDecode(response.body);
        List<FarmScouting> farmScoutingList = (jsonResponse as List)
            .map((data) => FarmScouting.fromJson(data))
            .toList();
        return farmScoutingList;
      }
    } catch (e) {}

    return null;
  }

  static Future<FarmScouting?> getFarmScouting(String uuid) async {
    String url = "${ApiConstants.farmScouting}/farm-scouting/$uuid";

    try {
      var response = await FarmerServiceApi.instance.get(url: url);

      if (response!.statusCode == 200 || response.statusCode == 201) {
        var jsonResponse = jsonDecode(response.body);
        FarmScouting farmScouting = FarmScouting.fromJson(jsonResponse);
        return farmScouting;
      }
    } catch (e) {}

    return null;
  }

  static Future<Farmer?> saveFarmer(Farmer farmer) async {
    String url = ApiConstants.farmerProfileSave;

    try {
      var response = await FarmerServiceApi.instance.post(
        farmer.toJson(),
        url: url,
      );

      if (response!.statusCode == 200 || response.statusCode == 201) {
        var jsonResponse = jsonDecode(response.body);
        Farmer savedFarmer = Farmer.fromJson(jsonResponse);
        return savedFarmer;
      }
    } catch (e) {}

    return null;
  }

  static Future<UserToken?> createFarmerProfile(Farmer farmer) async {
    String url = "${ApiConstants.farmerProfile}/farmer-profile-save";

    try {
      var response = await FarmerServiceApi.instance.post(
        farmer.toJson(),
        url: url,
      );

      if (response!.statusCode == 200 || response.statusCode == 201) {
        var jsonResponse = jsonDecode(response.body);
        UserToken userToken = UserToken.fromJson(jsonResponse);
        return userToken;
      }
    } catch (e) {}

    return null;
  }

  static Future<List<FarmScouting>?> getSearchedScouting(String keyword) async {
    String url = "${ApiConstants.farmScoutingBySearch}$keyword";

    try {
      var response = await FarmerServiceApi.instance.get(url: url);

      if (response!.statusCode == 200 || response.statusCode == 201) {
        var jsonResponse = jsonDecode(response.body);
        List<FarmScouting> scoutingList = List<FarmScouting>.from(
            jsonResponse.map((x) => FarmScouting.fromJson(x)));
        return scoutingList;
      }
    } catch (e) {}

    return null;
  }

  static Future<Farmer?> getCurrentFarmer() async {
    String url = ApiConstants.currentFarmer;

    try {
      var response = await FarmerServiceApi.instance.get(url: url);

      if (response!.statusCode == 200 || response.statusCode == 201) {
        var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;

        Farmer currentFarmer = Farmer.fromJson(jsonResponse);
        return currentFarmer;
      }
    } catch (e) {
      print("farmer conversion error is ${e.toString()}");
    }

    return null;
  }

  static Future<Farmer?> updateFarmer(Farmer farmer) async {
    String url = ApiConstants.updateFarmer;

    try {
      var response =
          await FarmerServiceApi.instance.put(farmer.toMap(), url: url);

      if (response!.statusCode == 200 || response.statusCode == 201) {
        var jsonResponse = jsonDecode(response.body);
        Farmer updatedFarmer = Farmer.fromJson(jsonResponse);
        return updatedFarmer;
      }
    } catch (e) {}

    return null;
  }

  static Future<List<Advisory>?> getAdvisoryById(String notifUuid) async {
    String url = "${ApiConstants.cropAdvisoryByScoutingId}/$notifUuid";

    try {
      var response = await FarmerServiceApi.instance.get(url: url);
      if (response!.statusCode == 200 || response.statusCode == 201) {
        var jsonResponse = jsonDecode(response.body);
        List<Advisory> advisories =
            List<Advisory>.from(jsonResponse.map((x) => Advisory.fromJson(x)));
        return advisories;
      }
    } catch (e) {}

    return null;
  }
}
