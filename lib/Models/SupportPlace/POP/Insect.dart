import '../../Common/photo_model.dart';
import '../farmscout/dosage.dart';
import './Molecule.dart';
import './PopDto.dart';

class Insect {
  String applicationMethod;
  String createdBy;
  DateTime createdTimestamp;
  List<String> crops;
  List<String> cultivarGroups;
  List<String> cultivars;
  List<String>? diseases;
  Dosage? dosage;
  String dosageMethod;
  String formulation;
  String formulationType;
  String modeOfAction;
  List<Molecule> molecule;
  List<Photo> photos;
  PreHarvestInterval? preHarvestInterval;
  List<String> productName;
  String productType;
  List<String> regions;
  String status;
  String tenantId;
  List<String> territories;
  String toxicityLevel;
  String updatedBy;
  DateTime updatedTimestamp;
  String uuid;
  Dosage? waterRequirement;
  List<String>? insects;
  String? weedicideCategory;
  String? weedicideType;
  List<String>? weeds;

  Insect({
    required this.applicationMethod,
    required this.createdBy,
    required this.createdTimestamp,
    required this.crops,
    required this.cultivarGroups,
    required this.cultivars,
    this.diseases,
    required this.dosage,
    required this.dosageMethod,
    required this.formulation,
    required this.formulationType,
    required this.modeOfAction,
    required this.molecule,
    required this.photos,
    required this.preHarvestInterval,
    required this.productName,
    required this.productType,
    required this.regions,
    required this.status,
    required this.tenantId,
    required this.territories,
    required this.toxicityLevel,
    required this.updatedBy,
    required this.updatedTimestamp,
    required this.uuid,
    required this.waterRequirement,
    this.insects,
    this.weedicideCategory,
    this.weedicideType,
    this.weeds,
  });

