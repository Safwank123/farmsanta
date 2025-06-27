import '../../Common/photo_model.dart';
import 'CropDuration.dart';
import 'HarvestMonth.dart';
import 'SowingMonth.dart';
import 'YieldPotential.dart';

class Cultivar {
  String additionalDescription;
  List<String> additionalProperties;
  String createdBy;
  DateTime createdTimestamp;
  String crop;
  CropDuration? cropDuration;
  String cultivarGroup;
  String cultivarName;
  List<String> farmingTypes;
  HarvestMonth? harvestMonth;
  String ownerName;
  List<Photo> photos;
  List<String> regions;
  List<String> seasons;
  List<SowingMonth> sowingMonths;
  String tenantId;
  List<String> territories;
  String updatedBy;
  DateTime updatedTimestamp;
  String uuid;
  String yearOfRelease;
  YieldPotential? yieldPotential;

  Cultivar({
    required this.additionalDescription,
    required this.additionalProperties,
    required this.createdBy,
    required this.createdTimestamp,
    required this.crop,
    required this.cropDuration,
    required this.cultivarGroup,
    required this.cultivarName,
    required this.farmingTypes,
    required this.harvestMonth,
    required this.ownerName,
    required this.photos,
    required this.regions,
    required this.seasons,
    required this.sowingMonths,
    required this.tenantId,
    required this.territories,
    required this.updatedBy,
    required this.updatedTimestamp,
    required this.uuid,
    required this.yearOfRelease,
    required this.yieldPotential,
  });

