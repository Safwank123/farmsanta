// To parse this JSON data, do
//
//     final fertilizerCalculatorReportDto = fertilizerCalculatorReportDtoFromJson(jsonString);

import 'dart:convert';

FertilizerCalculatorReportDto fertilizerCalculatorReportDtoFromJson(
        String str) =>
    FertilizerCalculatorReportDto.fromJson(json.decode(str));

String fertilizerCalculatorReportDtoToJson(
        FertilizerCalculatorReportDto data) =>
    json.encode(data.toJson());

class FertilizerCalculatorReportDto {
  int? ageOfPlant;
  int? area;
  int? boronFertilizer;
  int? borronB;
  int? borronLevelB;
  String? createdBy;
  DateTime? createdTimestamp;
  String? cropId;
  int? cropPriority;
  int? cropType;
  String? finalReport;
  int? id;
  int? nitrogenLevelN;
  int? nitrogenN;
  int? nitrogenousFertilizer;
  int? npkFertilizer;
  int? phosphorusFertilizer;
  int? phosphorusLevelP;
  int? phosphorusP;
  int? photassiumK;
  int? photassiumLevelK;
  int? potassiumFertilizer;
  int? potentialHydrogenLevelPh;
  int? potentialHydrogenPh;
  int? sulphurLevelS;
  int? sulphurS;
  bool? testReportAvailable;
  int? zincFertilizer;
  int? zincLevelZn;
  int? zincZn;

  FertilizerCalculatorReportDto({
    this.ageOfPlant,
    this.area,
    this.boronFertilizer,
    this.borronB,
    this.borronLevelB,
    this.createdBy,
    this.createdTimestamp,
    this.cropId,
    this.cropPriority,
    this.cropType,
    this.finalReport,
    this.id,
    this.nitrogenLevelN,
    this.nitrogenN,
    this.nitrogenousFertilizer,
    this.npkFertilizer,
    this.phosphorusFertilizer,
    this.phosphorusLevelP,
    this.phosphorusP,
    this.photassiumK,
    this.photassiumLevelK,
    this.potassiumFertilizer,
    this.potentialHydrogenLevelPh,
    this.potentialHydrogenPh,
    this.sulphurLevelS,
    this.sulphurS,
    this.testReportAvailable,
    this.zincFertilizer,
    this.zincLevelZn,
    this.zincZn,
  });

