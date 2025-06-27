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
            json["ageOfPlant"] != null ? json["ageOfPlant"].toInt() : null,
        area: json["area"] != null ? json["area"].toInt() : null,
        boronFertilizer: json["boronFertilizer"] != null
            ? json["boronFertilizer"].toInt()
            : null,
        borronB: json["borronB"] != null ? json["borronB"].toInt() : null,
        borronLevelB:
            json["borronLevelB"] != null ? json["borronLevelB"].toInt() : null,
        createdBy:
            json["createdBy"] != null ? json["createdBy"] as String : null,
        createdTimestamp: json["createdTimestamp"] == null
            ? null
            : DateTime.parse(json["createdTimestamp"]),
        cropId: json["cropId"] != null ? json["cropId"] as String : null,
        cropPriority:
            json["cropPriority"] != null ? json["cropPriority"].toInt() : null,
        cropType: json["cropType"] != null ? json["cropType"].toInt() : null,
        finalReport:
            json["finalReport"] != null ? json["finalReport"] as String : null,
        id: json["id"] != null ? json["id"].toInt() : null,
        nitrogenLevelN: json["nitrogenLevelN"] != null
            ? json["nitrogenLevelN"].toInt()
            : null,
        nitrogenN: json["nitrogenN"] != null ? json["nitrogenN"].toInt() : null,
        nitrogenousFertilizer: json["nitrogenousFertilizer"] != null
            ? json["nitrogenousFertilizer"].toInt()
            : null,
        npkFertilizer: json["npkFertilizer"] != null
            ? json["npkFertilizer"].toInt()
            : null,
        phosphorusFertilizer: json["phosphorusFertilizer"] != null
            ? json["phosphorusFertilizer"].toInt()
            : null,
        phosphorusLevelP: json["phosphorusLevelP"] != null
            ? json["phosphorusLevelP"].toInt()
            : null,
        phosphorusP:
            json["phosphorusP"] != null ? json["phosphorusP"].toInt() : null,
        photassiumK:
            json["photassiumK"] != null ? json["photassiumK"].toInt() : null,
        photassiumLevelK: json["photassiumLevelK"] != null
            ? json["photassiumLevelK"].toInt()
            : null,
        potassiumFertilizer: json["potassiumFertilizer"] != null
            ? json["potassiumFertilizer"].toInt()
            : null,
        potentialHydrogenLevelPh: json["potentialHydrogenLevelPH"] != null
            ? json["potentialHydrogenLevelPH"].toInt()
            : null,
        potentialHydrogenPh: json["potentialHydrogenPH"] != null
            ? json["potentialHydrogenPH"].toInt()
            : null,
        sulphurLevelS: json["sulphurLevelS"] != null
            ? json["sulphurLevelS"].toInt()
            : null,
        sulphurS: json["sulphurS"] != null ? json["sulphurS"].toInt() : null,
        testReportAvailable: json["testReportAvailable"] != null
            ? json["testReportAvailable"]
            : null,
        zincFertilizer: json["zincFertilizer"] != null
            ? json["zincFertilizer"].toInt()
            : null,
        zincLevelZn:
            json["zincLevelZN"] != null ? json["zincLevelZN"].toInt() : null,
        zincZn: json["zincZN"] != null ? json["zincZN"].toInt() : null,
      );
    } catch (e) {
      return FertilizerCalculatorReportDto(
        ageOfPlant:
            json["ageOfPlant"] != null ? json["ageOfPlant"].toInt() : null,
        area: json["area"] != null ? json["area"].toInt() : null,
        boronFertilizer: json["boronFertilizer"] != null
            ? json["boronFertilizer"].toInt()
            : null,
        borronB: json["borronB"] != null ? json["borronB"].toInt() : null,
        borronLevelB:
            json["borronLevelB"] != null ? json["borronLevelB"].toInt() : null,
        createdBy:
            json["createdBy"] != null ? json["createdBy"] as String : null,
        createdTimestamp: json["createdTimestamp"] == null
            ? null
            : DateTime.fromMillisecondsSinceEpoch(json["createdTimestamp"]),
        cropId: json["cropId"] != null ? json["cropId"] as String : null,
        cropPriority:
            json["cropPriority"] != null ? json["cropPriority"].toInt() : null,
        cropType: json["cropType"] != null ? json["cropType"].toInt() : null,
        finalReport:
            json["finalReport"] != null ? json["finalReport"] as String : null,
        id: json["id"] != null ? json["id"].toInt() : null,
        nitrogenLevelN: json["nitrogenLevelN"] != null
            ? json["nitrogenLevelN"].toInt()
            : null,
        nitrogenN: json["nitrogenN"] != null ? json["nitrogenN"].toInt() : null,
        nitrogenousFertilizer: json["nitrogenousFertilizer"] != null
            ? json["nitrogenousFertilizer"].toInt()
            : null,
        npkFertilizer: json["npkFertilizer"] != null
            ? json["npkFertilizer"].toInt()
            : null,
        phosphorusFertilizer: json["phosphorusFertilizer"] != null
            ? json["phosphorusFertilizer"].toInt()
            : null,
        phosphorusLevelP: json["phosphorusLevelP"] != null
            ? json["phosphorusLevelP"].toInt()
            : null,
        phosphorusP:
            json["phosphorusP"] != null ? json["phosphorusP"].toInt() : null,
        photassiumK:
            json["photassiumK"] != null ? json["photassiumK"].toInt() : null,
        photassiumLevelK: json["photassiumLevelK"] != null
            ? json["photassiumLevelK"].toInt()
            : null,
        potassiumFertilizer: json["potassiumFertilizer"] != null
            ? json["potassiumFertilizer"].toInt()
            : null,
        potentialHydrogenLevelPh: json["potentialHydrogenLevelPH"] != null
            ? json["potentialHydrogenLevelPH"].toInt()
            : null,
        potentialHydrogenPh: json["potentialHydrogenPH"] != null
            ? json["potentialHydrogenPH"].toInt()
            : null,
        sulphurLevelS: json["sulphurLevelS"] != null
            ? json["sulphurLevelS"].toInt()
            : null,
        sulphurS: json["sulphurS"] != null ? json["sulphurS"].toInt() : null,
        testReportAvailable: json["testReportAvailable"] != null
            ? json["testReportAvailable"]
            : null,
        zincFertilizer: json["zincFertilizer"] != null
            ? json["zincFertilizer"].toInt()
            : null,
        zincLevelZn:
            json["zincLevelZN"] != null ? json["zincLevelZN"].toInt() : null,
        zincZn: json["zincZN"] != null ? json["zincZN"].toInt() : null,
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
