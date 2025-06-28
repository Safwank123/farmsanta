// ignore_for_file: empty_catches
import 'dart:convert';
import 'package:farmsanta_new/Constants/api_constants.dart';
import 'package:farmsanta_new/Constants/enums.dart';
import 'package:farmsanta_new/Models/Common/crop_model.dart';
import 'package:farmsanta_new/Models/Common/id_name.dart';
import 'package:farmsanta_new/Models/Common/language.dart';
import 'package:farmsanta_new/Models/Common/territory.dart';
import 'package:farmsanta_new/Services/shared_helper.dart';
import 'package:farmsanta_new/Services/store_helper.dart';
import 'package:farmsanta_new/api/master-service.dart';
import 'package:farmsanta_new/mututations/common.dart';

import '../Models/Farmer/Farmer.dart';
import '../Models/Profile/CropStage.dart';
import '../Models/SupportPlace/CropAdvisory/crop_advisory_model.dart';
import '../Models/SupportPlace/CropCalender/CropCalender.dart';
import '../Models/SupportPlace/CropCalender/CropStageCalendar.dart';
import '../Models/SupportPlace/Cultivar/Cultivar.dart';
import '../Models/SupportPlace/Disease/Disease.dart';
import '../Models/SupportPlace/POP/CroppingProcessDto.dart';
import '../Models/SupportPlace/Weather/WeatherData.dart';
import '../Models/SupportPlace/calculator/FertilizerGeneratedReport.dart';
import '../Models/SupportPlace/calculator/FertilizerSourceDetails.dart';
import '../Models/SupportPlace/calculator/GenerateFertilizerReportPayload.dart';
import '../Models/SupportPlace/master/CropMaster.dart';
import '../Models/soil/CropRecommendation.dart';
import '../Models/soil/SoilHealth.dart';

class MasterController {
  //get list of countries

  static Future<TerritoryModel?> getTerritoriesList() async {
    try {
      var resp = await MasterService.instance.get(url: ApiConstants.territory);
      if (resp!.statusCode == 200 || resp.statusCode == 201) {
        List data = jsonDecode(resp.body);
        List<TerritoryModel> countries =
            data.map((data) => TerritoryModel.fromMap((data))).toList();
        print("lenght is ${countries.length}");
        UpdateCountriesList(countries);
      }
    } catch (e) {
      print("terriroty erorr ${e.toString()}");
    }
    return null;
  }

  //get list of string name
  static Future<dynamic> getStringList(StringApiNamesEnum key,
      {String anyParam = "", String nameField = "name"}) async {
    try {
      var resp = await MasterService.instance
          .get(url: "${ApiConstants.stringNameUrls[key.index]}$anyParam");
      if (resp!.statusCode == 200 || resp.statusCode == 201) {
        List data = jsonDecode(resp.body);
        List<String> values = [];
        for (var element in data) {
          values.add(element[nameField]);
        }
        switch (key) {
          case StringApiNamesEnum.uom:
            UpdateUOMList(values);
            break;
          default:
        }
      }
    } catch (e) {}
  }

  //get list of endpoints with data id,name,uuid
  static Future getIdName(IdNameModelEnum name,
      {String anyParam = "", String nameField = "name", String? url}) async {
    try {
      var resp = await MasterService.instance
          .get(url: url ?? "${ApiConstants.idsNameUrls[name.index]}$anyParam");
      if (resp!.statusCode == 200 || resp.statusCode == 201) {
        List data = jsonDecode(resp.body);
        List<IdNameModel> ids = [];
        for (var element in data) {
          ids.add(
              IdNameModel(element['uuid'], element[nameField], element['id']));
        }

        if (url != null) {
          return ids;
        }
        switch (name) {
          case IdNameModelEnum.territory:
            return UpdateTerriotyList(ids);
          case IdNameModelEnum.region:
            return UpdateRegions(ids);
          case IdNameModelEnum.county:
            return UpdateCouty(ids);
          case IdNameModelEnum.subcounty:
            return UpdateSubCouty(ids);
          case IdNameModelEnum.village:
            return UpdateVillage(ids);
        }
      }
    } catch (e) {}
  }

