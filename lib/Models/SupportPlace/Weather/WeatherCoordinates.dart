class WeatherCoordinates {
  late num? lat;
  late num? lon;

  WeatherCoordinates({
    required this.lat,
    required this.lon,
  });

  factory WeatherCoordinates.fromJson(Map<String, dynamic> json) {
    return WeatherCoordinates(
      lat: json['lat'] != null ? json['lat'] as num : null,
      lon: json['lon'] != null ? json['lon'] as num : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'lat': lat,
      'lon': lon,
    };
  }
}