  factory Cultivar.fromJson(Map<String, dynamic> json) {
    try {
      return Cultivar(
        additionalDescription: json["additionalDescription"] != null
            ? json["additionalDescription"] as String
            : '',
        additionalProperties: json["additionalProperties"] != null
            ? List<String>.from(json["additionalProperties"].map((x) => x))
            : [],
        createdBy: json["createdBy"] != null ? json["createdBy"] as String : '',
        createdTimestamp: json["createdTimestamp"] != null
            ? DateTime.parse(json["createdTimestamp"])
            : DateTime.now(),
        crop: json["crop"] != null ? json["crop"] as String : '',
        cropDuration: json["cropDuration"] != null
            ? CropDuration.fromJson(json["cropDuration"])
            : null,
        cultivarGroup: json["cultivarGroup"] != null
            ? json["cultivarGroup"] as String
            : '',
        cultivarName:
            json["cultivarName"] != null ? json["cultivarName"] as String : '',
        farmingTypes: json["farmingTypes"] != null
            ? List<String>.from(json["farmingTypes"].map((x) => x))
            : [],
        harvestMonth: json["harvestMonth"] != null
            ? HarvestMonth.fromJson(json["harvestMonth"])
            : null,
        ownerName: json["ownerName"] != null ? json["ownerName"] as String : '',
        photos: json["photos"] != null
            ? List<Photo>.from(json["photos"].map((x) => Photo.fromJson(x)))
            : [],
        regions: json["regions"] != null
            ? List<String>.from(json["regions"].map((x) => x))
            : [],
        seasons: json["seasons"] != null
            ? List<String>.from(json["seasons"].map((x) => x))
            : [],
        sowingMonths: json["sowingMonths"] != null
            ? List<SowingMonth>.from(
                json["sowingMonths"].map((x) => SowingMonth.fromJson(x)))
            : [],
        tenantId: json["tenantId"] != null ? json["tenantId"] as String : '',
        territories: json["territories"] != null
            ? List<String>.from(json["territories"].map((x) => x))
            : [],
        updatedBy: json["updatedBy"] != null ? json["updatedBy"] as String : '',
        updatedTimestamp: json["updatedTimestamp"] != null
            ? DateTime.parse(json["updatedTimestamp"])
            : DateTime.now(),
        uuid: json["uuid"] != null ? json["uuid"] as String : '',
        yearOfRelease: json["yearOfRelease"] != null
            ? json["yearOfRelease"] as String
            : '',
        yieldPotential: json["yieldPotential"] != null
            ? YieldPotential.fromJson(json["yieldPotential"])
            : null,
      );
    } catch (e) {
      return Cultivar(
        additionalDescription: json["additionalDescription"] != null
            ? json["additionalDescription"] as String
            : '',
        additionalProperties: json["additionalProperties"] != null
            ? List<String>.from(json["additionalProperties"].map((x) => x))
            : [],
        createdBy: json["createdBy"] != null ? json["createdBy"] as String : '',
        createdTimestamp: json["createdTimestamp"] != null
            ? DateTime.fromMillisecondsSinceEpoch(json["createdTimestamp"])
            : DateTime.now(),
        crop: json["crop"] != null ? json["crop"] as String : '',
        cropDuration: json["cropDuration"] != null
            ? CropDuration.fromJson(json["cropDuration"])
            : null,
        cultivarGroup: json["cultivarGroup"] != null
            ? json["cultivarGroup"] as String
            : '',
        cultivarName:
            json["cultivarName"] != null ? json["cultivarName"] as String : '',
        farmingTypes: json["farmingTypes"] != null
            ? List<String>.from(json["farmingTypes"].map((x) => x))
            : [],
        harvestMonth: json["harvestMonth"] != null
            ? HarvestMonth.fromJson(json["harvestMonth"])
            : null,
        ownerName: json["ownerName"] != null ? json["ownerName"] as String : '',
        photos: json["photos"] != null
            ? List<Photo>.from(json["photos"].map((x) => Photo.fromJson(x)))
            : [],
        regions: json["regions"] != null
            ? List<String>.from(json["regions"].map((x) => x))
            : [],
        seasons: json["seasons"] != null
            ? List<String>.from(json["seasons"].map((x) => x))
            : [],
        sowingMonths: json["sowingMonths"] != null
            ? List<SowingMonth>.from(
                json["sowingMonths"].map((x) => SowingMonth.fromJson(x)))
            : [],
        tenantId: json["tenantId"] != null ? json["tenantId"] as String : '',
        territories: json["territories"] != null
            ? List<String>.from(json["territories"].map((x) => x))
            : [],
        updatedBy: json["updatedBy"] != null ? json["updatedBy"] as String : '',
        updatedTimestamp: json["updatedTimestamp"] != null
            ? DateTime.fromMillisecondsSinceEpoch(json["updatedTimestamp"])
            : DateTime.now(),
        uuid: json["uuid"] != null ? json["uuid"] as String : '',
        yearOfRelease: json["yearOfRelease"] != null
            ? json["yearOfRelease"] as String
            : '',
        yieldPotential: json["yieldPotential"] != null
            ? YieldPotential.fromJson(json["yieldPotential"])
            : null,
      );
    }
  }

  Map<String, dynamic> toJson() => {
        "additionalDescription": additionalDescription,
        "additionalProperties":
            List<dynamic>.from(additionalProperties.map((x) => x)),
        "createdBy": createdBy,
        "createdTimestamp": createdTimestamp.toIso8601String(),
        "crop": crop,
        "cropDuration": cropDuration!.toJson(),
        "cultivarGroup": cultivarGroup,
        "cultivarName": cultivarName,
        "farmingTypes": List<dynamic>.from(farmingTypes.map((x) => x)),
        "harvestMonth": harvestMonth!.toJson(),
        "ownerName": ownerName,
        "photos": List<dynamic>.from(photos.map((x) => x.toJson())),
        "regions": List<dynamic>.from(regions.map((x) => x)),
        "seasons": List<dynamic>.from(seasons.map((x) => x)),
        "sowingMonths": List<dynamic>.from(sowingMonths.map((x) => x.toJson())),
        "tenantId": tenantId,
        "territories": List<dynamic>.from(territories.map((x) => x)),
        "updatedBy": updatedBy,
        "updatedTimestamp": updatedTimestamp.toIso8601String(),
        "uuid": uuid,
        "yearOfRelease": yearOfRelease,
        "yieldPotential": yieldPotential!.toJson(),
      };
}
