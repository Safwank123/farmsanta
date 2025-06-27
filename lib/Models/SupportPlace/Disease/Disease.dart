// ignore_for_file: prefer_null_aware_operators


import 'package:farmsanta_new/Services/store_helper.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../Common/photo_model.dart';
import '../POP/InsectLifeCycle.dart';

class Disease {
  String createdBy;
  DateTime createdTimestamp;
  List<String> crops;
  List<String> cultivarGroups;
  List<String> cultivars;
  String? culturalMechanicalControl;
  String favourableConditions;
  String localName;
  List<Photo> photos;
  String? preventiveMeasures;
  List<String> regions;
  String scientificName;
  String status;
  String? symptomsOfAttack;
  String tenantId;
  List<String> territories;
  String updatedBy;
  DateTime updatedTimestamp;
  String uuid;
  List<InsectLifeCycle>? insectLifeCycles;
  String? culturalControl;
  String? description;
  String? weedType;

  Disease({
    required this.createdBy,
    required this.createdTimestamp,
    required this.crops,
    required this.cultivarGroups,
    required this.cultivars,
    this.culturalMechanicalControl,
    required this.favourableConditions,
    required this.localName,
    required this.photos,
    this.preventiveMeasures,
    required this.regions,
    required this.scientificName,
    required this.status,
    this.symptomsOfAttack,
    required this.tenantId,
    required this.territories,
    required this.updatedBy,
    required this.updatedTimestamp,
    required this.uuid,
    this.insectLifeCycles,
    this.culturalControl,
    this.description,
    this.weedType,
  });

