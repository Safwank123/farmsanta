// To parse this JSON data, do
//
//     final popSectionModel = popSectionModelFromJson(jsonString);

import 'dart:convert';


import 'package:farmsanta_new/Models/Common/photo_model.dart';

import '../Cultivar/Cultivar.dart';
import 'ClimateDto.dart';
import 'CropNutrition.dart';
import 'CroppingProcessDto.dart';
import 'DeficuencyDto.dart';
import '../Disease/Disease.dart';
import 'Insect.dart';
import 'Predator.dart';
import 'SeedTreatment.dart';
import 'TrapCrop.dart';

PopSectionModel popSectionModelFromJson(String str) =>
    PopSectionModel.fromJson(json.decode(str));

String popSectionModelToJson(PopSectionModel data) =>
    json.encode(data.toJson());

class PopSectionModel {
  bool agronomyManager;
  List<ClimateDto> climateDtos;
  List<CropNutrition> cropNutritions;
  CroppingProcessDto? croppingProcessDto;
  List<Cultivar> cultivars;
  List<DeficiencyDto> deficiencyDto;
  List<Disease> diseases;
  String firstName;
  List<Insect> fungicides;
  String harvestingDescription;
  List<Insect> insecticides;
  List<Disease> insects;
  String lastName;
  PopDetails? popDetails;
  String postHarvestingDescription;
  List<Predator> predators;
  String profileImage;
  List<SeedTreatment> seedTreatments;
  bool superAdmin;
  List<TrapCrop> trapCrops;
  List<Insect> weedicides;
  List<Disease> weeds;

  PopSectionModel({
    required this.agronomyManager,
    required this.climateDtos,
    required this.cropNutritions,
    required this.croppingProcessDto,
    required this.cultivars,
    required this.deficiencyDto,
    required this.diseases,
    required this.firstName,
    required this.fungicides,
    required this.harvestingDescription,
    required this.insecticides,
    required this.insects,
    required this.lastName,
    required this.popDetails,
    required this.postHarvestingDescription,
    required this.predators,
    required this.profileImage,
    required this.seedTreatments,
    required this.superAdmin,
    required this.trapCrops,
    required this.weedicides,
    required this.weeds,
  });
  factory PopSectionModel.fromJson(Map<String, dynamic> json) =>
      PopSectionModel(
        agronomyManager:
            json['agronomyManager'] ?? false,
        climateDtos: json['climateDtos'] != null
            ? List<ClimateDto>.from(
                json['climateDtos'].map((x) => ClimateDto.fromJson(x)))
            : [],
        cropNutritions: json['cropNutritions'] != null
            ? List<CropNutrition>.from(
                json['cropNutritions'].map((x) => CropNutrition.fromJson(x)))
            : [],
        croppingProcessDto: json['croppingProcessDto'] != null
            ? CroppingProcessDto.fromJson(json['croppingProcessDto'])
            : null,
        cultivars: json['cultivars'] != null
            ? List<Cultivar>.from(
                json['cultivars'].map((x) => Cultivar.fromJson(x)))
            : [],
        deficiencyDto: json['deficiencyDto'] != null
            ? List<DeficiencyDto>.from(
                json['deficiencyDto'].map((x) => DeficiencyDto.fromJson(x)))
            : [],
        diseases: json['diseases'] != null
            ? List<Disease>.from(
                json['diseases'].map((x) => Disease.fromJson(x)))
            : [],
        firstName: json['firstName'] != null ? json['firstName'] as String : '',
        fungicides: json['fungicides'] != null
            ? List<Insect>.from(
                json['fungicides'].map((x) => Insect.fromJson(x)))
            : [],
        harvestingDescription: json['harvestingDescription'] != null
            ? json['harvestingDescription'] as String
            : '',
        insecticides: json['insecticides'] != null
            ? List<Insect>.from(
                json['insecticides'].map((x) => Insect.fromJson(x)))
            : [],
        insects: json['insects'] != null
            ? List<Disease>.from(
                json['insects'].map((x) => Disease.fromJson(x)))
            : [],
        lastName: json['lastName'] != null ? json['lastName'] as String : '',
        popDetails: json['popDetails'] != null
            ? PopDetails.fromJson(json['popDetails'])
            : null,
        postHarvestingDescription: json['postHarvestingDescription'] != null
            ? json['postHarvestingDescription'] as String
            : '',
        predators: json['predators'] != null
            ? List<Predator>.from(
                json['predators'].map((x) => Predator.fromJson(x)))
            : [],
        profileImage:
            json['profileImage'] != null ? json['profileImage'] as String : '',
        seedTreatments: json['seedTreatments'] != null
            ? List<SeedTreatment>.from(
                json['seedTreatments'].map((x) => SeedTreatment.fromJson(x)))
            : [],
        superAdmin: json['superAdmin'] ?? false,
        trapCrops: json['trapCrops'] != null
            ? List<TrapCrop>.from(
                json['trapCrops'].map((x) => TrapCrop.fromJson(x)))
            : [],
        weedicides: json['weedicides'] != null
            ? List<Insect>.from(
                json['weedicides'].map((x) => Insect.fromJson(x)))
            : [],
        weeds: json['weeds'] != null
            ? List<Disease>.from(json['weeds'].map((x) => Disease.fromJson(x)))
            : [],
      );

