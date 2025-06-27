class WeatherDet {
  num? id;
  String? main;
  String? description;
  String? icon;

  WeatherDet({
    this.id,
    this.main,
    this.description,
    this.icon,
  });

  factory WeatherDet.fromJson(Map<String, dynamic> json) {
    return WeatherDet(
      id: json['id'] != null ? json['id'] as num : null,
      main: json['main'] != null ? json['main'] as String : null,
      description:
          json['description'] != null ? json['description'] as String : null,
      icon: json['icon'] != null ? json['icon'] as String : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'main': main,
      'description': description,
      'icon': icon,
    };
  }
}