  factory Disease.fromJson(Map<String, dynamic> json) {
    try {
      return Disease(
        createdBy:
            json["createdBy"] != null ? json["createdBy"].toString() : '',
        createdTimestamp: json["createdTimestamp"] != null
            ? DateTime.parse(json["createdTimestamp"])
            : DateTime.now(),
        crops: json["crops"] != null
            ? List<String>.from(json["crops"].map((x) => StoreHelper.getCropName(x.toString())))
            : [],
        cultivarGroups: json["cultivarGroups"] != null
            ? List<String>.from(json["cultivarGroups"].map((x) => x.toString()))
            : [],
        cultivars: json["cultivars"] != null
            ? List<String>.from(json["cultivars"].map((x) => x.toString()))
            : [],
        culturalMechanicalControl: json["culturalMechanicalControl"] != null
            ? json["culturalMechanicalControl"].toString()
            : null,
        favourableConditions: json["favourableConditions"] != null
            ? json["favourableConditions"].toString()
            : '',
        localName:
            json["localName"] != null ? json["localName"].toString() : '',
        photos: json["photos"] != null
            ? List<Photo>.from(json["photos"].map((x) => Photo.fromJson(x)))
            : [],
        preventiveMeasures: json["preventiveMeasures"] != null
            ? json["preventiveMeasures"].toString()
            : null,
        regions: json["regions"] != null
            ? List<String>.from(json["regions"].map((x) => x.toString()))
            : [],
        scientificName: json["scientificName"] != null
            ? json["scientificName"].toString()
            : '',
        status: json["status"] != null ? json["status"].toString() : '',
        symptomsOfAttack: json["symptomsOfAttack"] != null
            ? json["symptomsOfAttack"].toString()
            : null,
        tenantId: json["tenantId"] != null ? json["tenantId"].toString() : '',
        territories: json["territories"] != null
            ? List<String>.from(json["territories"].map((x) => x.toString()))
            : [],
        updatedBy:
            json["updatedBy"] != null ? json["updatedBy"].toString() : '',
        updatedTimestamp: json["updatedTimestamp"] != null
            ? DateTime.parse(json["updatedTimestamp"])
            : DateTime.now(),
        uuid: json["uuid"] != null ? json["uuid"].toString() : '',
        insectLifeCycles: json["insectLifeCycles"] == null
            ? null
            : List<InsectLifeCycle>.from(json["insectLifeCycles"]!
                .map((x) => InsectLifeCycle.fromJson(x))),
        culturalControl: json["culturalControl"] != null
            ? json["culturalControl"].toString()
            : null,
        description:
            json["description"] != null ? json["description"].toString() : null,
        weedType: json["weedType"] != null ? json["weedType"].toString() : null,
      );
    } catch (e) {
      return Disease(
        createdBy:
            json["createdBy"] != null ? json["createdBy"].toString() : '',
        createdTimestamp: json["createdTimestamp"] != null
            ? DateTime.fromMillisecondsSinceEpoch(json["createdTimestamp"])
            : DateTime.now(),
        crops: json["crops"] != null
            ? List<String>.from(json["crops"].map((x) => StoreHelper.getCropName(x.toString())))
            : [],
        cultivarGroups: json["cultivarGroups"] != null
            ? List<String>.from(json["cultivarGroups"].map((x) => x))
            : [],
        cultivars: json["cultivars"] != null
            ? List<String>.from(json["cultivars"].map((x) => x))
            : [],
        culturalMechanicalControl: json["culturalMechanicalControl"] != null
            ? json["culturalMechanicalControl"].toString()
            : null,
        favourableConditions: json["favourableConditions"] != null
            ? json["favourableConditions"].toString()
            : '',
        localName:
            json["localName"] != null ? json["localName"].toString() : '',
        photos: json["photos"] != null
            ? List<Photo>.from(json["photos"].map((x) => Photo.fromJson(x)))
            : [],
        preventiveMeasures: json["preventiveMeasures"] != null
            ? json["preventiveMeasures"].toString()
            : null,
        regions: json["regions"] != null
            ? List<String>.from(json["regions"].map((x) => x))
            : [],
        scientificName: json["scientificName"] != null
            ? json["scientificName"].toString()
            : '',
        status: json["status"] != null ? json["status"].toString() : '',
        symptomsOfAttack: json["symptomsOfAttack"] != null
            ? json["symptomsOfAttack"].toString()
            : null,
        tenantId: json["tenantId"] != null ? json["tenantId"].toString() : '',
        territories: json["territories"] != null
            ? List<String>.from(json["territories"].map((x) => x))
            : [],
        updatedBy:
            json["updatedBy"] != null ? json["updatedBy"].toString() : '',
        updatedTimestamp: json["updatedTimestamp"] != null
            ? DateTime.fromMillisecondsSinceEpoch(json["updatedTimestamp"])
            : DateTime.now(),
        uuid: json["uuid"] != null ? json["uuid"].toString() : '',
        insectLifeCycles: json["insectLifeCycles"] == null
            ? null
            : List<InsectLifeCycle>.from(json["insectLifeCycles"]!
                .map((x) => InsectLifeCycle.fromJson(x))),
        culturalControl: json["culturalControl"] != null
            ? json["culturalControl"].toString()
            : null,
        description:
            json["description"] != null ? json["description"].toString() : null,
        weedType: json["weedType"] != null ? json["weedType"].toString() : null,
      );
    }
  }

  Map<String, dynamic> toJson() => {
        "createdBy": createdBy,
        "createdTimestamp": createdTimestamp.toIso8601String(),
        "crops": List<dynamic>.from(crops.map((x) => x)),
        "cultivarGroups": List<dynamic>.from(cultivarGroups.map((x) => x)),
        "cultivars": List<dynamic>.from(cultivars.map((x) => x)),
        "culturalMechanicalControl": culturalMechanicalControl,
        "favourableConditions": favourableConditions,
        "localName": localName,
        "photos": List<dynamic>.from(photos.map((x) => x.toJson())),
        "preventiveMeasures": preventiveMeasures,
        "regions": List<dynamic>.from(regions.map((x) => x)),
        "scientificName": scientificName,
        "status": status,
        "symptomsOfAttack": symptomsOfAttack,
        "tenantId": tenantId,
        "territories": List<dynamic>.from(territories.map((x) => x)),
        "updatedBy": updatedBy,
        "updatedTimestamp": updatedTimestamp.toIso8601String(),
        "uuid": uuid,
        "insectLifeCycles": insectLifeCycles == null
            ? []
            : List<dynamic>.from(insectLifeCycles!.map((x) => x.toJson())),
        "culturalControl": culturalControl,
        "description": description,
        "weedType": weedType,
      };
}