  factory FertilizerCalculatorReportDto.fromJson(Map<String, dynamic> json) {
    try {
      return FertilizerCalculatorReportDto(
        ageOfPlant:
            json["ageOfPlant"]?.toInt(),
        area: json["area"]?.toInt(),
        boronFertilizer: json["boronFertilizer"]?.toInt(),
        borronB: json["borronB"]?.toInt(),
        borronLevelB:
            json["borronLevelB"]?.toInt(),
        createdBy:
            json["createdBy"] != null ? json["createdBy"] as String : null,
        createdTimestamp: json["createdTimestamp"] == null
            ? null
            : DateTime.parse(json["createdTimestamp"]),
        cropId: json["cropId"] != null ? json["cropId"] as String : null,
        cropPriority:
            json["cropPriority"]?.toInt(),
        cropType: json["cropType"]?.toInt(),
        finalReport:
            json["finalReport"] != null ? json["finalReport"] as String : null,
        id: json["id"]?.toInt(),
        nitrogenLevelN: json["nitrogenLevelN"]?.toInt(),
        nitrogenN: json["nitrogenN"]?.toInt(),
        nitrogenousFertilizer: json["nitrogenousFertilizer"]?.toInt(),
        npkFertilizer: json["npkFertilizer"]?.toInt(),
        phosphorusFertilizer: json["phosphorusFertilizer"]?.toInt(),
        phosphorusLevelP: json["phosphorusLevelP"]?.toInt(),
        phosphorusP:
            json["phosphorusP"]?.toInt(),
        photassiumK:
            json["photassiumK"]?.toInt(),
        photassiumLevelK: json["photassiumLevelK"]?.toInt(),
        potassiumFertilizer: json["potassiumFertilizer"]?.toInt(),
        potentialHydrogenLevelPh: json["potentialHydrogenLevelPH"]?.toInt(),
        potentialHydrogenPh: json["potentialHydrogenPH"]?.toInt(),
        sulphurLevelS: json["sulphurLevelS"]?.toInt(),
        sulphurS: json["sulphurS"]?.toInt(),
        testReportAvailable: json["testReportAvailable"],
        zincFertilizer: json["zincFertilizer"]?.toInt(),
        zincLevelZn:
            json["zincLevelZN"]?.toInt(),
        zincZn: json["zincZN"]?.toInt(),
      );
    } catch (e) {
      return FertilizerCalculatorReportDto(
        ageOfPlant:
            json["ageOfPlant"]?.toInt(),
        area: json["area"]?.toInt(),
        boronFertilizer: json["boronFertilizer"]?.toInt(),
        borronB: json["borronB"]?.toInt(),
        borronLevelB:
            json["borronLevelB"]?.toInt(),
        createdBy:
            json["createdBy"] != null ? json["createdBy"] as String : null,
        createdTimestamp: json["createdTimestamp"] == null
            ? null
            : DateTime.fromMillisecondsSinceEpoch(json["createdTimestamp"]),
        cropId: json["cropId"] != null ? json["cropId"] as String : null,
        cropPriority:
            json["cropPriority"]?.toInt(),
        cropType: json["cropType"]?.toInt(),
        finalReport:
            json["finalReport"] != null ? json["finalReport"] as String : null,
        id: json["id"]?.toInt(),
        nitrogenLevelN: json["nitrogenLevelN"]?.toInt(),
        nitrogenN: json["nitrogenN"]?.toInt(),
        nitrogenousFertilizer: json["nitrogenousFertilizer"]?.toInt(),
        npkFertilizer: json["npkFertilizer"]?.toInt(),
        phosphorusFertilizer: json["phosphorusFertilizer"]?.toInt(),
        phosphorusLevelP: json["phosphorusLevelP"]?.toInt(),
        phosphorusP:
            json["phosphorusP"]?.toInt(),
        photassiumK:
            json["photassiumK"]?.toInt(),
        photassiumLevelK: json["photassiumLevelK"]?.toInt(),
        potassiumFertilizer: json["potassiumFertilizer"]?.toInt(),
        potentialHydrogenLevelPh: json["potentialHydrogenLevelPH"]?.toInt(),
        potentialHydrogenPh: json["potentialHydrogenPH"]?.toInt(),
        sulphurLevelS: json["sulphurLevelS"]?.toInt(),
        sulphurS: json["sulphurS"]?.toInt(),
        testReportAvailable: json["testReportAvailable"],
        zincFertilizer: json["zincFertilizer"]?.toInt(),
        zincLevelZn:
            json["zincLevelZN"]?.toInt(),
        zincZn: json["zincZN"]?.toInt(),
      );
    }
  }

  Map<String, dynamic> toJson() => {
        "ageOfPlant": ageOfPlant,
        "area": area,
        "boronFertilizer": boronFertilizer,
        "borronB": borronB,
        "borronLevelB": borronLevelB,
        "createdBy": createdBy,
        "createdTimestamp": createdTimestamp?.toIso8601String(),
        "cropId": cropId,
        "cropPriority": cropPriority,
        "cropType": cropType,
        "finalReport": finalReport,
        "id": id,
        "nitrogenLevelN": nitrogenLevelN,
        "nitrogenN": nitrogenN,
        "nitrogenousFertilizer": nitrogenousFertilizer,
        "npkFertilizer": npkFertilizer,
        "phosphorusFertilizer": phosphorusFertilizer,
        "phosphorusLevelP": phosphorusLevelP,
        "phosphorusP": phosphorusP,
        "photassiumK": photassiumK,
        "photassiumLevelK": photassiumLevelK,
        "potassiumFertilizer": potassiumFertilizer,
        "potentialHydrogenLevelPH": potentialHydrogenLevelPh,
        "potentialHydrogenPH": potentialHydrogenPh,
        "sulphurLevelS": sulphurLevelS,
        "sulphurS": sulphurS,
        "testReportAvailable": testReportAvailable,
        "zincFertilizer": zincFertilizer,
        "zincLevelZN": zincLevelZn,
        "zincZN": zincZn,
      };
}
