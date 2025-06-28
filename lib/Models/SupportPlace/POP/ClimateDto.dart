
import 'package:farmsanta_new/Models/SupportPlace/POP/NutritionDosage.dart';

import 'Dosage.dart';
import 'PopDto.dart';

class ClimateDto {
  MinMax? annualRain;
  MinMax? averageRain;
  String createdBy;
  DateTime createdTimestamp;
  String cropName;
  List<String> cultivarGroups;
  List<String> cultivars;
  MinMax? growingTemperature;
  MinMax? harvestTemperature;
  NutritionDosage? dosages;
  List<String> regions;
  String remarks;
  MinMax? sowingTemperature;
  String status;
  String tempUnit;
  String tenantId;
  List<String> territories;
  String updatedBy;
  DateTime updatedTimestamp;
  String uuid;
  MinMax? windVelocity;

  ClimateDto({
    required this.annualRain,
    required this.averageRain,
    required this.createdBy,
    required this.createdTimestamp,
    required this.cropName,
    required this.cultivarGroups,
    required this.cultivars,
    required this.growingTemperature,
    required this.harvestTemperature,
    required this.dosages,
    required this.regions,
    required this.remarks,
    required this.sowingTemperature,
    required this.status,
    required this.tempUnit,
    required this.tenantId,
    required this.territories,
    required this.updatedBy,
    required this.updatedTimestamp,
    required this.uuid,
    required this.windVelocity,
  });

  factory ClimateDto.fromJson(Map<String, dynamic> json) {
    try {
      return ClimateDto(
        annualRain: json["annualRain"] != null
            ? MinMax.fromJson(json["annualRain"])
            : null,
        averageRain: json["averageRain"] != null
            ? MinMax.fromJson(json["averageRain"])
            : null,
        createdBy: json["createdBy"] != null ? json["createdBy"] as String : '',
        createdTimestamp: json["createdTimestamp"] != null
            ? DateTime.parse(json["createdTimestamp"])
            : DateTime.now(),
        cropName: json["cropName"] != null ? json["cropName"] as String : '',
        cultivarGroups: json["cultivarGroups"] != null
            ? List<String>.from(json["cultivarGroups"].map((x) => x))
            : [],
        cultivars: json["cultivars"] != null
            ? List<String>.from(json["cultivars"].map((x) => x))
            : [],
        growingTemperature: json["growingTemperature"] != null
            ? MinMax.fromJson(json["growingTemperature"])
            : null,
        harvestTemperature: json["harvestTemperature"] != null
            ? MinMax.fromJson(json["harvestTemperature"])
            : null,
        dosages: json["dosages"] != null
            ? NutritionDosage.fromJson(json["dosages"])
            : null,
        regions: json["regions"] != null
            ? List<String>.from(json["regions"].map((x) => x))
            : [],
        remarks: json["remarks"] != null ? json["remarks"] as String : '',
        sowingTemperature: json["sowingTemperature"] != null
            ? MinMax.fromJson(json["sowingTemperature"])
            : null,
        status: json["status"] != null ? json["status"] as String : '',
        tempUnit: json["tempUnit"] != null ? json["tempUnit"] as String : '',
        tenantId: json["tenantId"] != null ? json["tenantId"] as String : '',
        territories: json["territories"] != null
            ? List<String>.from(json["territories"].map((x) => x))
            : [],
        updatedBy: json["updatedBy"] != null ? json["updatedBy"] as String : '',
        updatedTimestamp: json["updatedTimestamp"] != null
            ? DateTime.parse(json["updatedTimestamp"])
            : DateTime.now(),
        uuid: json["uuid"] != null ? json["uuid"] as String : '',
        windVelocity: json["windVelocity"] != null
            ? MinMax.fromJson(json["windVelocity"])
            : null,
      );
    } catch (e) {
      return ClimateDto(
        annualRain: json["annualRain"] != null
            ? MinMax.fromJson(json["annualRain"])
            : null,
        averageRain: json["averageRain"] != null
            ? MinMax.fromJson(json["averageRain"])
            : null,
        createdBy: json["createdBy"] != null ? json["createdBy"] as String : '',
        createdTimestamp: json["createdTimestamp"] != null
            ? DateTime.fromMillisecondsSinceEpoch(json["createdTimestamp"])
            : DateTime.now(),
        cropName: json["cropName"] != null ? json["cropName"] as String : '',
        cultivarGroups: json["cultivarGroups"] != null
            ? List<String>.from(json["cultivarGroups"].map((x) => x))
            : [],
        cultivars: json["cultivars"] != null
            ? List<String>.from(json["cultivars"].map((x) => x))
            : [],
        growingTemperature: json["growingTemperature"] != null
            ? MinMax.fromJson(json["growingTemperature"])
            : null,
        harvestTemperature: json["harvestTemperature"] != null
            ? MinMax.fromJson(json["harvestTemperature"])
            : null,
        dosages: json["dosages"] != null
            ? NutritionDosage.fromJson(json["dosages"])
            : null,
        regions: json["regions"] != null
            ? List<String>.from(json["regions"].map((x) => x))
            : [],
        remarks: json["remarks"] != null ? json["remarks"] as String : '',
        sowingTemperature: json["sowingTemperature"] != null
            ? MinMax.fromJson(json["sowingTemperature"])
            : null,
        status: json["status"] != null ? json["status"] as String : '',
        tempUnit: json["tempUnit"] != null ? json["tempUnit"] as String : '',
        tenantId: json["tenantId"] != null ? json["tenantId"] as String : '',
        territories: json["territories"] != null
            ? List<String>.from(json["territories"].map((x) => x))
            : [],
        updatedBy: json["updatedBy"] != null ? json["updatedBy"] as String : '',
        updatedTimestamp: json["updatedTimestamp"] != null
            ? DateTime.fromMillisecondsSinceEpoch(json["updatedTimestamp"])
            : DateTime.now(),
        uuid: json["uuid"] != null ? json["uuid"] as String : '',
        windVelocity: json["windVelocity"] != null
            ? MinMax.fromJson(json["windVelocity"])
            : null,
      );
    }
  }

  Map<String, dynamic> toJson() => {
        "annualRain": annualRain!.toJson(),
        "averageRain": averageRain!.toJson(),
        "createdBy": createdBy,
        "createdTimestamp": createdTimestamp.toIso8601String(),
        "cropName": cropName,
        "cultivarGroups": List<dynamic>.from(cultivarGroups.map((x) => x)),
        "cultivars": List<dynamic>.from(cultivars.map((x) => x)),
        "growingTemperature": growingTemperature!.toJson(),
        "harvestTemperature": harvestTemperature!.toJson(),
        "dosages": dosages!.toJson(),
        "regions": List<dynamic>.from(regions.map((x) => x)),
        "remarks": remarks,
        "sowingTemperature": sowingTemperature!.toJson(),
        "status": status,
        "tempUnit": tempUnit,
        "tenantId": tenantId,
        "territories": List<dynamic>.from(territories.map((x) => x)),
        "updatedBy": updatedBy,
        "updatedTimestamp": updatedTimestamp.toIso8601String(),
        "uuid": uuid,
        "windVelocity": windVelocity!.toJson(),
      };
}

class MinMax {
  double? max;
  double? min;

  MinMax({this.max, this.min});

  MinMax.fromJson(Map<String, dynamic> json) {
    max = json['max']?.toDouble();
    min = json['min']?.toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['max'] = max;
    data['min'] = min;
    return data;
  }
}
