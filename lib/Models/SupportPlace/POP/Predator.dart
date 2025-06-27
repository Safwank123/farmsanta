import '../../Common/photo_model.dart';

class Predator {
  String createdBy;
  DateTime createdTimestamp;
  List<String> crops;
  List<String> cultivarGroups;
  List<String> cultivars;
  List<String> diseases;
  List<String> insects;
  List<Photo> photos;
  String predatorName;
  List<String> regions;
  String tenantId;
  List<String> territories;
  String updatedBy;
  DateTime updatedTimestamp;
  String uuid;

  Predator({
    required this.createdBy,
    required this.createdTimestamp,
    required this.crops,
    required this.cultivarGroups,
    required this.cultivars,
    required this.diseases,
    required this.insects,
    required this.photos,
    required this.predatorName,
    required this.regions,
    required this.tenantId,
    required this.territories,
    required this.updatedBy,
    required this.updatedTimestamp,
    required this.uuid,
  });

  factory Predator.fromJson(Map<String, dynamic> json) {
    try {
      return Predator(
        createdBy: json['createdBy'] != null ? json['createdBy'] as String : '',
        createdTimestamp: json['createdTimestamp'] != null
            ? DateTime.parse(json['createdTimestamp'])
            : DateTime.now(),
        crops: json['crops'] != null
            ? List<String>.from(json['crops'].map((x) => x))
            : [],
        cultivarGroups: json['cultivarGroups'] != null
            ? List<String>.from(json['cultivarGroups'].map((x) => x))
            : [],
        cultivars: json['cultivars'] != null
            ? List<String>.from(json['cultivars'].map((x) => x))
            : [],
        diseases: json['diseases'] != null
            ? List<String>.from(json['diseases'].map((x) => x))
            : [],
        insects: json['insects'] != null
            ? List<String>.from(json['insects'].map((x) => x))
            : [],
        photos: json['photos'] != null
            ? List<Photo>.from(json['photos'].map((x) => Photo.fromJson(x)))
            : [],
        predatorName:
            json['predatorName'] != null ? json['predatorName'] as String : '',
        regions: json['regions'] != null
            ? List<String>.from(json['regions'].map((x) => x))
            : [],
        tenantId: json['tenantId'] != null ? json['tenantId'] as String : '',
        territories: json['territories'] != null
            ? List<String>.from(json['territories'].map((x) => x))
            : [],
        updatedBy: json['updatedBy'] != null ? json['updatedBy'] as String : '',
        updatedTimestamp: json['updatedTimestamp'] != null
            ? DateTime.parse(json['updatedTimestamp'])
            : DateTime.now(),
        uuid: json['uuid'] != null ? json['uuid'] as String : '',
      );
    } catch (e) {
      return Predator(
        createdBy: json['createdBy'] != null ? json['createdBy'] as String : '',
        createdTimestamp: json['createdTimestamp'] != null
            ? DateTime.fromMillisecondsSinceEpoch(json['createdTimestamp'])
            : DateTime.now(),
        crops: json['crops'] != null
            ? List<String>.from(json['crops'].map((x) => x))
            : [],
        cultivarGroups: json['cultivarGroups'] != null
            ? List<String>.from(json['cultivarGroups'].map((x) => x))
            : [],
        cultivars: json['cultivars'] != null
            ? List<String>.from(json['cultivars'].map((x) => x))
            : [],
        diseases: json['diseases'] != null
            ? List<String>.from(json['diseases'].map((x) => x))
            : [],
        insects: json['insects'] != null
            ? List<String>.from(json['insects'].map((x) => x))
            : [],
        photos: json['photos'] != null
            ? List<Photo>.from(json['photos'].map((x) => Photo.fromJson(x)))
            : [],
        predatorName:
            json['predatorName'] != null ? json['predatorName'] as String : '',
        regions: json['regions'] != null
            ? List<String>.from(json['regions'].map((x) => x))
            : [],
        tenantId: json['tenantId'] != null ? json['tenantId'] as String : '',
        territories: json['territories'] != null
            ? List<String>.from(json['territories'].map((x) => x))
            : [],
        updatedBy: json['updatedBy'] != null ? json['updatedBy'] as String : '',
        updatedTimestamp: json['updatedTimestamp'] != null
            ? DateTime.fromMillisecondsSinceEpoch(json['updatedTimestamp'])
            : DateTime.now(),
        uuid: json['uuid'] != null ? json['uuid'] as String : '',
      );
    }
  }

  Map<String, dynamic> toJson() => {
        "createdBy": createdBy,
        "createdTimestamp": createdTimestamp.toIso8601String(),
        "crops": List<dynamic>.from(crops.map((x) => x)),
        "cultivarGroups": List<dynamic>.from(cultivarGroups.map((x) => x)),
        "cultivars": List<dynamic>.from(cultivars.map((x) => x)),
        "diseases": List<dynamic>.from(diseases.map((x) => x)),
        "insects": List<dynamic>.from(insects.map((x) => x)),
        "photos": List<dynamic>.from(photos.map((x) => x.toJson())),
        "predatorName": predatorName,
        "regions": List<dynamic>.from(regions.map((x) => x)),
        "tenantId": tenantId,
        "territories": List<dynamic>.from(territories.map((x) => x)),
        "updatedBy": updatedBy,
        "updatedTimestamp": updatedTimestamp.toIso8601String(),
        "uuid": uuid,
      };
}
