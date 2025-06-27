import 'dart:convert';

List<Cropselectfruit> cropselectfruitFromJson(String str) =>
    List<Cropselectfruit>.from(
        json.decode(str).map((x) => Cropselectfruit.fromJson(x)));

String cropselectfruitToJson(List<Cropselectfruit> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Cropselectfruit {
  int? id;
  bool? status;
  String? territory;
  int? priority;
  String? cropName;
  int? planting;
  int? areaPerPlant;
  int? neemKaranjCake;
  int? boneMeal;
  int? limeL;
  int? ureaU;
  int? diAluminiumPhosphatDap;
  int? muriateOfPotashMop;
  int? zincSulphate;
  int? boraxB;
  String? procedureNotes;
  int? fym;

  Cropselectfruit({
    this.id,
    this.status,
    this.territory,
    this.priority,
    this.cropName,
    this.planting,
    this.areaPerPlant,
    this.neemKaranjCake,
    this.boneMeal,
    this.limeL,
    this.ureaU,
    this.diAluminiumPhosphatDap,
    this.muriateOfPotashMop,
    this.zincSulphate,
    this.boraxB,
    this.procedureNotes,
    this.fym,
  });

  factory Cropselectfruit.fromJson(Map<String, dynamic> json) =>
      Cropselectfruit(
        id: json["id"] != null ? json["id"].toInt() : null,
        status: json["status"] != null ? json["status"] : null,
        territory:
            json["territory"] != null ? json["territory"] as String : null,
        priority: json["priority"] != null ? json["priority"].toInt() : null,
        cropName: json["cropName"] != null ? json["cropName"] as String : null,
        planting: json["planting"] != null ? json["planting"].toInt() : null,
        areaPerPlant:
            json["areaPerPlant"] != null ? json["areaPerPlant"].toInt() : null,
        neemKaranjCake: json["neemKaranjCake"] != null
            ? json["neemKaranjCake"].toInt()
            : null,
        boneMeal: json["boneMeal"] != null ? json["boneMeal"].toInt() : null,
        limeL: json["limeL"] != null ? json["limeL"].toInt() : null,
        ureaU: json["ureaU"] != null ? json["ureaU"].toInt() : null,
        diAluminiumPhosphatDap: json["diAluminiumPhosphatDAP"] != null
            ? json["diAluminiumPhosphatDAP"].toInt()
            : null,
        muriateOfPotashMop: json["muriateOfPotashMOP"] != null
            ? json["muriateOfPotashMOP"].toInt()
            : null,
        zincSulphate:
            json["zincSulphate"] != null ? json["zincSulphate"].toInt() : null,
        boraxB: json["boraxB"] != null ? json["boraxB"].toInt() : null,
        procedureNotes: json["procedureNotes"] != null
            ? json["procedureNotes"] as String
            : null,
        fym: json["fym"] != null ? json["fym"] : null,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "status": status,
        "territory": territory,
        "priority": priority,
        "cropName": cropName,
        "planting": planting,
        "areaPerPlant": areaPerPlant,
        "neemKaranjCake": neemKaranjCake,
        "boneMeal": boneMeal,
        "limeL": limeL,
        "ureaU": ureaU,
        "diAluminiumPhosphatDAP": diAluminiumPhosphatDap,
        "muriateOfPotashMOP": muriateOfPotashMop,
        "zincSulphate": zincSulphate,
        "boraxB": boraxB,
        "procedureNotes": procedureNotes,
        "fym": fym,
      };
}
