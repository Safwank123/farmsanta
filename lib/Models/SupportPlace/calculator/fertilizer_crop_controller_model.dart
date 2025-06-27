import 'dart:convert';

List<FertilizerCropDto> cropselectFromJson(String str) =>
    List<FertilizerCropDto>.from(
        json.decode(str).map((x) => FertilizerCropDto.fromJson(x)));

String cropselectToJson(List<FertilizerCropDto> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FertilizerCropDto {
  String? uuid;
  String? createdBy;
  String? updatedBy;
  DateTime? createdTimestamp;
  DateTime? updatedTimestamp;
  String? tenantId;
  String? cropName;
  List<String>? territories;
  String? cropType;
  Status? status;
  List<FertilizerCropTranslation>? translation;

  FertilizerCropDto({
    this.uuid,
    this.createdBy,
    this.updatedBy,
    this.createdTimestamp,
    this.updatedTimestamp,
    this.tenantId,
    this.cropName,
    this.territories,
    this.cropType,
    this.status,
    this.translation,
  });

  factory FertilizerCropDto.fromJson(Map<String, dynamic> json) {
    try {
      return FertilizerCropDto(
        uuid: json["uuid"] != null ? json["uuid"] as String : null,
        createdBy:
            json["createdBy"] != null ? json["createdBy"] as String : null,
        updatedBy:
            json["updatedBy"] != null ? json["updatedBy"] as String : null,
        createdTimestamp: json["createdTimestamp"] == null
            ? null
            : DateTime.parse(json["createdTimestamp"]),
        updatedTimestamp: json["updatedTimestamp"] == null
            ? null
            : DateTime.parse(json["updatedTimestamp"]),
        tenantId: json["tenantId"] != null ? json["tenantId"] as String : null,
        cropName: json["cropName"] != null ? json["cropName"] as String : null,
        territories: json["territories"] == null
            ? null
            : List<String>.from(json["territories"]!.map((x) => x)),
        cropType: json["cropType"] != null ? json["cropType"] as String : null,
        status:
            json["status"] != null ? statusValues.map[json["status"]]! : null,
        translation: json["translation"] != null
            ? List<FertilizerCropTranslation>.from(
                json["translation"]!.map((x) => x))
            : null,
      );
    } catch (e) {
      return FertilizerCropDto(
        uuid: json["uuid"] != null ? json["uuid"] as String : null,
        createdBy:
            json["createdBy"] != null ? json["createdBy"] as String : null,
        updatedBy:
            json["updatedBy"] != null ? json["updatedBy"] as String : null,
        createdTimestamp: json["createdTimestamp"] == null
            ? null
            : DateTime.fromMillisecondsSinceEpoch(json["createdTimestamp"]),
        updatedTimestamp: json["updatedTimestamp"] == null
            ? null
            : DateTime.fromMillisecondsSinceEpoch(json["updatedTimestamp"]),
        tenantId: json["tenantId"] != null ? json["tenantId"] as String : null,
        cropName: json["cropName"] != null ? json["cropName"] as String : null,
        territories: json["territories"] == null
            ? null
            : List<String>.from(json["territories"]!.map((x) => x)),
        cropType: json["cropType"] != null ? json["cropType"] as String : null,
        status:
            json["status"] != null ? statusValues.map[json["status"]]! : null,
        translation: json["translation"] != null
            ? List<FertilizerCropTranslation>.from(
                json["translation"]!.map((x) => x))
            : null,
      );
    }
  }

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "createdBy": createdBy,
        "updatedBy": updatedBy,
        "createdTimestamp": createdTimestamp?.toIso8601String(),
        "updatedTimestamp": updatedTimestamp?.toIso8601String(),
        "tenantId": tenantId,
        "cropName": cropName,
        "territories": territories == null
            ? []
            : List<dynamic>.from(territories!.map((x) => x)),
        "cropType": cropType,
        "status": statusValues.reverse[status],
        "translation": translation,
      };
}

List<FertilizerCropTranslation> fertilizerCropTranslationFromJson(String str) =>
    List<FertilizerCropTranslation>.from(
        json.decode(str).map((x) => FertilizerCropTranslation.fromJson(x)));

String fertilizerCropTranslationToJson(List<FertilizerCropTranslation> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FertilizerCropTranslation {
  int? id;
  int? languageId;
  String? masterId;
  String? translations;

  FertilizerCropTranslation({
    this.id,
    this.languageId,
    this.masterId,
    this.translations,
  });

  factory FertilizerCropTranslation.fromJson(Map<String, dynamic> json) =>
      FertilizerCropTranslation(
        id: json["id"],
        languageId: json["languageId"],
        masterId: json["masterId"],
        translations: json["translations"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "languageId": languageId,
        "masterId": masterId,
        "translations": translations,
      };
}

enum Status { ACTIVE }

final statusValues = EnumValues({"active": Status.ACTIVE});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
