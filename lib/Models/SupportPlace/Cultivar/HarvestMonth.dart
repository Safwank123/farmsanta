class HarvestMonth {
  int max;
  int min;

  HarvestMonth({
    required this.max,
    required this.min,
  });

  factory HarvestMonth.fromJson(Map<String, dynamic> json) => HarvestMonth(
        max: json["max"] != null ? json["max"].toInt() : 0,
        min: json["min"] != null ? json["min"].toInt() : 0,
      );

  Map<String, dynamic> toJson() => {
        "max": max,
        "min": min,
      };
}
