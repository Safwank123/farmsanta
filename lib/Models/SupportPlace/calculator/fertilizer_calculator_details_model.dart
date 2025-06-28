class FertilizerCalculatorDetailsDto {
  int? borronB;
  String? cropId;
  int? daysAfter25;
  int? daysAfter40;
  String? fertilizerType;
  int? fym;
  int? id;
  int? lastploughing;
  int? nitroN;
  int? phosphorusP;
  int? photassiumK;
  bool? status;
  int? sulphurS;
  int? timeOfsowing;
  int? vermiCompose;
  int? zincZn;

  FertilizerCalculatorDetailsDto({
    this.borronB,
    this.cropId,
    this.daysAfter25,
    this.daysAfter40,
    this.fertilizerType,
    this.fym,
    this.id,
    this.lastploughing,
    this.nitroN,
    this.phosphorusP,
    this.photassiumK,
    this.status,
    this.sulphurS,
    this.timeOfsowing,
    this.vermiCompose,
    this.zincZn,
  });

  factory FertilizerCalculatorDetailsDto.fromJson(Map<String, dynamic> json) =>
      FertilizerCalculatorDetailsDto(
        borronB: json["borronB"]?.toInt(),
        cropId: json["cropId"] != null ? json["cropId"] as String : null,
        daysAfter25:
            json["daysAfter25"]?.toInt(),
        daysAfter40:
            json["daysAfter40"]?.toInt(),
        fertilizerType: json["fertilizerType"] != null
            ? json["fertilizerType"] as String
            : null,
        fym: json["fym"]?.toInt(),
        id: json["id"]?.toInt(),
        lastploughing: json["lastploughing"]?.toInt(),
        nitroN: json["nitroN"]?.toInt(),
        phosphorusP:
            json["phosphorusP"]?.toInt(),
        photassiumK:
            json["photassiumK"]?.toInt(),
        status: json["status"],
        sulphurS: json["sulphurS"]?.toInt(),
        timeOfsowing:
            json["timeOfsowing"]?.toInt(),
        vermiCompose:
            json["vermiCompose"]?.toInt(),
        zincZn: json["zincZN"]?.toInt(),
      );

  Map<String, dynamic> toJson() => {
        "borronB": borronB,
        "cropId": cropId,
        "daysAfter25": daysAfter25,
        "daysAfter40": daysAfter40,
        "fertilizerType": fertilizerType,
        "fym": fym,
        "id": id,
        "lastploughing": lastploughing,
        "nitroN": nitroN,
        "phosphorusP": phosphorusP,
        "photassiumK": photassiumK,
        "status": status,
        "sulphurS": sulphurS,
        "timeOfsowing": timeOfsowing,
        "vermiCompose": vermiCompose,
        "zincZN": zincZn,
      };
}