  Map<String, dynamic> toJson() => {
        "agronomyManager": agronomyManager,
        "climateDtos": List<dynamic>.from(climateDtos.map((x) => x.toJson())),
        "cropNutritions":
            List<dynamic>.from(cropNutritions.map((x) => x.toJson())),
        "croppingProcessDto": croppingProcessDto!.toJson(),
        "cultivars": List<dynamic>.from(cultivars.map((x) => x.toJson())),
        "deficiencyDto":
            List<dynamic>.from(deficiencyDto.map((x) => x.toJson())),
        "diseases": List<dynamic>.from(diseases.map((x) => x.toJson())),
        "firstName": firstName,
        "fungicides": List<dynamic>.from(fungicides.map((x) => x.toJson())),
        "harvestingDescription": harvestingDescription,
        "insecticides": List<dynamic>.from(insecticides.map((x) => x.toJson())),
        "insects": List<dynamic>.from(insects.map((x) => x.toJson())),
        "lastName": lastName,
        "popDetails": popDetails!.toJson(),
        "postHarvestingDescription": postHarvestingDescription,
        "predators": List<dynamic>.from(predators.map((x) => x.toJson())),
        "profileImage": profileImage,
        "seedTreatments":
            List<dynamic>.from(seedTreatments.map((x) => x.toJson())),
        "superAdmin": superAdmin,
        "trapCrops": List<dynamic>.from(trapCrops.map((x) => x.toJson())),
        "weedicides": List<dynamic>.from(weedicides.map((x) => x.toJson())),
        "weeds": List<dynamic>.from(weeds.map((x) => x.toJson())),
      };
}

class PreHarvestInterval {
  String uom;
  int value;

  PreHarvestInterval({
    required this.uom,
    required this.value,
  });

  factory PreHarvestInterval.fromJson(Map<String, dynamic> json) =>
      PreHarvestInterval(
        uom: json["uom"] != null ? json["uom"] as String : '',
        value: json["value"] != null ? json["value"].toInt() : 0,
      );

  Map<String, dynamic> toJson() => {
        "uom": uom,
        "value": value,
      };
}

class PopDetails {
  String approvalAssignBy;
  String author;
  String content;
  String createdBy;
  DateTime createdTimestamp;
  String crop;
  List<String> cultivarGroups;
  List<String> cultivars;
  int languageId;
  List<Photo> photos;
  List<String> regions;
  String status;
  List<String> tags;
  String tenantId;
  List<String> territories;
  String title;
  String updatedBy;
  DateTime updatedTimestamp;
  String uuid;

  PopDetails({
    required this.approvalAssignBy,
    required this.author,
    required this.content,
    required this.createdBy,
    required this.createdTimestamp,
    required this.crop,
    required this.cultivarGroups,
    required this.cultivars,
    required this.languageId,
    required this.photos,
    required this.regions,
    required this.status,
    required this.tags,
    required this.tenantId,
    required this.territories,
    required this.title,
    required this.updatedBy,
    required this.updatedTimestamp,
    required this.uuid,
  });

