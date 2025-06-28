import '../../../Services/store_helper.dart';
import '../../Common/photo_model.dart';

class CropAdvisoryModel {
  String advisory;
  String advisoryTag;
  String advisoryTagName;
  bool agronomyManager;
  String createdBy;
  DateTime createdTimestamp;
  String crop;
  List<String> farmerGroups;
  String firstName;
  String growthStage;
  String lastName;
  List<Photo> photos;
  String productRecommendation;
  String profileImage;
  List<String> regions;
  String status;
  bool superAdmin;
  String tenantId;
  List<String> territory;
  String updatedBy;
  DateTime updatedTimestamp;
  String uuid;
  String? cropName;
  String? growthStageName;

  CropAdvisoryModel({
    required this.advisory,
    required this.advisoryTag,
    required this.advisoryTagName,
    required this.agronomyManager,
    required this.createdBy,
    required this.createdTimestamp,
    required this.crop,
    required this.farmerGroups,
    required this.firstName,
    required this.growthStage,
    required this.lastName,
    required this.photos,
    required this.productRecommendation,
    required this.profileImage,
    required this.regions,
    required this.status,
    required this.superAdmin,
    required this.tenantId,
    required this.territory,
    required this.updatedBy,
    required this.updatedTimestamp,
    required this.uuid,
    this.growthStageName,
  });

  factory CropAdvisoryModel.fromJson(Map<String, dynamic> json) {
    try {
      return CropAdvisoryModel(
          advisory: json["advisory"] != null ? json["advisory"] as String : '',
          advisoryTag:
              json["advisoryTag"] != null ? json["advisoryTag"] as String : '',
          advisoryTagName: json["advisoryTagName"] != null
              ? json["advisoryTagName"] as String
              : '',
          agronomyManager:
              json["agronomyManager"] ?? false,
          createdBy:
              json["createdBy"] != null ? json["createdBy"] as String : '',
          createdTimestamp: json["createdTimestamp"] != null
              ? DateTime.parse(json["createdTimestamp"])
              : DateTime.now(),
          crop: json["crop"] != null ? json["crop"] as String : '',
          farmerGroups: json["farmerGroups"] != null
              ? List<String>.from(json["farmerGroups"].map((x) => x))
              : [],
          firstName:
              json["firstName"] != null ? json["firstName"] as String : '',
          growthStage:
              json["growthStage"] != null ? json["growthStage"] as String : '',
          lastName: json["lastName"] != null ? json["lastName"] as String : '',
          photos: json["photos"] != null
              ? List<Photo>.from(json["photos"].map((x) => Photo.fromJson(x)))
              : [],
          productRecommendation: json["productRecommendation"] != null
              ? json["productRecommendation"] as String
              : '',
          profileImage: json["profileImage"] != null
              ? json["profileImage"] as String
              : '',
          regions: json["regions"] != null
              ? List<String>.from(json["regions"].map((x) => x))
              : [],
          status: json["status"] != null ? json["status"] as String : '',
          superAdmin: json["superAdmin"] ?? false,
          tenantId: json["tenantId"] != null ? json["tenantId"] as String : '',
          territory: json["territory"] != null
              ? List<String>.from(json["territory"].map((x) => x))
              : [],
          updatedBy:
              json["updatedBy"] != null ? json["updatedBy"] as String : '',
          updatedTimestamp: json["updatedTimestamp"] != null
              ? DateTime.parse(json["updatedTimestamp"])
              : DateTime.now(),
          uuid: json["uuid"] != null ? json["uuid"] as String : '',
          growthStageName: json['cropStage'] != null
              ? StoreHelper.getGrowthStage(json['cropStage'])
              : "");
    } catch (e) {
      return CropAdvisoryModel(
          advisory: json["advisory"] != null ? json["advisory"] as String : '',
          advisoryTag:
              json["advisoryTag"] != null ? json["advisoryTag"] as String : '',
          advisoryTagName: json["advisoryTagName"] != null
              ? json["advisoryTagName"] as String
              : '',
          agronomyManager:
              json["agronomyManager"] ?? false,
          createdBy:
              json["createdBy"] != null ? json["createdBy"] as String : '',
          createdTimestamp: json["createdTimestamp"] != null
              ? DateTime.fromMillisecondsSinceEpoch(json["createdTimestamp"])
              : DateTime.now(),
          crop: json["crop"] != null ? json["crop"] as String : '',
          farmerGroups: json["farmerGroups"] != null
              ? List<String>.from(json["farmerGroups"].map((x) => x))
              : [],
          firstName:
              json["firstName"] != null ? json["firstName"] as String : '',
          growthStage:
              json["growthStage"] != null ? json["growthStage"] as String : '',
          lastName: json["lastName"] != null ? json["lastName"] as String : '',
          photos: json["photos"] != null
              ? List<Photo>.from(json["photos"].map((x) => Photo.fromJson(x)))
              : [],
          productRecommendation: json["productRecommendation"] != null
              ? json["productRecommendation"] as String
              : '',
          profileImage: json["profileImage"] != null
              ? json["profileImage"] as String
              : '',
          regions: json["regions"] != null
              ? List<String>.from(json["regions"].map((x) => x))
              : [],
          status: json["status"] != null ? json["status"] as String : '',
          superAdmin: json["superAdmin"] ?? false,
          tenantId: json["tenantId"] != null ? json["tenantId"] as String : '',
          territory: json["territory"] != null
              ? List<String>.from(json["territory"].map((x) => x))
              : [],
          updatedBy:
              json["updatedBy"] != null ? json["updatedBy"] as String : '',
          updatedTimestamp: json["updatedTimestamp"] != null
              ? DateTime.fromMillisecondsSinceEpoch(json["updatedTimestamp"])
              : DateTime.now(),
          uuid: json["uuid"] != null ? json["uuid"] as String : '',
          growthStageName: json['cropStage'] != null
              ? StoreHelper.getGrowthStage(json['cropStage'])
              : "");
    }
  }

  Map<String, dynamic> toJson() => {
        "advisory": advisory,
        "advisoryTag": advisoryTag,
        "advisoryTagName": advisoryTagName,
        "agronomyManager": agronomyManager,
        "createdBy": createdBy,
        "createdTimestamp": createdTimestamp.toIso8601String(),
        "crop": crop,
        "farmerGroups": List<dynamic>.from(farmerGroups.map((x) => x)),
        "firstName": firstName,
        "growthStage": growthStage,
        "lastName": lastName,
        "photos": List<dynamic>.from(photos.map((x) => x.toJson())),
        "productRecommendation": productRecommendation,
        "profileImage": profileImage,
        "regions": List<dynamic>.from(regions.map((x) => x)),
        "status": status,
        "superAdmin": superAdmin,
        "tenantId": tenantId,
        "territory": List<dynamic>.from(territory.map((x) => x)),
        "updatedBy": updatedBy,
        "updatedTimestamp": updatedTimestamp.toIso8601String(),
        "uuid": uuid,
      };
}
