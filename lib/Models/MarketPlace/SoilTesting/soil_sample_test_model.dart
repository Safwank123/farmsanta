import 'dart:convert';

import '../offer_model.dart';
import './review_model.dart';

SoilSampleTestModel soilSampleTestModelFromJson(String str) =>
    SoilSampleTestModel.fromJson(json.decode(str));

String soilSampleTestModelToJson(SoilSampleTestModel data) =>
    json.encode(data.toJson());

class SoilSampleTestModel {
  String testcontent;
  String testName;
  String testType;
  int reportingDays;
  List<SoilTestingReviewModel>? reviewModel;
  String image;
  OfferModel? offerModel;
  double amount;
  String? sampleUnit;
  String? uuid;

  SoilSampleTestModel({
    required this.testcontent,
    required this.testName,
    required this.testType,
    required this.reportingDays,
    this.reviewModel,
    required this.image,
    this.offerModel,
    required this.amount,
    this.sampleUnit,
    this.uuid,
  });

  factory SoilSampleTestModel.fromJson(Map<String, dynamic> json) =>
      SoilSampleTestModel(
        testcontent: json["testcontent"],
        testName: json["testName"],
        testType: json["testType"],
        reportingDays: json["reportingDays"],
        reviewModel: json["reviewModel"] == null
            ? []
            : List<SoilTestingReviewModel>.from(
                json["reviewModel"]!.map((x) => SoilTestingReviewModel.fromJson(x))),
        image: json["image"],
        offerModel: json["offerModel"] == null
            ? null
            : OfferModel.fromJson(json["offerModel"]),
        amount: json["amount"]?.toDouble(),
        sampleUnit: json["sampleUnit"],
        uuid: json["uuid"],
      );

  Map<String, dynamic> toJson() => {
        "testcontent": testcontent,
        "testName": testName,
        "testType": testType,
        "reportingDays": reportingDays,
        "reviewModel": reviewModel == null
            ? []
            : List<dynamic>.from(reviewModel!.map((x) => x.toJson())),
        "image": image,
        "offerModel": offerModel?.toJson(),
        "amount": amount,
        "sampleUnit": sampleUnit,
        "uuid": uuid,
      };
}
