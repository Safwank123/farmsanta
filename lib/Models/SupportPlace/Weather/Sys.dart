class Sys {
  late String country;
  late num? id;
  late num? sunrise;
  late num? sunset;
  late num? type;

  Sys({
    required this.country,
    required this.id,
    required this.sunrise,
    required this.sunset,
    required this.type,
  });

  factory Sys.fromJson(Map<String, dynamic> json) {
    return Sys(
      country: json['country'] != null ? json['country'] as String : '',
      id: json['id'] != null ? json['id'] as num : null,
      sunrise: json['sunrise'] != null ? json['sunrise'] as num : null,
      sunset: json['sunset'] != null ? json['sunset'] as num : null,
      type: json['type'] != null ? json['type'] as num : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'country': country,
      'id': id,
      'sunrise': sunrise,
      'sunset': sunset,
      'type': type,
    };
  }
}
