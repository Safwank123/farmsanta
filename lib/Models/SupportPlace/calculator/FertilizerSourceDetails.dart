// To parse this JSON data, do
//
//     final fertilizerSourceCalculatorDetailsDto = fertilizerSourceCalculatorDetailsDtoFromJson(jsonString);

import 'dart:convert';

List<List<FertilizerSourceCalculatorDetailsDto>>
    fertilizerSourceCalculatorDetailsDtoFromJson(String str) =>
        List<List<FertilizerSourceCalculatorDetailsDto>>.from(json
            .decode(str)
            .map((x) => List<FertilizerSourceCalculatorDetailsDto>.from(x.map(
                (x) => FertilizerSourceCalculatorDetailsDto.fromJson(x)))));

String fertilizerSourceCalculatorDetailsDtoToJson(
        List<List<FertilizerSourceCalculatorDetailsDto>> data) =>
    json.encode(List<dynamic>.from(
        data.map((x) => List<dynamic>.from(x.map((x) => x.toJson())))));

class FertilizerSourceCalculatorDetailsDto {
  int? id;
  bool? status;
  int? nitroN;
  double? phosphorusP;
  double? photassiumK;
  int? zincZn;
  double? borronB;
  int? sulphurS;
  int? lime;
  double? costKg;
  String? territory;
  String? fertilizerName;
  String? fertilizerType;

  FertilizerSourceCalculatorDetailsDto({
    this.id,
    this.status,
    this.nitroN,
    this.phosphorusP,
    this.photassiumK,
    this.zincZn,
    this.borronB,
    this.sulphurS,
    this.lime,
    this.costKg,
    this.territory,
    this.fertilizerName,
    this.fertilizerType,
  });

  factory FertilizerSourceCalculatorDetailsDto.fromJson(
          Map<String, dynamic> json) =>
      FertilizerSourceCalculatorDetailsDto(
        id: json["id"]?.toInt(),
        status: json["status"],
        nitroN: json["nitroN"]?.toInt(),
        phosphorusP:
            json["phosphorusP"]?.toDouble(),
        photassiumK:
            json["photassiumK"]?.toDouble(),
        zincZn: json["zincZn"]?.toInt(),
        borronB: json["borronB"]?.toDouble(),
        sulphurS: json["sulphurS"]?.toInt(),
        lime: json["lime"]?.toInt(),
        costKg: json["costKg"]?.toDouble(),
        territory:
            json["territory"] != null ? json["territory"] as String : null,
        fertilizerName: json["fertilizerName"] != null
            ? json["fertilizerName"] as String
            : null,
        fertilizerType: json["fertilizerType"] != null
            ? json["fertilizerType"] as String
            : null,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "status": status,
        "nitroN": nitroN,
        "phosphorusP": phosphorusP,
        "photassiumK": photassiumK,
        "zincZN": zincZn,
        "borronB": borronB,
        "sulphurS": sulphurS,
        "lime": lime,
        "cost_kg": costKg,
        "territory": territory,
        "fertilizerName": fertilizerName,
        "fertilizerType": fertilizerType,
      };
}
