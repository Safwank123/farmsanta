import '../../Common/photo_model.dart';
import 'Dosage.dart';

class SeedTreatment {
  String applicationMethod;
  String createdBy;
  DateTime createdTimestamp;
  Dosage? dosage;
  String formulation;
  String modeOfAction;
  List<Photo> photos;
  String productLabel;
  List<String> productName;
  String productType;
  String tenantId;
  String toxicityLevel;
  String updatedBy;
  DateTime updatedTimestamp;
  String uuid;
  String waitingPeriod;
  Dosage? waterRequirement;

  SeedTreatment({
    required this.applicationMethod,
    required this.createdBy,
    required this.createdTimestamp,
    required this.dosage,
    required this.formulation,
    required this.modeOfAction,
    required this.photos,
    required this.productLabel,
    required this.productName,
    required this.productType,
    required this.tenantId,
    required this.toxicityLevel,
    required this.updatedBy,
    required this.updatedTimestamp,
    required this.uuid,
    required this.waitingPeriod,
    required this.waterRequirement,
  });

  factory SeedTreatment.fromJson(Map<String, dynamic> json) {
    try {
      return SeedTreatment(
        applicationMethod: json['applicationMethod'] != null
            ? json['applicationMethod'] as String
            : '',
        createdBy: json['createdBy'] != null ? json['createdBy'] as String : '',
        createdTimestamp: json['createdTimestamp'] != null
            ? DateTime.parse(json['createdTimestamp'])
            : DateTime.now(),
        dosage: json['dosage'] != null ? Dosage.fromJson(json['dosage']) : null,
        formulation:
            json['formulation'] != null ? json['formulation'] as String : '',
        modeOfAction:
            json['modeOfAction'] != null ? json['modeOfAction'] as String : '',
        photos: json['photos'] != null
            ? List<Photo>.from(json['photos'].map((x) => Photo.fromJson(x)))
            : [],
        productLabel:
            json['productLabel'] != null ? json['productLabel'] as String : '',
        productName: json['productName'] != null
            ? List<String>.from(json['productName'].map((x) => x))
            : [],
        productType:
            json['productType'] != null ? json['productType'] as String : '',
        tenantId: json['tenantId'] != null ? json['tenantId'] as String : '',
        toxicityLevel: json['toxicityLevel'] != null
            ? json['toxicityLevel'] as String
            : '',
        updatedBy: json['updatedBy'] != null ? json['updatedBy'] as String : '',
        updatedTimestamp: json['updatedTimestamp'] != null
            ? DateTime.parse(json['updatedTimestamp'])
            : DateTime.now(),
        uuid: json['uuid'] != null ? json['uuid'] as String : '',
        waitingPeriod: json['waitingPeriod'] != null
            ? json['waitingPeriod'] as String
            : '',
        waterRequirement: json['waterRequirement'] != null
            ? Dosage.fromJson(json['waterRequirement'])
            : null,
      );
    } catch (e) {
      return SeedTreatment(
        applicationMethod: json['applicationMethod'] != null
            ? json['applicationMethod'] as String
            : '',
        createdBy: json['createdBy'] != null ? json['createdBy'] as String : '',
        createdTimestamp: json['createdTimestamp'] != null
            ? DateTime.fromMillisecondsSinceEpoch(json['createdTimestamp'])
            : DateTime.now(),
        dosage: json['dosage'] != null ? Dosage.fromJson(json['dosage']) : null,
        formulation:
            json['formulation'] != null ? json['formulation'] as String : '',
        modeOfAction:
            json['modeOfAction'] != null ? json['modeOfAction'] as String : '',
        photos: json['photos'] != null
            ? List<Photo>.from(json['photos'].map((x) => Photo.fromJson(x)))
            : [],
        productLabel:
            json['productLabel'] != null ? json['productLabel'] as String : '',
        productName: json['productName'] != null
            ? List<String>.from(json['productName'].map((x) => x))
            : [],
        productType:
            json['productType'] != null ? json['productType'] as String : '',
        tenantId: json['tenantId'] != null ? json['tenantId'] as String : '',
        toxicityLevel: json['toxicityLevel'] != null
            ? json['toxicityLevel'] as String
            : '',
        updatedBy: json['updatedBy'] != null ? json['updatedBy'] as String : '',
        updatedTimestamp: json['updatedTimestamp'] != null
            ? DateTime.fromMillisecondsSinceEpoch(json['updatedTimestamp'])
            : DateTime.now(),
        uuid: json['uuid'] != null ? json['uuid'] as String : '',
        waitingPeriod: json['waitingPeriod'] != null
            ? json['waitingPeriod'] as String
            : '',
        waterRequirement: json['waterRequirement'] != null
            ? Dosage.fromJson(json['waterRequirement'])
            : null,
      );
    }
  }

  Map<String, dynamic> toJson() => {
        "applicationMethod": applicationMethod,
        "createdBy": createdBy,
        "createdTimestamp": createdTimestamp.toIso8601String(),
        "dosage": dosage!.toJson(),
        "formulation": formulation,
        "modeOfAction": modeOfAction,
        "photos": List<dynamic>.from(photos.map((x) => x.toJson())),
        "productLabel": productLabel,
        "productName": List<dynamic>.from(productName.map((x) => x)),
        "productType": productType,
        "tenantId": tenantId,
        "toxicityLevel": toxicityLevel,
        "updatedBy": updatedBy,
        "updatedTimestamp": updatedTimestamp.toIso8601String(),
        "uuid": uuid,
        "waitingPeriod": waitingPeriod,
        "waterRequirement": waterRequirement!.toJson(),
      };
}
