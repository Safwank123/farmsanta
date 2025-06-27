class Location {
  String? name;
  num? lat;
  num? lon;
  String? country;

  Location({
    this.name,
    this.lat,
    this.lon,
    this.country,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      name: json['name'] != null ? json['name'] as String : null,
      lat: json['lat'] != null ? json['lat'] as num : null,
      lon: json['lon'] != null ? json['lon'] as num : null,
      country: json['country'] != null ? json['country'] as String : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'lat': lat,
      'lon': lon,
      'country': country,
    };
  }
}
