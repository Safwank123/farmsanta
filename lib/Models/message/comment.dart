class Comment {
  String comment;
  String createdBy;
  String createdTimestamp;
  String endDate;
  String messageId;
  String startDate;
  String tenantId;
  String updatedBy;
  String updatedTimestamp;
  String userName;
  String firstName;
  String lastName;
  String uuid;
  String profileImage;
  bool agronomyManager;

  Comment({
    required this.comment,
    required this.createdBy,
    required this.createdTimestamp,
    required this.endDate,
    required this.messageId,
    required this.startDate,
    required this.tenantId,
    required this.updatedBy,
    required this.updatedTimestamp,
    required this.userName,
    required this.firstName,
    required this.lastName,
    required this.uuid,
    required this.profileImage,
    required this.agronomyManager,
  });

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        comment: json['comment'] != null ? json['comment'] as String : '',
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
        firstName: json['firstName'] != null ? json['firstName'] as String : '',
        lastName: json['lastName'] != null ? json['lastName'] as String : '',
        uuid: json['uuid'] != null ? json['uuid'] as String : '',
        profileImage:
            json['profileImage'] != null ? json['profileImage'] as String : '',
        agronomyManager: json['agronomyManager'] ?? false,
      );

  Map<String, dynamic> toJson() => {
        'comment': comment,
        'createdBy': createdBy,
        'createdTimestamp': createdTimestamp,
        'endDate': endDate,
        'messageId': messageId,
        'startDate': startDate,
        'tenantId': tenantId,
        'updatedBy': updatedBy,
        'updatedTimestamp': updatedTimestamp,
        'userName': userName,
        'firstName': firstName,
        'lastName': lastName,
        'uuid': uuid,
        'profileImage': profileImage,
        'agronomyManager': agronomyManager,
      };
}
