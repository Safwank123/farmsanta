class SowingMonth {
  int max;
  int min;

  SowingMonth({
    required this.max,
    required this.min,
  });

  factory SowingMonth.fromJson(Map<String, dynamic> json) => SowingMonth(
        max: json["max"] != null ? json["max"].toInt() : 0,
        min: json["min"] != null ? json["min"].toInt() : 0,
      );

  Map<String, dynamic> toJson() => {
        "max": max,
        "min": min,
      };
}
