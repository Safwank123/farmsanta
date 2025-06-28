

import 'package:farmsanta_new/Services/store_helper.dart';

import 'weather.dart';
import 'scout_image.dart';

class FarmScouting {
  int? id;
  String? uuid;
  String? createdBy;
  String? updatedBy;
  String? createdTimestamp;
  String? updatedTimestamp;
  String? tenantId;
  String landId;
  String crop;
  String? cropStage;
  List<ScoutImage> images;
  String caption;
  Weather? currentWeather;
  String farmerId;
  bool advisoryExist;
  List<String>? region;
  List<String>? territory;
  String? cropName;
  String? growthStage;
  FarmScouting({
    this.id = -1,
    this.uuid,
    this.createdBy,
    this.updatedBy,
    this.createdTimestamp,
    this.updatedTimestamp,
    this.tenantId,
    required this.landId,
    required this.crop,
    this.cropStage,
    this.images = const [],
    required this.caption,
    required this.currentWeather,
    required this.farmerId,
    this.advisoryExist = false,
    this.region,
    this.territory,
    this.cropName,
    this.growthStage,
  });

  factory FarmScouting.fromJson(Map<String, dynamic> json) {
    return FarmScouting(
      id: json['id']?.toInt(),
      uuid: json['uuid'] != null ? json['uuid'] as String : null,
      createdBy: json['createdBy'] != null ? json['createdBy'] as String : null,
      updatedBy: json['updatedBy'] != null ? json['updatedBy'] as String : null,
      createdTimestamp: json['createdTimestamp'] != null
          ? json['createdTimestamp'] as String
          : null,
      updatedTimestamp: json['updatedTimestamp'] != null
          ? json['updatedTimestamp'] as String
          : null,
      tenantId: json['tenantId'] != null ? json['tenantId'] as String : null,
      landId: json['landId'] != null ? json['landId'] as String : '',
      crop: json['crop'] != null ? json['crop'] as String : '',
      cropStage: json['cropStage'] != null ? json['cropStage'] as String : null,
      images: json['images'] != null
          ? List<ScoutImage>.from(
              json['images'].map((x) => ScoutImage.fromJson(x)))
          : [],
      caption: json['caption'] != null ? json['caption'] as String : '',
      currentWeather: json['currentWeather'] != null
          ? Weather.fromJson(json['currentWeather'])
          : null,
      farmerId: json['farmerId'] != null ? json['farmerId'] as String : '',
      advisoryExist:
          json['advisoryExist'] ?? false,
      region: json['region'] != null ? List<String>.from(json['region']) : null,
      territory: json['territory'] != null
          ? List<String>.from(json['territory'])
          : null,

      cropName:json['crop'] != null ?StoreHelper.getCropName(json['crop'] ):"",
      growthStage:json['cropStage'] != null ?StoreHelper.getGrowthStage(json['cropStage'] ):""
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'uuid': uuid,
      'createdBy': createdBy,
      'updatedBy': updatedBy,
      'createdTimestamp': createdTimestamp,
      'updatedTimestamp': updatedTimestamp,
      'tenantId': tenantId,
      'landId': landId,
      'crop': crop,
      'cropStage': cropStage,
      'images': List<dynamic>.from(images.map((x) => x.toJson())),
      'caption': caption,
      'currentWeather': currentWeather!.toJson(),
      'farmerId': farmerId,
      'advisoryExist': advisoryExist,
      'region': region != null ? List<dynamic>.from(region!) : null,
      'territory': territory != null ? List<dynamic>.from(territory!) : null,
    };
  }
}
