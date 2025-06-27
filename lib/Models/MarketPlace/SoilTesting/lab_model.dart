// To parse this JSON data, do
//
//     final labModel = labModelFromJson(jsonString);

import 'dart:convert';



import 'package:farmsanta_new/Models/MarketPlace/active_hours_model.dart';

import '../offer_model.dart';
import './review_model.dart';
import 'soil_sample_test_model.dart';

LabModel labModelFromJson(String str) => LabModel.fromJson(json.decode(str));

String labModelToJson(LabModel data) => json.encode(data.toJson());

class LabModel {
  String? uuid;
  String name;
  double rating;
  List<SoilTestingReviewModel> reviewModel;
  String image;
  double kmAway;
  String address;
  String contact;
  ActiveHoursModel? activeHours;
  String aboutUs;
  List<SoilSampleTestModel> soilSampleTestModel;
  List<OfferModel> offerModel;
  int reportingDays;

  LabModel({
    this.uuid,
    required this.name,
    required this.rating,
    required this.reviewModel,
    required this.image,
    required this.kmAway,
    required this.address,
    required this.contact,
    this.activeHours,
    required this.aboutUs,
    required this.soilSampleTestModel,
    required this.offerModel,
    required this.reportingDays,
  });

  factory LabModel.fromJson(Map<String, dynamic> json) => LabModel(
        uuid: json["uuid"],
        name: json["name"],
        rating: json["rating"]?.toDouble(),
        reviewModel: List<SoilTestingReviewModel>.from(
            json["reviewModel"].map((x) => SoilTestingReviewModel.fromJson(x))),
        image: json["image"],
        kmAway: json["kmAway"]?.toDouble(),
        address: json["Address"],
        contact: json["contact"],
        activeHours: json["activeHours"] == null
            ? null
            : ActiveHoursModel.fromJson(json["activeHours"]),
        aboutUs: json["aboutUs"],
        soilSampleTestModel: List<SoilSampleTestModel>.from(
            json["soilSampleTestModel"]
                .map((x) => SoilSampleTestModel.fromJson(x))),
        offerModel: List<OfferModel>.from(
            json["OfferModel"].map((x) => OfferModel.fromJson(x))),
        reportingDays: json["reportingDays"],
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "name": name,
        "rating": rating,
        "reviewModel": List<dynamic>.from(reviewModel.map((x) => x.toJson())),
        "image": image,
        "kmAway": kmAway,
        "Address": address,
        "contact": contact,
        "activeHours": activeHours?.toJson(),
        "aboutUs": aboutUs,
        "soilSampleTestModel":
            List<dynamic>.from(soilSampleTestModel.map((x) => x.toJson())),
        "OfferModel": List<dynamic>.from(offerModel.map((x) => x.toJson())),
        "reportingDays": reportingDays,
      };
}