  //get set language
  static Future<void> getLanguages() async {
    try {
      var resp =
          await MasterService.instance.get(url: ApiConstants.languagesAll);
      if (resp!.statusCode == 200 || resp.statusCode == 201) {
        List data = jsonDecode(resp.body);
        List<LanguageModel> ids = [];
        for (var element in data) {
          ids.add(LanguageModel.fromMap(element));
        }
        SharedHelper.setLanguage(ids);
      }
    } catch (e) {}
  }

  //get territory list
  static Future<List<TerritoryModel>> getTerritory() async {
    List<TerritoryModel> ids = [];
    try {
      var resp =
          await MasterService.instance.get(url: ApiConstants.idsNameUrls[0]);
      if (resp!.statusCode == 200 || resp.statusCode == 201) {
        List data = jsonDecode(resp.body);
        for (var element in data) {
          ids.add(TerritoryModel.fromMap(element));
        }
      }
    } catch (e) {}

    return ids;
  }

  //get crops
  static Future getCrops() async {
    try {
      // List<String> cropDivisions = await MasterService.instance
      //     .getByIndicator(ApiConstants.globalIndicatorForCropsDivision);
      List<IdNameModel> cropDivisionsIds = await getIdName(
          IdNameModelEnum.county,
          url:
              "${ApiConstants.globalIndicatorsDetailsByGroup}/${ApiConstants.globalIndicatorForCropsDivision}");

      List<String> cropDivisions = [];
      List<String> cropDivisionsUids = [];
      for (var ele in cropDivisionsIds) {
        cropDivisions.add(ele.name);
        cropDivisionsUids.add(ele.uuid!);
      }

      Map<String, List<CropModelShort>> crops = {};
      for (var element in cropDivisions) {
        crops.addAll({element: []});
      }
      var resp = await MasterService.instance.get(url: ApiConstants.crops);
      if (resp!.statusCode == 200 || resp.statusCode == 201) {
        List data = jsonDecode(resp.body);
        for (var element in data) {
          int index = cropDivisionsUids.indexOf(element['cropDivision']);
          if (index != -1) {
            crops[cropDivisions[index]]!.add(CropModelShort.fromMap(element));
          }
        }

        UpdateCropsList(crops);
      }
    } catch (e) {}
  }

  static Future<dynamic> saveCropCalendar(CropCalendar calendar) async {
    try {
      var response = await MasterService.instance.post(calendar.toJson(),
          url: ApiConstants.addCropCalendar, passToken: false);

      if (response!.statusCode == 200 || response.statusCode == 201) {
        return CropCalendar.fromJson(jsonDecode(response.body));
      }
    } catch (e) {}
  }

  static Future<List<CropCalendar>?> getCropCalendarsById() async {
    String url = ApiConstants.cropCalendarsByUserId;
    Farmer? farmer = StoreHelper.store.farmerMainModel;
    if (farmer != null) {
      url += farmer.userId.toString();
    }

    try {
      var response =
          await MasterService.instance.get(url: url, passToken: false);

      if (response!.statusCode == 200 || response.statusCode == 201) {
        List<dynamic> jsonResponse = jsonDecode(response.body);
        List<CropCalendar> cropCalendars =
            jsonResponse.map((data) => CropCalendar.fromJson(data)).toList();
        return cropCalendars;
      }
    } catch (e) {}

    return null;
  }

  static Future<List<CropStageCalendar>?> getCropsStageCalendarListById(
      String cropId, String id) async {
    Farmer? farmer = StoreHelper.store.farmerMainModel;
    String url = ApiConstants.cropStageCalendarList;
    if (farmer != null) {
      url += '${farmer.userId}/$cropId/$id';
    }

    try {
      var response =
          await MasterService.instance.get(url: url, passToken: false);

      if (response!.statusCode == 200 || response.statusCode == 201) {
        List<dynamic> jsonResponse = jsonDecode(response.body);
        List<CropStageCalendar> cropStageCalendars = jsonResponse
            .map((data) => CropStageCalendar.fromJson(data))
            .toList();
        return cropStageCalendars;
      }
    } catch (e) {}

    return null;
  }

  static Future<List<SoilHealth>?> getSoilHealth() async {
    String url = ApiConstants.soilHealth;

    try {
      var response = await MasterService.instance.get(url: url);

      if (response!.statusCode == 200 || response.statusCode == 201) {
        var jsonResponse = jsonDecode(response.body);
        List<SoilHealth> soilHealths = [];
        if (jsonResponse is List) {
          soilHealths =
              jsonResponse.map((item) => SoilHealth.fromJson(item)).toList();
        }
        return soilHealths;
      }
    } catch (e) {}

    return null;
  }

