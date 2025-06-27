import 'dart:convert';

import 'package:farmsanta_new/Models/Common/photo_model.dart';

List<CropDto> cropDtoFromJson(String str) =>
    List<CropDto>.from(json.decode(str).map((x) => CropDto.fromJson(x)));

String cropDtoToJson(List<CropDto> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CropDto {
  String? createdBy;
  DateTime? createdTimestamp;
  String? cropDivision;
  String? cropGroup;
  String? cropName;
  int? fertilizerType;
  int? noOfCultivars;
  List<Photo>? photos;
  List<String>? regions;
  String? status;
  String? tenantId;
  List<String>? territories;
  List<Translation>? translation;
  String? updatedBy;
  DateTime? updatedTimestamp;
  String? uuid;

  CropDto({
    this.createdBy,
    this.createdTimestamp,
    this.cropDivision,
    this.cropGroup,
    this.cropName,
    this.fertilizerType,
    this.noOfCultivars,
    this.photos,
    this.regions,
    this.status,
    this.tenantId,
    this.territories,
    this.translation,
    this.updatedBy,
    this.updatedTimestamp,
    this.uuid,
  });

  factory CropDto.fromJson(Map<String, dynamic> json) {
    try {
      return CropDto(
        createdBy:
            json["createdBy"] != null ? json["createdBy"] as String : null,
        createdTimestamp: json["createdTimestamp"] == null
            ? null
            : DateTime.parse(json["createdTimestamp"]),
        cropDivision: json["cropDivision"] != null
            ? json["cropDivision"] as String
            : null,
        cropGroup:
            json["cropGroup"] != null ? json["cropGroup"] as String : null,
        cropName: json["cropName"] != null ? json["cropName"] as String : null,
        fertilizerType: json["fertilizerType"] != null
            ? json["fertilizerType"].toInt()
            : null,
        noOfCultivars: json["noOfCultivars"] != null
            ? json["noOfCultivars"].toInt()
            : null,
        photos: json["photos"] == null
            ? null
            : List<Photo>.from(json["photos"]!.map((x) => Photo.fromJson(x))),
        regions: json["regions"] == null
            ? null
            : List<String>.from(json["regions"]!.map((x) => x)),
        status: json["status"] != null ? json["status"] as String : null,
        tenantId: json["tenantId"] != null ? json["tenantId"] as String : null,
        territories: json["territories"] == null
            ? null
            : List<String>.from(json["territories"]!.map((x) => x)),
        translation: json["translation"] == null
            ? null
            : List<Translation>.from(
                json["translation"]!.map((x) => Translation.fromJson(x))),
        updatedBy:
            json["updatedBy"] != null ? json["updatedBy"] as String : null,
        updatedTimestamp: json["updatedTimestamp"] == null
            ? null
            : DateTime.parse(json["updatedTimestamp"]),
        uuid: json["uuid"] != null ? json["uuid"] as String : null,
      );
    } catch (e) {
      return CropDto(
        createdBy:
            json["createdBy"] != null ? json["createdBy"] as String : null,
        createdTimestamp: json["createdTimestamp"] == null
            ? null
            : DateTime.fromMillisecondsSinceEpoch(json["createdTimestamp"]),
        cropDivision: json["cropDivision"] != null
            ? json["cropDivision"] as String
            : null,
        cropGroup:
            json["cropGroup"] != null ? json["cropGroup"] as String : null,
        cropName: json["cropName"] != null ? json["cropName"] as String : null,
        fertilizerType: json["fertilizerType"] != null
            ? json["fertilizerType"].toInt()
            : null,
        noOfCultivars: json["noOfCultivars"] != null
            ? json["noOfCultivars"].toInt()
            : null,
        photos: json["photos"] == null
            ? null
            : List<Photo>.from(json["photos"]!.map((x) => Photo.fromJson(x))),
        regions: json["regions"] == null
            ? null
            : List<String>.from(json["regions"]!.map((x) => x)),
        status: json["status"] != null ? json["status"] as String : null,
        tenantId: json["tenantId"] != null ? json["tenantId"] as String : null,
        territories: json["territories"] == null
            ? null
            : List<String>.from(json["territories"]!.map((x) => x)),
        translation: json["translation"] == null
            ? null
            : List<Translation>.from(
                json["translation"]!.map((x) => Translation.fromJson(x))),
        updatedBy:
            json["updatedBy"] != null ? json["updatedBy"] as String : null,
        updatedTimestamp: json["updatedTimestamp"] == null
            ? null
            : DateTime.fromMillisecondsSinceEpoch(json["updatedTimestamp"]),
        uuid: json["uuid"] != null ? json["uuid"] as String : null,
      );
    }
  }

  Map<String, dynamic> toJson() => {
        "createdBy": createdBy,
        "createdTimestamp": createdTimestamp?.toIso8601String(),
        "cropDivision": cropDivision,
        "cropGroup": cropGroup,
        "cropName": cropName,
        "fertilizerType": fertilizerType,
        "noOfCultivars": noOfCultivars,
        "photos": photos == null
            ? []
            : List<dynamic>.from(photos!.map((x) => x.toJson())),
        "regions":
            regions == null ? [] : List<dynamic>.from(regions!.map((x) => x)),
        "status": status,
        "tenantId": tenantId,
        "territories": territories == null
            ? []
            : List<dynamic>.from(territories!.map((x) => x)),
        "translation": translation == null
            ? []
            : List<dynamic>.from(translation!.map((x) => x.toJson())),
        "updatedBy": updatedBy,
        "updatedTimestamp": updatedTimestamp?.toIso8601String(),
        "uuid": uuid,
      };
}

class Translation {
  int? id;
  int? languageId;
  String? masterId;
  String? translations;

  Translation({
    this.id,
    this.languageId,
    this.masterId,
    this.translations,
  });

  factory Translation.fromJson(Map<String, dynamic> json) => Translation(
        id: json["id"] != null ? json["id"].toInt() : null,
        languageId:
            json["languageId"] != null ? json["languageId"].toInt() : null,
        masterId: json["masterId"] != null ? json["masterId"] as String : null,
        translations: json["translations"] != null
            ? json["translations"] as String
            : null,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "languageId": languageId,
        "masterId": masterId,
        "translations": translations,
      };
}
