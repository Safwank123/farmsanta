
import 'Area.dart';

class Crop {
  final Area? area;
  final String comment;
  final String createdBy;
  final DateTime createdTimestamp;
  final String cropId;
  final String cropName;
  final String cropType;
  final String cultivar;
  final String cultivationType;
  final bool current;
  final int expectedYield;
  final DateTime harvestDate;
  final int id;
  final int plantSpacing;
  final int previousYield;
  final int rowSpacing;
  final DateTime sowingDate;
  final String stage;
  final String tenantId;
  final String updatedBy;
  final DateTime updatedTimestamp;
  final String uuid;
  final String variety;

  Crop({
    required this.area,
    required this.comment,
    required this.createdBy,
    required this.createdTimestamp,
    required this.cropId,
    required this.cropName,
    required this.cropType,
    required this.cultivar,
    required this.cultivationType,
    required this.current,
    required this.expectedYield,
    required this.harvestDate,
    required this.id,
    required this.plantSpacing,
    required this.previousYield,
    required this.rowSpacing,
    required this.sowingDate,
    required this.stage,
    required this.tenantId,
    required this.updatedBy,
    required this.updatedTimestamp,
    required this.uuid,
    required this.variety,
  });

  Map<String, dynamic> toMap() {
    return {
      'area': area!.toMap(),
      'comment': comment,
      'createdBy': createdBy,
      'createdTimestamp': createdTimestamp.millisecondsSinceEpoch,
      'cropId': cropId,
      'cropName': cropName,
      'cropType': cropType,
      'cultivar': cultivar,
      'cultivationType': cultivationType,
      'current': current,
      'expectedYield': expectedYield,
      'harvestDate': harvestDate.millisecondsSinceEpoch,
      'id': id,
      'plantSpacing': plantSpacing,
      'previousYield': previousYield,
      'rowSpacing': rowSpacing,
      'sowingDate': sowingDate.millisecondsSinceEpoch,
      'stage': stage,
      'tenantId': tenantId,
      'updatedBy': updatedBy,
      'updatedTimestamp': updatedTimestamp.millisecondsSinceEpoch,
      'uuid': uuid,
      'variety': variety,
    };
  }

  factory Crop.fromMap(Map<String, dynamic> map) {
    try {
      return Crop(
        area: map['area'] != null ? Area.fromMap(map['area']) : null,
        comment: map['comment'] ?? '',
        createdBy: map['createdBy'] ?? '',
        createdTimestamp: map['createdTimestamp'] != null
            ? DateTime.parse(map['createdTimestamp'])
            : DateTime.now(),
        cropId: map['cropId'] ?? '',
        cropName: map['cropName'] ?? '',
        cropType: map['cropType'] ?? '',
        cultivar: map['cultivar'] ?? '',
        cultivationType: map['cultivationType'] ?? '',
        current: map['current'] ?? false,
        expectedYield: map['expectedYield']?.toInt() ?? 0,
        harvestDate: map['harvestDate'] != null
            ? DateTime.parse(map['harvestDate'])
            : DateTime.now(),
        id: map['id']?.toInt() ?? 0,
        plantSpacing: map['plantSpacing']?.toInt() ?? 0,
        previousYield: map['previousYield']?.toInt() ?? 0,
        rowSpacing: map['rowSpacing']?.toInt() ?? 0,
        sowingDate: map['sowingDate'] != null
            ? DateTime.parse(map['sowingDate'])
            : DateTime.now(),
        stage: map['stage'] ?? '',
        tenantId: map['tenantId'] ?? '',
        updatedBy: map['updatedBy'] ?? '',
        updatedTimestamp: map['updatedTimestamp'] != null
            ? DateTime.parse(map['updatedTimestamp'])
            : DateTime.now(),
        uuid: map['uuid'] ?? '',
        variety: map['variety'] ?? '',
      );
    } catch (e) {
      return Crop(
        area: map['area'] != null ? Area.fromMap(map['area']) : null,
        comment: map['comment'] ?? '',
        createdBy: map['createdBy'] ?? '',
        createdTimestamp: map['createdTimestamp'] != null
            ? DateTime.fromMillisecondsSinceEpoch(map['createdTimestamp'])
            : DateTime.now(),
        cropId: map['cropId'] ?? '',
        cropName: map['cropName'] ?? '',
        cropType: map['cropType'] ?? '',
        cultivar: map['cultivar'] ?? '',
        cultivationType: map['cultivationType'] ?? '',
        current: map['current'] ?? false,
        expectedYield: map['expectedYield']?.toInt() ?? 0,
        harvestDate: map['harvestDate'] != null
            ? DateTime.fromMillisecondsSinceEpoch(map['harvestDate'])
            : DateTime.now(),
        id: map['id']?.toInt() ?? 0,
        plantSpacing: map['plantSpacing']?.toInt() ?? 0,
        previousYield: map['previousYield']?.toInt() ?? 0,
        rowSpacing: map['rowSpacing']?.toInt() ?? 0,
        sowingDate: map['sowingDate'] != null
            ? DateTime.fromMillisecondsSinceEpoch(map['sowingDate'])
            : DateTime.now(),
        stage: map['stage'] ?? '',
        tenantId: map['tenantId'] ?? '',
        updatedBy: map['updatedBy'] ?? '',
        updatedTimestamp: map['updatedTimestamp'] != null
            ? DateTime.fromMillisecondsSinceEpoch(map['updatedTimestamp'])
            : DateTime.now(),
        uuid: map['uuid'] ?? '',
        variety: map['variety'] ?? '',
      );
    }
  }

  Map<String, dynamic> toJson() => toMap();

  factory Crop.fromJson(Map<String, dynamic> source) => Crop.fromMap(source);
}
