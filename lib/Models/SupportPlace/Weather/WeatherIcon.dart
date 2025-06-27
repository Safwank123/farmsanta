class WeatherIcon {
  String? description;
  String? icon;
  num? id;
  String? main;

  WeatherIcon({
    this.description,
    this.icon,
    this.id,
    this.main,
  });

  factory WeatherIcon.fromJson(Map<String, dynamic> json) {
    return WeatherIcon(
      description:
          json['description'] != null ? json['description'] as String : null,
      icon: json['icon'] != null ? json['icon'] as String : null,
      id: json['id'] != null ? json['id'] as num : null,
      main: json['main'] != null ? json['main'] as String : null,
    );
  }
}
