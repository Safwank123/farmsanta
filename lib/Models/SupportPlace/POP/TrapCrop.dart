import '../../Common/photo_model.dart';

class TrapCrop {
  String createdBy;
  DateTime createdTimestamp;
  List<String> crops;
  List<String> diseases;
  List<String> insects;
  String methodOfPlanting;
  String name;
  List<Photo> photo;
  List<String> regions;
  String status;
  String tenantId;
  List<String> territories;
  String updatedBy;
  DateTime updatedTimestamp;
  String uuid;

  TrapCrop({
    required this.createdBy,
    required this.createdTimestamp,
    required this.crops,
    required this.diseases,
    required this.insects,
    required this.methodOfPlanting,
    required this.name,
    required this.photo,
    required this.regions,
    required this.status,
    required this.tenantId,
    required this.territories,
    required this.updatedBy,
    required this.updatedTimestamp,
    required this.uuid,
  });

  factory TrapCrop.fromJson(Map<String, dynamic> json) {
    try {
      return TrapCrop(
        createdBy: json['createdBy'] != null ? json['createdBy'] as String : '',
        createdTimestamp: json['createdTimestamp'] != null
            ? DateTime.parse(json['createdTimestamp'])
            : DateTime.now(),
        crops: json['crops'] != null
            ? List<String>.from(json['crops'].map((x) => x))
            : [],
        diseases: json['diseases'] != null
            ? List<String>.from(json['diseases'].map((x) => x))
            : [],
        insects: json['insects'] != null
            ? List<String>.from(json['insects'].map((x) => x))
            : [],
        methodOfPlanting: json['methodOfPlanting'] != null
            ? json['methodOfPlanting'] as String
            : '',
        name: json['name'] != null ? json['name'] as String : '',
        photo: json['photo'] != null
            ? List<Photo>.from(json['photo'].map((x) => Photo.fromJson(x)))
            : [],
        regions: json['regions'] != null
            ? List<String>.from(json['regions'].map((x) => x))
            : [],
        status: json['status'] != null ? json['status'] as String : '',
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
      return TrapCrop(
        createdBy: json['createdBy'] != null ? json['createdBy'] as String : '',
        createdTimestamp: json['createdTimestamp'] != null
            ? DateTime.fromMillisecondsSinceEpoch(json['createdTimestamp'])
            : DateTime.now(),
        crops: json['crops'] != null
            ? List<String>.from(json['crops'].map((x) => x))
            : [],
        diseases: json['diseases'] != null
            ? List<String>.from(json['diseases'].map((x) => x))
            : [],
        insects: json['insects'] != null
            ? List<String>.from(json['insects'].map((x) => x))
            : [],
        methodOfPlanting: json['methodOfPlanting'] != null
            ? json['methodOfPlanting'] as String
            : '',
        name: json['name'] != null ? json['name'] as String : '',
        photo: json['photo'] != null
            ? List<Photo>.from(json['photo'].map((x) => Photo.fromJson(x)))
            : [],
        regions: json['regions'] != null
            ? List<String>.from(json['regions'].map((x) => x))
            : [],
        status: json['status'] != null ? json['status'] as String : '',
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
        "diseases": List<dynamic>.from(diseases.map((x) => x)),
        "insects": List<dynamic>.from(insects.map((x) => x)),
        "methodOfPlanting": methodOfPlanting,
        "name": name,
        "photo": List<dynamic>.from(photo.map((x) => x.toJson())),
        "regions": List<dynamic>.from(regions.map((x) => x)),
        "status": status,
        "tenantId": tenantId,
        "territories": List<dynamic>.from(territories.map((x) => x)),
        "updatedBy": updatedBy,
        "updatedTimestamp": updatedTimestamp.toIso8601String(),
        "uuid": uuid,
      };
}
