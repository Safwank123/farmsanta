

import 'package:farmsanta_new/Models/Profile/Stage.dart';

class CropStage {
  String? uuid;
  String? createdBy;
  String? updatedBy;
  String? createdTimestamp;
  String? updatedTimestamp;
  String? startDate;
  String? endDate;
  String? tenantId;
  String? crop;
  String? cultivarGroup;
  String? status;
  List<String>? cultivars;
  List<String>? territories;
  List<String>? regions;
  List<Stage>? stages;
  String? description;
  String? groupName;
  String? name;

  CropStage({
    this.uuid,
    this.createdBy,
    this.updatedBy,
    this.createdTimestamp,
    this.updatedTimestamp,
    this.startDate,
    this.endDate,
    this.tenantId,
    this.crop,
    this.cultivarGroup,
    this.status,
    this.cultivars,
    this.territories,
    this.regions,
    this.stages,
    this.description,
    this.groupName,
    this.name,
  });

  factory CropStage.fromJson(Map<String, dynamic> json) {
    return CropStage(
      uuid: json['uuid'] != null ? json['uuid'] as String : null,
      createdBy: json['createdBy'] != null ? json['createdBy'] as String : null,
      updatedBy: json['updatedBy'] != null ? json['updatedBy'] as String : null,
      createdTimestamp: json['createdTimestamp'] != null
          ? json['createdTimestamp'] as String
          : null,
      updatedTimestamp: json['updatedTimestamp'] != null
          ? json['updatedTimestamp'] as String
          : null,
      startDate: json['startDate'] != null ? json['startDate'] as String : null,
      endDate: json['endDate'] != null ? json['endDate'] as String : null,
      tenantId: json['tenantId'] != null ? json['tenantId'] as String : null,
      crop: json['crop'] != null ? json['crop'] as String : null,
      cultivarGroup: json['cultivarGroup'] != null
          ? json['cultivarGroup'] as String
          : null,
      status: json['status'] != null ? json['status'] as String : null,
      cultivars: json['cultivars'] != null
          ? List<String>.from(json['cultivars'] ?? [])
          : null,
      territories: json['territories'] != null
          ? List<String>.from(json['territories'] ?? [])
          : null,
      regions: json['regions'] != null
          ? List<String>.from(json['regions'] ?? [])
          : null,
      stages: json['stages'] != null
          ? List<Stage>.from(
              (json['stages'] ?? []).map((stage) => Stage.fromJson(stage)))
          : null,
      description:
          json['description'] != null ? json['description'] as String : null,
      groupName: json['groupName'] != null ? json['groupName'] as String : null,
      name: json['name'] != null ? json['name'] as String : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uuid': uuid,
      'createdBy': createdBy,
      'updatedBy': updatedBy,
      'createdTimestamp': createdTimestamp,
      'updatedTimestamp': updatedTimestamp,
      'startDate': startDate,
      'endDate': endDate,
      'tenantId': tenantId,
      'crop': crop,
      'cultivarGroup': cultivarGroup,
      'status': status,
      'cultivars': cultivars,
      'territories': territories,
      'regions': regions,
      'stages': stages?.map((stage) => stage.toJson()).toList(),
      'description': description,
      'groupName': groupName,
      'name': name,
    };
  }
}
