// To parse this JSON data, do
//
//     final soilTestBookingModel = soilTestBookingModelFromJson(jsonString);

import 'dart:convert';

import 'soil_sample_test_model.dart';

SoilTestBookingModel soilTestBookingModelFromJson(String str) =>
    SoilTestBookingModel.fromJson(json.decode(str));

String soilTestBookingModelToJson(SoilTestBookingModel data) =>
    json.encode(data.toJson());

class SoilTestBookingModel {
  List<SoilSampleTestModel> soilSampleTestModel;
  double price;
  String status;
  bool isSelfSoilCollection;
  List<String> farmLocations;
  DateTime soilCollectionDateTime;
  DateTime getSoilReportDateTime;
  int numberOfSamples;

  SoilTestBookingModel({
    required this.soilSampleTestModel,
    required this.price,
    required this.status,
    required this.isSelfSoilCollection,
    required this.farmLocations,
    required this.soilCollectionDateTime,
    required this.getSoilReportDateTime,
    required this.numberOfSamples,
  });

  factory SoilTestBookingModel.fromJson(Map<String, dynamic> json) =>
      SoilTestBookingModel(
        soilSampleTestModel: List<SoilSampleTestModel>.from(
            json["soilSampleTestModel"]
                .map((x) => SoilSampleTestModel.fromJson(x))),
        price: json["price"]?.toDouble(),
        status: json["status"],
        isSelfSoilCollection: json["isSelfSoilCollection"],
        farmLocations: List<String>.from(json["farmLocations"].map((x) => x)),
        soilCollectionDateTime: DateTime.parse(json["SoilCollectionDateTime"]),
        getSoilReportDateTime: DateTime.parse(json["getSoilReportDateTime"]),
        numberOfSamples: json["numberOfSamples"],
      );

  Map<String, dynamic> toJson() => {
        "soilSampleTestModel":
            List<dynamic>.from(soilSampleTestModel.map((x) => x.toJson())),
        "price": price,
        "status": status,
        "isSelfSoilCollection": isSelfSoilCollection,
        "farmLocations": List<dynamic>.from(farmLocations.map((x) => x)),
        "SoilCollectionDateTime": soilCollectionDateTime.toIso8601String(),
        "getSoilReportDateTime": getSoilReportDateTime.toIso8601String(),
        "numberOfSamples": numberOfSamples,
      };
}
