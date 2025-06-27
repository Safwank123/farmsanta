class CropDuration {
  int max;
  int min;

  CropDuration({
    required this.max,
    required this.min,
  });

  factory CropDuration.fromJson(Map<String, dynamic> json) => CropDuration(
        max: json["max"] != null ? json["max"].toInt() : 0,
        min: json["min"] != null ? json["min"].toInt() : 0,
      );

  Map<String, dynamic> toJson() => {
        "max": max,
        "min": min,
      };
}
