// class FertilizerFruitCalculatorDetails {
//   double areaPerPlant;
//   double boneMeal;
//   double boraxB;
//   String cropName;
//   double diAluminiumPhosphatDAP;
//   double fym;
//   int id;
//   double limeL;
//   double muriateOfPotashMOP;
//   double neemKaranjCake;
//   int planting;
//   int priority;
//   String procedureNotes;
//   bool status;
//   String territory;
//   double ureaU;
//   double zincSulphate;

//   FertilizerFruitCalculatorDetails({
//     required this.areaPerPlant,
//     required this.boneMeal,
//     required this.boraxB,
//     required this.cropName,
//     required this.diAluminiumPhosphatDAP,
//     required this.fym,
//     required this.id,
//     required this.limeL,
//     required this.muriateOfPotashMOP,
//     required this.neemKaranjCake,
//     required this.planting,
//     required this.priority,
//     required this.procedureNotes,
//     required this.status,
//     required this.territory,
//     required this.ureaU,
//     required this.zincSulphate,
//   });

//   Map<String, dynamic> toMap() {
//     return {
//       'areaPerPlant': areaPerPlant,
//       'boneMeal': boneMeal,
//       'boraxB': boraxB,
//       'cropName': cropName,
//       'diAluminiumPhosphatDAP': diAluminiumPhosphatDAP,
//       'fym': fym,
//       'id': id,
//       'limeL': limeL,
//       'muriateOfPotashMOP': muriateOfPotashMOP,
//       'neemKaranjCake': neemKaranjCake,
//       'planting': planting,
//       'priority': priority,
//       'procedureNotes': procedureNotes,
//       'status': status,
//       'territory': territory,
//       'ureaU': ureaU,
//       'zincSulphate': zincSulphate,
//     };
//   }
// }

import 'dart:convert';

FertilizerFruitCalculatorDetails fertilizerFruitCalculatorDetailsFromJson(
        String str) =>
    FertilizerFruitCalculatorDetails.fromJson(json.decode(str));

String fertilizerFruitCalculatorDetailsToJson(
        FertilizerFruitCalculatorDetails data) =>
    json.encode(data.toJson());

class FertilizerFruitCalculatorDetails {
  double areaPerPlant;
  double boneMeal;
  double boraxB;
  String cropName;
  double diAluminiumPhosphatDAP;
  double fym;
  int id;
  double limeL;
  double muriateOfPotashMOP;
  double neemKaranjCake;
  int planting;
  int priority;
  String procedureNotes;
  bool status;
  String territory;
  double ureaU;
  double zincSulphate;

  FertilizerFruitCalculatorDetails({
    required this.areaPerPlant,
    required this.boneMeal,
    required this.boraxB,
    required this.cropName,
    required this.diAluminiumPhosphatDAP,
    required this.fym,
    required this.id,
    required this.limeL,
    required this.muriateOfPotashMOP,
    required this.neemKaranjCake,
    required this.planting,
    required this.priority,
    required this.procedureNotes,
    required this.status,
    required this.territory,
    required this.ureaU,
    required this.zincSulphate,
  });

  factory FertilizerFruitCalculatorDetails.fromJson(
          Map<String, dynamic> json) =>
      FertilizerFruitCalculatorDetails(
        areaPerPlant: json["areaPerPlant"] != null
            ? json["areaPerPlant"].toDouble()
            : 0.0,
        boneMeal: json["boneMeal"] != null ? json["boneMeal"].toDouble() : 0.0,
        boraxB: json["boraxB"] != null ? json["boraxB"].toDouble() : 0.0,
        cropName: json["cropName"] != null ? json["cropName"] as String : '',
        diAluminiumPhosphatDAP: json["diAluminiumPhosphatDAP"] != null
            ? json["diAluminiumPhosphatDAP"].toDouble()
            : 0.0,
        fym: json["fym"] != null ? json["fym"].toDouble() : 0.0,
        id: json["id"] != null ? json["id"].toInt() : 0,
        limeL: json["limeL"] != null ? json["limeL"].toDouble() : 0.0,
        muriateOfPotashMOP: json["muriateOfPotashMOP"] != null
            ? json["muriateOfPotashMOP"].toDouble()
            : 0.0,
        neemKaranjCake: json["neemKaranjCake"] != null
            ? json["neemKaranjCake"].toDouble()
            : 0.0,
        planting: json["planting"] != null ? json["planting"].toInt() : 0,
        priority: json["priority"] != null ? json["priority"].toInt() : 0,
        procedureNotes: json["procedureNotes"] != null
            ? json["procedureNotes"] as String
            : '',
        status: json["status"] ?? false,
        territory: json["territory"] != null ? json["territory"] as String : '',
        ureaU: json["ureaU"] != null ? json["ureaU"].toDouble() : 0.0,
        zincSulphate: json["zincSulphate"] != null
            ? json["zincSulphate"].toDouble()
            : 0.0,
      );

  Map<String, dynamic> toJson() => {
        "areaPerPlant": areaPerPlant,
        "boneMeal": boneMeal,
        "boraxB": boraxB,
        "cropName": cropName,
        "diAluminiumPhosphatDAP": diAluminiumPhosphatDAP,
        "fym": fym,
        "id": id,
        "limeL": limeL,
        "muriateOfPotashMOP": muriateOfPotashMOP,
        "neemKaranjCake": neemKaranjCake,
        "planting": planting,
        "priority": priority,
        "procedureNotes": procedureNotes,
        "status": status,
        "territory": territory,
        "ureaU": ureaU,
        "zincSulphate": zincSulphate,
      };
}
