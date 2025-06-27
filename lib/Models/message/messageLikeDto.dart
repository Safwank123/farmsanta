class MessageLikeDto {
  String createdBy;
  String createdTimestamp;
  String endDate;
  String messageId;
  String startDate;
  String tenantId;
  String updatedBy;
  String updatedTimestamp;
  String userName;
  String uuid;

  MessageLikeDto({
    required this.createdBy,
    required this.createdTimestamp,
    required this.endDate,
    required this.messageId,
    required this.startDate,
    required this.tenantId,
    required this.updatedBy,
    required this.updatedTimestamp,
    required this.userName,
    required this.uuid,
  });

  factory MessageLikeDto.fromJson(Map<String, dynamic> json) {
    return MessageLikeDto(
      createdBy: json['createdBy'] != null ? json['createdBy'] as String : '',
      createdTimestamp: json['createdTimestamp'] != null
          ? json['createdTimestamp'] as String
          : '',
      endDate: json['endDate'] != null ? json['endDate'] as String : '',
      messageId: json['messageId'] != null ? json['messageId'] as String : '',
      startDate: json['startDate'] != null ? json['startDate'] as String : '',
      tenantId: json['tenantId'] != null ? json['tenantId'] as String : '',
      updatedBy: json['updatedBy'] != null ? json['updatedBy'] as String : '',
      updatedTimestamp: json['updatedTimestamp'] != null
          ? json['updatedTimestamp'] as String
          : '',
      userName: json['userName'] != null ? json['userName'] as String : '',
      uuid: json['uuid'] != null ? json['uuid'] as String : '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'createdBy': createdBy,
      'createdTimestamp': createdTimestamp,
      'endDate': endDate,
      'messageId': messageId,
      'startDate': startDate,
      'tenantId': tenantId,
      'updatedBy': updatedBy,
      'updatedTimestamp': updatedTimestamp,
      'userName': userName,
      'uuid': uuid,
    };
  }
}
