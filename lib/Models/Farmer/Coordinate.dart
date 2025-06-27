import 'dart:convert';

class Coordinate {
  final int index;
  final double latitude;
  final double longitude;

  Coordinate({
    required this.index,
    required this.latitude,
    required this.longitude,
  });

  Map<String, dynamic> toMap() {
    return {
      'index': index,
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  factory Coordinate.fromMap(Map<String, dynamic> map) {
    return Coordinate(
      index: map['index']?.toInt() ?? 0,
      latitude: map['latitude']?.toDouble() ?? 0.0,
      longitude: map['longitude']?.toDouble() ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() => toMap();

  factory Coordinate.fromJson(Map<String, dynamic> source) =>
      Coordinate.fromMap(source);
}