  static Future<List<Cultivar>?> getCultivar() async {
    String url = ApiConstants.cultivarController;

    try {
      var response = await MasterService.instance.get(url: url);

      if (response!.statusCode == 200 || response.statusCode == 201) {
        var jsonResponse = jsonDecode(response.body);
        List<Cultivar> cultivars = [];
        if (jsonResponse is List) {
          cultivars =
              jsonResponse.map((item) => Cultivar.fromJson(item)).toList();
        }
        return cultivars;
      }
    } catch (e) {}

    return null;
  }

  //TODO
  // Future<List<GlobalIndicatorDTO>> getAllGlobalIndicator() async {
  //   String url =
  //       "${ApiConstants.globalIndicators}?languageId=${appPrefs.getLanguageId()}";

  //   try {
  //     var response = await MasterService.instance.get(url: url);

  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       var jsonResponse = jsonDecode(response.body);
  //       List<GlobalIndicatorDTO> globalIndicators = [];
  //       if (jsonResponse is List) {
  //         globalIndicators = jsonResponse
  //             .map((item) => GlobalIndicatorDTO.fromJson(item))
  //             .toList();
  //       }
  //       return globalIndicators;
  //     }
  //   } catch (e) {
  //
  //   }

  //   return null;
  // }

  static Future<List<CroppingProcessDto>?> getCroppingProcessById(
      String uuid) async {
    String url = "${ApiConstants.croppingProcess}$uuid";

    try {
      var response = await MasterService.instance.get(url: url);

      if (response!.statusCode == 200 || response.statusCode == 201) {
        var jsonResponse = jsonDecode(response.body);
        List<CroppingProcessDto> croppingProcessList =
            List<CroppingProcessDto>.from(
                jsonResponse.map((x) => CroppingProcessDto.fromJson(x)));
        return croppingProcessList;
      }
    } catch (e) {}

    return null;
  }

  static Future<CropDto?> getCropById(String uuid) async {
    String url = "${ApiConstants.cropById}$uuid";

    try {
      var response = await MasterService.instance.get(url: url);

      if (response!.statusCode == 200 || response.statusCode == 201) {
        var jsonResponse = jsonDecode(response.body);
        CropDto cropMaster = CropDto.fromJson(jsonResponse);
        return cropMaster;
      }
    } catch (e) {}

    return null;
  }

  static Future<List<CropDto>?> getSearchedCrops(String keyword) async {
    String url = "${ApiConstants.cropsBySearch}$keyword";

    try {
      var response = await MasterService.instance.get(url: url);

      if (response!.statusCode == 200 || response.statusCode == 201) {
        var jsonResponse = jsonDecode(response.body);
        List<CropDto> cropList =
            List<CropDto>.from(jsonResponse.map((x) => CropDto.fromJson(x)));
        return cropList;
      }
    } catch (e) {}

    return null;
  }

  static Future<List<CropDto>?> getAllCrops() async {
    String url = ApiConstants.cropList;

    try {
      var response = await MasterService.instance.get(url: url);

      if (response!.statusCode == 200 || response.statusCode == 201) {
        var jsonResponse = jsonDecode(response.body);
        List<CropDto> cropList =
            List<CropDto>.from(jsonResponse.map((x) => CropDto.fromJson(x)));
        print("crop data is ${cropList.length}");
        return cropList;
      }
    } catch (e) {}

    return null;
  }

  static Future<List<CropAdvisoryModel>?> getSearchedAdvisories(
      String keyword) async {
    String url = "${ApiConstants.cropAdvisoryBySearch}$keyword";

    try {
      var response = await MasterService.instance.get(url: url);

      if (response!.statusCode == 200 || response.statusCode == 201) {
        var jsonResponse = jsonDecode(response.body);
        List<CropAdvisoryModel> advisoryList = List<CropAdvisoryModel>.from(
            jsonResponse.map((x) => CropAdvisoryModel.fromJson(x)));
        return advisoryList;
      }
    } catch (e) {}

    return null;
  }

