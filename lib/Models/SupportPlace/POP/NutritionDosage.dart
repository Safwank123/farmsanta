class NutritionDosage {
  String growthStage;
  int nitrogen;
  int phosphorus;
  int potassium;
  int sequenceId;
  int sulphur;
  int zinc;

  NutritionDosage({
    required this.growthStage,
    required this.nitrogen,
    required this.phosphorus,
    required this.potassium,
    required this.sequenceId,
    required this.sulphur,
    required this.zinc,
  });

  factory NutritionDosage.fromJson(Map<String, dynamic> json) =>
      NutritionDosage(
        growthStage:
            json["growthStage"] != null ? json["growthStage"] as String : '',
        nitrogen: json["nitrogen"] != null ? json["nitrogen"].toInt() : 0,
        phosphorus: json["phosphorus"] != null ? json["phosphorus"].toInt() : 0,
        potassium: json["potassium"] != null ? json["potassium"].toInt() : 0,
        sequenceId: json["sequenceId"] != null ? json["sequenceId"].toInt() : 0,
        sulphur: json["sulphur"] != null ? json["sulphur"].toInt() : 0,
        zinc: json["zinc"] != null ? json["zinc"].toInt() : 0,
      );

  Map<String, dynamic> toJson() => {
        "growthStage": growthStage,
        "nitrogen": nitrogen,
        "phosphorus": phosphorus,
        "potassium": potassium,
        "sequenceId": sequenceId,
        "sulphur": sulphur,
        "zinc": zinc,
      };
}
