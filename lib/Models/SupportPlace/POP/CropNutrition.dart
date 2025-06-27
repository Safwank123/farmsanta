import 'NutritionDosage.dart';

class CropNutrition {
  String createdBy;
  DateTime createdTimestamp;
  String crop;
  List<String> cultivarGroups;
  List<String> cultivars;
  List<NutritionDosage> dosages;
  String status;
  String tenantId;
  String updatedBy;
  DateTime updatedTimestamp;
  String uuid;

  CropNutrition({
    required this.createdBy,
    required this.createdTimestamp,
    required this.crop,
    required this.cultivarGroups,
    required this.cultivars,
    required this.dosages,
    required this.status,
    required this.tenantId,
    required this.updatedBy,
    required this.updatedTimestamp,
    required this.uuid,
  });

  factory CropNutrition.fromJson(Map<String, dynamic> json) {
    try {
      return CropNutrition(
        createdBy: json["createdBy"] != null ? json["createdBy"] as String : '',
        createdTimestamp: json["createdTimestamp"] != null
            ? DateTime.parse(json["createdTimestamp"])
            : DateTime.now(),
        crop: json["crop"] != null ? json["crop"] as String : '',
        cultivarGroups: json["cultivarGroups"] != null
            ? List<String>.from(json["cultivarGroups"].map((x) => x))
            : [],
        cultivars: json["cultivars"] != null
            ? List<String>.from(json["cultivars"].map((x) => x))
            : [],
        dosages: json["dosages"] != null
            ? List<NutritionDosage>.from(
                json["dosages"].map((x) => NutritionDosage.fromJson(x)))
            : [],
        status: json["status"] != null ? json["status"] as String : '',
        tenantId: json["tenantId"] != null ? json["tenantId"] as String : '',
        updatedBy: json["updatedBy"] != null ? json["updatedBy"] as String : '',
        updatedTimestamp: json["updatedTimestamp"] != null
            ? DateTime.parse(json["updatedTimestamp"])
            : DateTime.now(),
        uuid: json["uuid"] != null ? json["uuid"] as String : '',
      );
    } catch (e) {
      return CropNutrition(
        createdBy: json["createdBy"] != null ? json["createdBy"] as String : '',
        createdTimestamp: json["createdTimestamp"] != null
            ? DateTime.fromMillisecondsSinceEpoch(json["createdTimestamp"])
            : DateTime.now(),
        crop: json["crop"] != null ? json["crop"] as String : '',
        cultivarGroups: json["cultivarGroups"] != null
            ? List<String>.from(json["cultivarGroups"].map((x) => x))
            : [],
        cultivars: json["cultivars"] != null
            ? List<String>.from(json["cultivars"].map((x) => x))
            : [],
        dosages: json["dosages"] != null
            ? List<NutritionDosage>.from(
                json["dosages"].map((x) => NutritionDosage.fromJson(x)))
            : [],
        status: json["status"] != null ? json["status"] as String : '',
        tenantId: json["tenantId"] != null ? json["tenantId"] as String : '',
        updatedBy: json["updatedBy"] != null ? json["updatedBy"] as String : '',
        updatedTimestamp: json["updatedTimestamp"] != null
            ? DateTime.fromMillisecondsSinceEpoch(json["updatedTimestamp"])
            : DateTime.now(),
        uuid: json["uuid"] != null ? json["uuid"] as String : '',
      );
    }
  }

  Map<String, dynamic> toJson() => {
        "createdBy": createdBy,
        "createdTimestamp": createdTimestamp.toIso8601String(),
        "crop": crop,
        "cultivarGroups": List<dynamic>.from(cultivarGroups.map((x) => x)),
        "cultivars": List<dynamic>.from(cultivars.map((x) => x)),
        "dosages": List<dynamic>.from(dosages.map((x) => x.toJson())),
        "status": status,
        "tenantId": tenantId,
        "updatedBy": updatedBy,
        "updatedTimestamp": updatedTimestamp.toIso8601String(),
        "uuid": uuid,
      };
}
