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
        id: json["id"]?.toInt(),
        status: json["status"],
        territory:
            json["territory"] != null ? json["territory"] as String : null,
        priority: json["priority"]?.toInt(),
        cropName: json["cropName"] != null ? json["cropName"] as String : null,
        planting: json["planting"]?.toInt(),
        areaPerPlant:
            json["areaPerPlant"]?.toInt(),
        neemKaranjCake: json["neemKaranjCake"]?.toInt(),
        boneMeal: json["boneMeal"]?.toInt(),
        limeL: json["limeL"]?.toInt(),
        ureaU: json["ureaU"]?.toInt(),
        diAluminiumPhosphatDap: json["diAluminiumPhosphatDAP"]?.toInt(),
        muriateOfPotashMop: json["muriateOfPotashMOP"]?.toInt(),
        zincSulphate:
            json["zincSulphate"]?.toInt(),
        boraxB: json["boraxB"]?.toInt(),
        procedureNotes: json["procedureNotes"] != null
            ? json["procedureNotes"] as String
            : null,
        fym: json["fym"],
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
