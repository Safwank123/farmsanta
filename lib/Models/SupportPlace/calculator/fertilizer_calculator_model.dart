// To parse this JSON data, do
//
//     final fertilizerCalculatorDto = fertilizerCalculatorDtoFromJson(jsonString);

import 'dart:convert';

import 'fertilizer_calculator_details_model.dart';

FertilizerCalculatorDto fertilizerCalculatorDtoFromJson(String str) =>
    FertilizerCalculatorDto.fromJson(json.decode(str));

String fertilizerCalculatorDtoToJson(FertilizerCalculatorDto data) =>
    json.encode(data.toJson());

class FertilizerCalculatorDto {
  List<FertilizerCalculatorDetailsDto>? calculatorDetails;
  String? createdBy;
  int? defaultBorronB;
  int? defaultFym;
  int? defaultLime;
  int? defaultNitroN;
  int? defaultPhosphorusP;
  int? defaultPhotassiumK;
  int? defaultSulphurS;
  int? defaultVermiCompose;
  int? defaultZincZn;
  int? id;
  String? territory;

  FertilizerCalculatorDto({
    this.calculatorDetails,
    this.createdBy,
    this.defaultBorronB,
    this.defaultFym,
    this.defaultLime,
    this.defaultNitroN,
    this.defaultPhosphorusP,
    this.defaultPhotassiumK,
    this.defaultSulphurS,
    this.defaultVermiCompose,
    this.defaultZincZn,
    this.id,
    this.territory,
  });

  factory FertilizerCalculatorDto.fromJson(Map<String, dynamic> json) =>
      FertilizerCalculatorDto(
        calculatorDetails: json["calculatorDetails"] == null
            ? null
            : List<FertilizerCalculatorDetailsDto>.from(
                json["calculatorDetails"]!
                    .map((x) => FertilizerCalculatorDetailsDto.fromJson(x))),
        createdBy:
            json["createdBy"] != null ? json["createdBy"] as String : null,
        defaultBorronB: json["defaultBorronB"]?.toInt(),
        defaultFym:
            json["defaultFYM"]?.toInt(),
        defaultLime:
            json["defaultLime"]?.toInt(),
        defaultNitroN: json["defaultNitroN"]?.toInt(),
        defaultPhosphorusP: json["defaultPhosphorusP"]?.toInt(),
        defaultPhotassiumK: json["defaultPhotassiumK"]?.toInt(),
        defaultSulphurS: json["defaultSulphurS"]?.toInt(),
        defaultVermiCompose: json["defaultVermiCompose"]?.toInt(),
        defaultZincZn: json["defaultZincZN"]?.toInt(),
        id: json["id"]?.toInt(),
        territory:
            json["territory"] != null ? json["territory"] as String : null,
      );

  Map<String, dynamic> toJson() => {
        "calculatorDetails": calculatorDetails == null
            ? []
            : List<dynamic>.from(calculatorDetails!.map((x) => x.toJson())),
        "createdBy": createdBy,
        "defaultBorronB": defaultBorronB,
        "defaultFYM": defaultFym,
        "defaultLime": defaultLime,
        "defaultNitroN": defaultNitroN,
        "defaultPhosphorusP": defaultPhosphorusP,
        "defaultPhotassiumK": defaultPhotassiumK,
        "defaultSulphurS": defaultSulphurS,
        "defaultVermiCompose": defaultVermiCompose,
        "defaultZincZN": defaultZincZn,
        "id": id,
        "territory": territory,
      };
}