  static Future<List<CropAdvisoryModel>?> getCropAdvisories() async {
    String url = ApiConstants.cropAdvisoryByLocation;

    try {
      var response = await MasterService.instance.get(url: url);

      if (response!.statusCode == 200 || response.statusCode == 201) {
        var jsonResponse = jsonDecode(response.body);
        List<CropAdvisoryModel> advisoriesList = List<CropAdvisoryModel>.from(
            jsonResponse.map((x) => CropAdvisoryModel.fromJson(x)));
        return advisoriesList;
      }
    } catch (e) {}

    return null;
  }

  static Future<CropAdvisoryModel?> getCropAdvisory(String uuid) async {
    String url = "${ApiConstants.cropAdvisory}/$uuid";

    try {
      var response = await MasterService.instance.get(url: url);

      if (response!.statusCode == 200 || response.statusCode == 201) {
        var jsonResponse = jsonDecode(response.body);
        CropAdvisoryModel cropMaster = CropAdvisoryModel.fromJson(jsonResponse);
        return cropMaster;
      }
    } catch (e) {}

    return null;
  }

  static Future<WeatherData?> getAllWeatherInfo(String lat, String lon) async {
    String url =
        "${ApiConstants.weatherFeedLandUpdates}?latitude=$lat&longitude=$lon&";

    try {
      var response = await MasterService.instance.get(url: url);

      if (response!.statusCode == 200 || response.statusCode == 201) {
        var jsonResponse = jsonDecode(response.body);
        WeatherData weatherData = WeatherData.fromJson(jsonResponse);
        return weatherData;
      }
    } catch (e) {
      print("weather data error ${e.toString()}");
    }

    return null;
  }

  static Future<List<CropRecommendation>?>
      getCropSpecificRecommendations() async {
    String url = ApiConstants.cropRecommendation;

    try {
      var response = await MasterService.instance.get(url: url);

      if (response!.statusCode == 200 || response.statusCode == 201) {
        var jsonResponse = jsonDecode(response.body);
        List<dynamic> recommendationsData = jsonResponse['data'];

        List<CropRecommendation> cropSpecificRecommendations =
            recommendationsData
                .map((data) => CropRecommendation.fromJson(data))
                .toList();
        return cropSpecificRecommendations;
            }
    } catch (e) {}

    return null;
  }

  static Future<List<FertilizerSourceCalculatorDetailsDto>?>
      getFertilizerSourceDetails() async {
    String url = ApiConstants.fertilizerSourceDetails;

    try {
      var response = await MasterService.instance.get(url: url);
      if (response!.statusCode == 200 || response.statusCode == 201) {
        var jsonResponse = jsonDecode(response.body);
        List<FertilizerSourceCalculatorDetailsDto> fertilizerSourceDetails =
            List<FertilizerSourceCalculatorDetailsDto>.from(jsonResponse
                .map((x) => FertilizerSourceCalculatorDetailsDto.fromJson(x)));
        return fertilizerSourceDetails;
      }
    } catch (e) {}

    return null;
  }

  static Future<FertilizerCalculatorReportDto?> getFertilizerReport(
      GenerateFertilizerReportPayload payload) async {
    String url = ApiConstants.fertilizerReportGenerate;

    try {
      var response =
          await MasterService.instance.post(url: url, payload.toJson());
      if (response!.statusCode == 200 || response.statusCode == 201) {
        var jsonResponse = jsonDecode(response.body);
        return FertilizerCalculatorReportDto.fromJson(jsonResponse);
      }
    } catch (e) {}

    return null;
  }

  static Future<List<Disease>?> getAllCropDiseases() async {
    String url = ApiConstants.disease;

    try {
      var response = await MasterService.instance.get(url: url);
      if (response!.statusCode == 200 || response.statusCode == 201) {
        var jsonResponse = jsonDecode(response.body);
        List<Disease> diseaseList =
            List<Disease>.from(jsonResponse.map((x) => Disease.fromJson(x)));
        print("disease list length in resp  ${diseaseList.length}");
        return diseaseList;
      }
    } catch (e) {
      print("disease list length error ${e.toString()}");
    }

    return null;
  }

  static Future<List<CropStage>?> getAllCropStages() async {
    String url = ApiConstants.cropStage;

    try {
      var response = await MasterService.instance.get(url: url);
      if (response!.statusCode == 200 || response.statusCode == 201) {
        var jsonResponse = jsonDecode(response.body);
        List<CropStage> cropStageList = List<CropStage>.from(
            jsonResponse.map((x) => CropStage.fromJson(x)));
        return cropStageList;
      }
    } catch (e) {}

    return null;
  }
}
