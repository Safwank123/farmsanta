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
  List<LandModel> subLands; // Added subLands property
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
    required this.subLands, // Added to constructor
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
      'area': area?.toMap(),
      'coordinates': coordinates.map((x) => x.toMap()).toList(),
      'subLands': subLands.map((x) => x.toMap()).toList(), // Added to serialization
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
      documents: map['documents'] != null ? List<String>.from(map['documents']) : [],
      area: map['area'] != null ? Area.fromMap(map['area']) : null,
      coordinates: map['coordinates'] != null
          ? List<Coordinate>.from(map['coordinates']?.map((x) => Coordinate.fromMap(x)))
          : [],
      subLands: map['subLands'] != null // Added deserialization
          ? List<LandModel>.from(map['subLands']?.map((x) => LandModel.fromMap(x)))
          : [],
      crops: map['crops'] != null
          ? List<Crop>.from(map['crops']?.map((x) => Crop.fromMap(x)))
          : [],
    );
  }

  Map<String, dynamic> toJson() => toMap();

  factory LandModel.fromJson(Map<String, dynamic> source) => LandModel.fromMap(source);

  LandModel copyWith({
    String? landId,
    String? landName,
    String? registrationNumber,
    String? farmLocation,
    double? latitude,
    double? longitude,
    String? unitOfMeasure,
    String? waterSource,
    List<String>? documents,
    Area? area,
    List<Coordinate>? coordinates,
    List<LandModel>? subLands, // Added to copyWith
    List<Crop>? crops,
  }) {
    return LandModel(
      landId: landId ?? this.landId,
      landName: landName ?? this.landName,
      registrationNumber: registrationNumber ?? this.registrationNumber,
      farmLocation: farmLocation ?? this.farmLocation,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      unitOfMeasure: unitOfMeasure ?? this.unitOfMeasure,
      waterSource: waterSource ?? this.waterSource,
      documents: documents ?? this.documents,
      area: area ?? this.area,
      coordinates: coordinates ?? this.coordinates,
      subLands: subLands ?? this.subLands,
      crops: crops ?? this.crops,
    );
  }

  @override
  String toString() {
    return 'LandModel(landId: $landId, landName: $landName, location: $farmLocation, '
        'coordinates: ${coordinates.length}, subLands: ${subLands.length})';
  }

  // Helper method to create a minimal sub-land
  static LandModel createSubLand({
    required List<Coordinate> coordinates,
    String landName = 'Sub-land',
  }) {
    return LandModel(
      landId: 'sub-${DateTime.now().millisecondsSinceEpoch}',
      landName: landName,
      registrationNumber: '',
      farmLocation: 'Sub-plot',
      latitude: coordinates.isNotEmpty ? coordinates.first.latitude : 0.0,
      longitude: coordinates.isNotEmpty ? coordinates.first.longitude : 0.0,
      unitOfMeasure: 'acres',
      waterSource: 'N/A',
      documents: [],
      area: null,
      coordinates: coordinates,
      subLands: [], // Sub-lands can't have nested sub-lands in this implementation
      crops: [],
    );
  }
}