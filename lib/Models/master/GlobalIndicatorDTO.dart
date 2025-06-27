class GlobalIndicatorDTO {
  String? uuid;
  dynamic createdBy;
  dynamic updatedBy;
  DateTime? createdTimestamp;
  DateTime? updatedTimestamp;
  DateTime startDate;
  DateTime endDate;
  dynamic tenantId;
  int? sequenceNumber;
  String? name;
  String? description;
  String? groupName;
  String? status;
  dynamic globalIndicatorUuid;

  GlobalIndicatorDTO({
    this.uuid,
    this.createdBy,
    this.updatedBy,
    this.createdTimestamp,
    this.updatedTimestamp,
    required this.startDate,
    required this.endDate,
    this.tenantId,
    this.sequenceNumber,
    this.name,
    this.description,
    this.groupName,
    this.status,
    this.globalIndicatorUuid,
  });

  factory GlobalIndicatorDTO.fromJson(Map<String, dynamic> json) {
    try {
      return GlobalIndicatorDTO(
        uuid: json['uuid'] != null ? json['uuid'] as String : null,
        createdBy: json['createdBy'],
        updatedBy: json['updatedBy'],
        createdTimestamp: json['createdTimestamp'] != null
            ? DateTime.parse(json['createdTimestamp'])
            : null,
        updatedTimestamp: json['updatedTimestamp'] != null
            ? DateTime.parse(json['updatedTimestamp'])
            : null,
        startDate: json['startDate'] != null
            ? DateTime.parse(json['startDate'])
            : DateTime.now(),
        endDate: json['endDate'] != null
            ? DateTime.parse(json['endDate'])
            : DateTime.now(),
        tenantId: json['tenantId'],
        sequenceNumber: json['sequenceNumber'] != null
            ? json['sequenceNumber'].toInt()
            : null,
        name: json['name'] != null ? json['name'] as String : null,
        description:
            json['description'] != null ? json['description'] as String : null,
        groupName:
            json['groupName'] != null ? json['groupName'] as String : null,
        status: json['status'] != null ? json['status'] as String : null,
        globalIndicatorUuid: json['globalIndicatorUuid'],
      );
    } catch (e) {
      return GlobalIndicatorDTO(
        uuid: json['uuid'] != null ? json['uuid'] as String : null,
        createdBy: json['createdBy'],
        updatedBy: json['updatedBy'],
        createdTimestamp: json['createdTimestamp'] != null
            ? DateTime.fromMillisecondsSinceEpoch(json['createdTimestamp'])
            : null,
        updatedTimestamp: json['updatedTimestamp'] != null
            ? DateTime.fromMillisecondsSinceEpoch(json['updatedTimestamp'])
            : null,
        startDate: json['startDate'] != null
            ? DateTime.fromMillisecondsSinceEpoch(json['startDate'])
            : DateTime.now(),
        endDate: json['endDate'] != null
            ? DateTime.fromMillisecondsSinceEpoch(json['endDate'])
            : DateTime.now(),
        tenantId: json['tenantId'],
        sequenceNumber: json['sequenceNumber'] != null
            ? json['sequenceNumber'].toInt()
            : null,
        name: json['name'] != null ? json['name'] as String : null,
        description:
            json['description'] != null ? json['description'] as String : null,
        groupName:
            json['groupName'] != null ? json['groupName'] as String : null,
        status: json['status'] != null ? json['status'] as String : null,
        globalIndicatorUuid: json['globalIndicatorUuid'],
      );
    }
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
      'sequenceNumber': sequenceNumber,
      'name': name,
      'description': description,
      'groupName': groupName,
      'status': status,
      'globalIndicatorUuid': globalIndicatorUuid,
    };
  }
}
