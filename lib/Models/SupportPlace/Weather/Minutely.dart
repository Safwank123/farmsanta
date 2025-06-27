class Minutely {
  late num? dt;
  late num? precipitation;

  Minutely({
    required this.dt,
    required this.precipitation,
  });

  factory Minutely.fromJson(Map<String, dynamic> json) {
    return Minutely(
      dt: json['dt'] != null ? json['dt'] as num : null,
      precipitation:
          json['precipitation'] != null ? json['precipitation'] as num : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'dt': dt,
      'precipitation': precipitation,
    };
  }
}
