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
        borronB: json["borronB"] != null ? json["borronB"].toInt() : null,
        cropId: json["cropId"] != null ? json["cropId"] as String : null,
        daysAfter25:
            json["daysAfter25"] != null ? json["daysAfter25"].toInt() : null,
        daysAfter40:
            json["daysAfter40"] != null ? json["daysAfter40"].toInt() : null,
        fertilizerType: json["fertilizerType"] != null
            ? json["fertilizerType"] as String
            : null,
        fym: json["fym"] != null ? json["fym"].toInt() : null,
        id: json["id"] != null ? json["id"].toInt() : null,
        lastploughing: json["lastploughing"] != null
            ? json["lastploughing"].toInt()
            : null,
        nitroN: json["nitroN"] != null ? json["nitroN"].toInt() : null,
        phosphorusP:
            json["phosphorusP"] != null ? json["phosphorusP"].toInt() : null,
        photassiumK:
            json["photassiumK"] != null ? json["photassiumK"].toInt() : null,
        status: json["status"] ?? null,
        sulphurS: json["sulphurS"] != null ? json["sulphurS"].toInt() : null,
        timeOfsowing:
            json["timeOfsowing"] != null ? json["timeOfsowing"].toInt() : null,
        vermiCompose:
            json["vermiCompose"] != null ? json["vermiCompose"].toInt() : null,
        zincZn: json["zincZN"] != null ? json["zincZN"].toInt() : null,
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
