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
        id: json["id"] != null ? json["id"].toInt() : null,
        status: json["status"] != null ? json["status"] : null,
        nitroN: json["nitroN"] != null ? json["nitroN"].toInt() : null,
        phosphorusP:
            json["phosphorusP"] != null ? json["phosphorusP"].toDouble() : null,
        photassiumK:
            json["photassiumK"] != null ? json["photassiumK"].toDouble() : null,
        zincZn: json["zincZn"] != null ? json["zincZn"].toInt() : null,
        borronB: json["borronB"] != null ? json["borronB"].toDouble() : null,
        sulphurS: json["sulphurS"] != null ? json["sulphurS"].toInt() : null,
        lime: json["lime"] != null ? json["lime"].toInt() : null,
        costKg: json["costKg"] != null ? json["costKg"].toDouble() : null,
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