  factory PopDetails.fromJson(Map<String, dynamic> json) {
    try {
      return PopDetails(
        approvalAssignBy: json['approvalAssignBy'] != null
            ? json['approvalAssignBy'] as String
            : '',
        author: json['author'] != null ? json['author'] as String : '',
        content: json['content'] != null ? json['content'] as String : '',
        createdBy: json['createdBy'] != null ? json['createdBy'] as String : '',
        createdTimestamp: json['createdTimestamp'] != null
            ? DateTime.parse(json['createdTimestamp'])
            : DateTime.now(),
        crop: json['crop'] != null ? json['crop'] as String : '',
        cultivarGroups: json['cultivarGroups'] != null
            ? List<String>.from(json['cultivarGroups'].map((x) => x))
            : [],
        cultivars: json['cultivars'] != null
            ? List<String>.from(json['cultivars'].map((x) => x))
            : [],
        languageId: json['languageId'] != null ? json['languageId'].toInt() : 0,
        photos: json['photos'] != null
            ? List<Photo>.from(json['photos'].map((x) => Photo.fromJson(x)))
            : [],
        regions: json['regions'] != null
            ? List<String>.from(json['regions'].map((x) => x))
            : [],
        status: json['status'] != null ? json['status'] as String : '',
        tags: json['tags'] != null
            ? List<String>.from(json['tags'].map((x) => x))
            : [],
        tenantId: json['tenantId'] != null ? json['tenantId'] as String : '',
        territories: json['territories'] != null
            ? List<String>.from(json['territories'].map((x) => x))
            : [],
        title: json['title'] != null ? json['title'] as String : '',
        updatedBy: json['updatedBy'] != null ? json['updatedBy'] as String : '',
        updatedTimestamp: json['updatedTimestamp'] != null
            ? DateTime.parse(json['updatedTimestamp'])
            : DateTime.now(),
        uuid: json['uuid'] != null ? json['uuid'] as String : '',
      );
    } catch (e) {
      return PopDetails(
        approvalAssignBy: json['approvalAssignBy'] != null
            ? json['approvalAssignBy'] as String
            : '',
        author: json['author'] != null ? json['author'] as String : '',
        content: json['content'] != null ? json['content'] as String : '',
        createdBy: json['createdBy'] != null ? json['createdBy'] as String : '',
        createdTimestamp: json['createdTimestamp'] != null
            ? DateTime.fromMillisecondsSinceEpoch(json['createdTimestamp'])
            : DateTime.now(),
        crop: json['crop'] != null ? json['crop'] as String : '',
        cultivarGroups: json['cultivarGroups'] != null
            ? List<String>.from(json['cultivarGroups'].map((x) => x))
            : [],
        cultivars: json['cultivars'] != null
            ? List<String>.from(json['cultivars'].map((x) => x))
            : [],
        languageId: json['languageId'] != null ? json['languageId'].toInt() : 0,
        photos: json['photos'] != null
            ? List<Photo>.from(json['photos'].map((x) => Photo.fromJson(x)))
            : [],
        regions: json['regions'] != null
            ? List<String>.from(json['regions'].map((x) => x))
            : [],
        status: json['status'] != null ? json['status'] as String : '',
        tags: json['tags'] != null
            ? List<String>.from(json['tags'].map((x) => x))
            : [],
        tenantId: json['tenantId'] != null ? json['tenantId'] as String : '',
        territories: json['territories'] != null
            ? List<String>.from(json['territories'].map((x) => x))
            : [],
        title: json['title'] != null ? json['title'] as String : '',
        updatedBy: json['updatedBy'] != null ? json['updatedBy'] as String : '',
        updatedTimestamp: json['updatedTimestamp'] != null
            ? DateTime.fromMillisecondsSinceEpoch(json['updatedTimestamp'])
            : DateTime.now(),
        uuid: json['uuid'] != null ? json['uuid'] as String : '',
      );
    }
  }

  Map<String, dynamic> toJson() => {
        "approvalAssignBy": approvalAssignBy,
        "author": author,
        "content": content,
        "createdBy": createdBy,
        "createdTimestamp": createdTimestamp.toIso8601String(),
        "crop": crop,
        "cultivarGroups": List<dynamic>.from(cultivarGroups.map((x) => x)),
        "cultivars": List<dynamic>.from(cultivars.map((x) => x)),
        "languageId": languageId,
        "photos": List<dynamic>.from(photos.map((x) => x.toJson())),
        "regions": List<dynamic>.from(regions.map((x) => x)),
        "status": status,
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "tenantId": tenantId,
        "territories": List<dynamic>.from(territories.map((x) => x)),
        "title": title,
        "updatedBy": updatedBy,
        "updatedTimestamp": updatedTimestamp.toIso8601String(),
        "uuid": uuid,
      };
}
