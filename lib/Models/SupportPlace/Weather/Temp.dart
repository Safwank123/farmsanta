class Temp {
  late num? day;
  late num? min;
  late num? max;
  late num? night;
  late num? eve;
  late num? morn;

  Temp({
    required this.day,
    required this.min,
    required this.max,
    required this.night,
    required this.eve,
    required this.morn,
  });

  factory Temp.fromJson(Map<String, dynamic> json) {
    return Temp(
      day: json['day'] != null ? json['day'] as num : null,
      min: json['min'] != null ? json['min'] as num : null,
      max: json['max'] != null ? json['max'] as num : null,
      night: json['night'] != null ? json['night'] as num : null,
      eve: json['eve'] != null ? json['eve'] as num : null,
      morn: json['morn'] != null ? json['morn'] as num : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'day': day,
      'min': min,
      'max': max,
      'night': night,
      'eve': eve,
      'morn': morn,
    };
  }
}
