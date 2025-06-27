import 'dart:convert';

import 'Area.dart';
import 'Coordinate.dart';
import 'Crop.dart';

class LandModel {
  String landId;
  String landName;
  String registrationNumber;
  String farmLocation;
  double latitude;
  double longitude;
  String unitOfMeasure;
  String waterSource;
  List<String> documents;
  Area? area;
  List<Coordinate> coordinates;
  List<Crop> crops;
  LandModel({
    required this.landId,
    required this.landName,
    required this.registrationNumber,
    required this.farmLocation,
    required this.latitude,
    required this.longitude,
    required this.unitOfMeasure,
    required this.waterSource,
    required this.documents,
    required this.area,
    required this.coordinates,
    required this.crops,
  });

  Map<String, dynamic> toMap() {
    return {
      'landId': landId,
      'landName': landName,
      'registrationNumber': registrationNumber,
      'farmLocation': farmLocation,
      'latitude': latitude,
      'longitude': longitude,
      'unitOfMeasure': unitOfMeasure,
      'waterSource': waterSource,
      'documents': documents,
      'area': area!.toMap(),
      'coordinates': coordinates.map((x) => x.toMap()).toList(),
      'crops': crops.map((x) => x.toMap()).toList(),
    };
  }

  factory LandModel.fromMap(Map<String, dynamic> map) {
    return LandModel(
      landId: map['landId'] ?? '',
      landName: map['landName'] ?? '',
      registrationNumber: map['registrationNumber'] ?? '',
      farmLocation: map['farmLocation'] ?? '',
      latitude: map['latitude']?.toDouble() ?? 0.0,
      longitude: map['longitude']?.toDouble() ?? 0.0,
      unitOfMeasure: map['unitOfMeasure'] ?? '',
      waterSource: map['waterSource'] ?? '',
      documents:
          map['documents'] != null ? List<String>.from(map['documents']) : [],
      area: map['area'] != null ? Area.fromMap(map['area']) : null,
      coordinates: map['coordinates'] != null
          ? List<Coordinate>.from(
              map['coordinates']?.map((x) => Coordinate.fromMap(x)))
          : [],
      crops: map['crops'] != null
          ? List<Crop>.from(map['crops']?.map((x) => Crop.fromMap(x)))
          : [],
    );
  }

  Map<String, dynamic> toJson() => toMap();

  factory LandModel.fromJson(Map<String, dynamic> source) =>
      LandModel.fromMap(source);
}