  factory Insect.fromJson(Map<String, dynamic> json) {
    try {
      return Insect(
        applicationMethod: json["applicationMethod"] != null
            ? json["applicationMethod"] as String
            : '',
        createdBy: json["createdBy"] != null ? json["createdBy"] as String : '',
        createdTimestamp: json["createdTimestamp"] != null
            ? DateTime.parse(json["createdTimestamp"])
            : DateTime.now(),
        crops: json["crops"] != null
            ? List<String>.from(json["crops"].map((x) => x))
            : [],
        cultivarGroups: json["cultivarGroups"] != null
            ? List<String>.from(json["cultivarGroups"].map((x) => x))
            : [],
        cultivars: json["cultivars"] != null
            ? List<String>.from(json["cultivars"].map((x) => x))
            : [],
        diseases: json["diseases"] == null
            ? null
            : List<String>.from(json["diseases"]!.map((x) => x)),
        dosage: json["dosage"] != null ? Dosage.fromJson(json["dosage"]) : null,
        dosageMethod:
            json["dosageMethod"] != null ? json["dosageMethod"] as String : '',
        formulation:
            json["formulation"] != null ? json["formulation"] as String : '',
        formulationType: json["formulationType"] != null
            ? json["formulationType"] as String
            : '',
        modeOfAction:
            json["modeOfAction"] != null ? json["modeOfAction"] as String : '',
        molecule: json["molecule"] != null
            ? List<Molecule>.from(
                json["molecule"].map((x) => Molecule.fromJson(x)))
            : [],
        photos: json["photos"] != null
            ? List<Photo>.from(json["photos"].map((x) => Photo.fromJson(x)))
            : [],
        preHarvestInterval: json["preHarvestInterval"] != null
            ? PreHarvestInterval.fromJson(json["preHarvestInterval"])
            : null,
        productName: json["productName"] != null
            ? List<String>.from(json["productName"].map((x) => x))
            : [],
        productType:
            json["productType"] != null ? json["productType"] as String : '',
        regions: json["regions"] != null
            ? List<String>.from(json["regions"].map((x) => x))
            : [],
        status: json["status"] != null ? json["status"] as String : '',
        tenantId: json["tenantId"] != null ? json["tenantId"] as String : '',
        territories: json["territories"] != null
            ? List<String>.from(json["territories"].map((x) => x))
            : [],
        toxicityLevel: json["toxicityLevel"] != null
            ? json["toxicityLevel"] as String
            : '',
        updatedBy: json["updatedBy"] != null ? json["updatedBy"] as String : '',
        updatedTimestamp: json["updatedTimestamp"] != null
            ? DateTime.parse(json["updatedTimestamp"])
            : DateTime.now(),
        uuid: json["uuid"] != null ? json["uuid"] as String : '',
        waterRequirement: json["waterRequirement"] != null
            ? Dosage.fromJson(json["waterRequirement"])
            : null,
        insects: json["insects"] == null
            ? null
            : List<String>.from(json["insects"]!.map((x) => x)),
        weedicideCategory: json["weedicideCategory"] != null
            ? json["weedicideCategory"] as String
            : null,
        weedicideType: json["weedicideType"] != null
            ? json["weedicideType"] as String
            : null,
        weeds: json["weeds"] == null
            ? null
            : List<String>.from(json["weeds"]!.map((x) => x)),
      );
    } catch (e) {
      return Insect(
        applicationMethod: json["applicationMethod"] != null
            ? json["applicationMethod"] as String
            : '',
        createdBy: json["createdBy"] != null ? json["createdBy"] as String : '',
        createdTimestamp: json["createdTimestamp"] != null
            ? DateTime.fromMillisecondsSinceEpoch(json["createdTimestamp"])
            : DateTime.now(),
        crops: json["crops"] != null
            ? List<String>.from(json["crops"].map((x) => x))
            : [],
        cultivarGroups: json["cultivarGroups"] != null
            ? List<String>.from(json["cultivarGroups"].map((x) => x))
            : [],
        cultivars: json["cultivars"] != null
            ? List<String>.from(json["cultivars"].map((x) => x))
            : [],
        diseases: json["diseases"] == null
            ? null
            : List<String>.from(json["diseases"]!.map((x) => x)),
        dosage: json["dosage"] != null ? Dosage.fromJson(json["dosage"]) : null,
        dosageMethod:
            json["dosageMethod"] != null ? json["dosageMethod"] as String : '',
        formulation:
            json["formulation"] != null ? json["formulation"] as String : '',
        formulationType: json["formulationType"] != null
            ? json["formulationType"] as String
            : '',
        modeOfAction:
            json["modeOfAction"] != null ? json["modeOfAction"] as String : '',
        molecule: json["molecule"] != null
            ? List<Molecule>.from(
                json["molecule"].map((x) => Molecule.fromJson(x)))
            : [],
        photos: json["photos"] != null
            ? List<Photo>.from(json["photos"].map((x) => Photo.fromJson(x)))
            : [],
        preHarvestInterval: json["preHarvestInterval"] != null
            ? PreHarvestInterval.fromJson(json["preHarvestInterval"])
            : null,
        productName: json["productName"] != null
            ? List<String>.from(json["productName"].map((x) => x))
            : [],
        productType:
            json["productType"] != null ? json["productType"] as String : '',
        regions: json["regions"] != null
            ? List<String>.from(json["regions"].map((x) => x))
            : [],
        status: json["status"] != null ? json["status"] as String : '',
        tenantId: json["tenantId"] != null ? json["tenantId"] as String : '',
        territories: json["territories"] != null
            ? List<String>.from(json["territories"].map((x) => x))
            : [],
        toxicityLevel: json["toxicityLevel"] != null
            ? json["toxicityLevel"] as String
            : '',
        updatedBy: json["updatedBy"] != null ? json["updatedBy"] as String : '',
        updatedTimestamp: json["updatedTimestamp"] != null
            ? DateTime.fromMillisecondsSinceEpoch(json["updatedTimestamp"])
            : DateTime.now(),
        uuid: json["uuid"] != null ? json["uuid"] as String : '',
        waterRequirement: json["waterRequirement"] != null
            ? Dosage.fromJson(json["waterRequirement"])
            : null,
        insects: json["insects"] == null
            ? null
            : List<String>.from(json["insects"]!.map((x) => x)),
        weedicideCategory: json["weedicideCategory"] != null
            ? json["weedicideCategory"] as String
            : null,
        weedicideType: json["weedicideType"] != null
            ? json["weedicideType"] as String
            : null,
        weeds: json["weeds"] == null
            ? null
            : List<String>.from(json["weeds"]!.map((x) => x)),
      );
    }
  }

  Map<String, dynamic> toJson() => {
        "applicationMethod": applicationMethod,
        "createdBy": createdBy,
        "createdTimestamp": createdTimestamp.toIso8601String(),
        "crops": List<dynamic>.from(crops.map((x) => x)),
        "cultivarGroups": List<dynamic>.from(cultivarGroups.map((x) => x)),
        "cultivars": List<dynamic>.from(cultivars.map((x) => x)),
        "diseases":
            diseases == null ? [] : List<dynamic>.from(diseases!.map((x) => x)),
        "dosage": dosage!.toJson(),
        "dosageMethod": dosageMethod,
        "formulation": formulation,
        "formulationType": formulationType,
        "modeOfAction": modeOfAction,
        "molecule": List<dynamic>.from(molecule.map((x) => x.toJson())),
        "photos": List<dynamic>.from(photos.map((x) => x.toJson())),
        "preHarvestInterval": preHarvestInterval!.toJson(),
        "productName": List<dynamic>.from(productName.map((x) => x)),
        "productType": productType,
        "regions": List<dynamic>.from(regions.map((x) => x)),
        "status": status,
        "tenantId": tenantId,
        "territories": List<dynamic>.from(territories.map((x) => x)),
        "toxicityLevel": toxicityLevel,
        "updatedBy": updatedBy,
        "updatedTimestamp": updatedTimestamp.toIso8601String(),
        "uuid": uuid,
        "waterRequirement": waterRequirement!.toJson(),
        "insects":
            insects == null ? [] : List<dynamic>.from(insects!.map((x) => x)),
        "weedicideCategory": weedicideCategory,
        "weedicideType": weedicideType,
        "weeds": weeds == null ? [] : List<dynamic>.from(weeds!.map((x) => x)),
      };
}
