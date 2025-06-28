// ignore_for_file: public_member_api_docs, sort_constructors_first

// class CropModelShort {
//   final String uuid;
//   final String cropName;
//   final String? image;

//   CropModelShort(this.uuid, this.cropName, this.image);

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'uuid': uuid,
//       'cropName': cropName,
//       'image': image,
//     };
//   }

//   factory CropModelShort.fromMap(Map<String, dynamic> map) {
//     return CropModelShort(
//       map['uuid'] as String,
//       map['cropName'] as String,
//       map['image'] ??
//           "https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8&w=1000&q=80",
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory CropModelShort.fromJson(String source) =>
//       CropModelShort.fromMap(json.decode(source) as Map<String, dynamic>);
// }

//Keeping backup of earlier model (as not having idea about the backend),
//adding fields for POP
class CropModelShort {
  final String uuid;
  final String cropName;
  final String imagePath;

  const CropModelShort({
    required this.uuid,
    required this.cropName,
    required this.imagePath,
  });

  /// Create from map (e.g., from API or local)
  factory CropModelShort.fromMap(Map<String, dynamic> map) {
    final path = map['imagePath'] as String?;

    // Only fallback to asset if imagePath is null or empty
    return CropModelShort(
      uuid: map['uuid'] as String? ?? '',
      cropName: map['cropName'] as String? ?? '',
      imagePath: (path != null && path.trim().isNotEmpty)
          ? path
          : 'assets/images/default_crop.png',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uuid': uuid,
      'cropName': cropName,
      'imagePath': imagePath,
    };
  }

  /// Checks whether the image is a network image (starts with http/https)
  bool get isNetworkImage => imagePath.toLowerCase().startsWith('http');

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CropModelShort &&
        other.uuid == uuid &&
        other.cropName == cropName &&
        other.imagePath == imagePath;
  }

  @override
  int get hashCode => uuid.hashCode ^ cropName.hashCode ^ imagePath.hashCode;

  @override
  String toString() {
    return 'CropModelShort(uuid: $uuid, cropName: $cropName, imagePath: $imagePath)';
  }
}

class StageModel {
  final String name;
  final String description;
  final String image;
  DateTime? date;
  StageModel(this.name, this.description, this.image, this.date);
}

class ClimateRequirements {
  final String temperature;
  final String rainfall;
  final String sowing;
  final String harvesting;

  ClimateRequirements({
    required this.temperature,
    required this.rainfall,
    required this.sowing,
    required this.harvesting,
  });

  factory ClimateRequirements.fromMap(Map<String, dynamic> map) {
    return ClimateRequirements(
      temperature:
          map['temperature'] != null ? map['temperature'] as String : '',
      rainfall: map['rainfall'] != null ? map['rainfall'] as String : '',
      sowing: map['sowing'] != null ? map['sowing'] as String : '',
      harvesting: map['harvesting'] != null ? map['harvesting'] as String : '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'temperature': temperature,
      'rainfall': rainfall,
      'sowing': sowing,
      'harvesting': harvesting,
    };
  }

  Map<String, dynamic> toJson() => toMap();

  factory ClimateRequirements.fromJson(Map<String, dynamic> source) =>
      ClimateRequirements.fromMap(source);
}

class CultivarRequirements {
  final String cultivarName;
  final String cultivarGroups;
  final String sowingMonth;
  final String harvestMonth;
  final String cultivarDuration;
  final String yieldPotential;
  final String properties;

  CultivarRequirements({
    required this.cultivarName,
    required this.cultivarGroups,
    required this.sowingMonth,
    required this.harvestMonth,
    required this.cultivarDuration,
    required this.yieldPotential,
    required this.properties,
  });

  factory CultivarRequirements.fromMap(Map<String, dynamic> map) {
    return CultivarRequirements(
      cultivarName:
          map['cultivarName'] != null ? map['cultivarName'] as String : '',
      cultivarGroups:
          map['cultivarGroups'] != null ? map['cultivarGroups'] as String : '',
      sowingMonth:
          map['sowingMonth'] != null ? map['sowingMonth'] as String : '',
      harvestMonth:
          map['harvestMonth'] != null ? map['harvestMonth'] as String : '',
      cultivarDuration: map['cultivarDuration'] != null
          ? map['cultivarDuration'] as String
          : '',
      yieldPotential:
          map['yieldPotential'] != null ? map['yieldPotential'] as String : '',
      properties: map['properties'] != null ? map['properties'] as String : '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'cultivarName': cultivarName,
      'cultivarGroups': cultivarGroups,
      'sowingMonth': sowingMonth,
      'harvestMonth': harvestMonth,
      'cultivarDuration': cultivarDuration,
      'yieldPotential': yieldPotential,
      'properties': properties,
    };
  }

  Map<String, dynamic> toJson() => toMap();

  factory CultivarRequirements.fromJson(Map<String, dynamic> source) =>
      CultivarRequirements.fromMap(source);
}
