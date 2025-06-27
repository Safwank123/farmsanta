class BookMark {
  String? bookmarkType;
  String? referenceUUID;
  String? uuid;
  String? createdBy;
  String? updatedBy;
  String? createdTimestamp;
  String? updatedTimestamp;
  String? tenantId;
  String? username;

  BookMark({
    this.bookmarkType,
    this.referenceUUID,
    this.uuid,
    this.createdBy,
    this.updatedBy,
    this.createdTimestamp,
    this.updatedTimestamp,
    this.tenantId,
    this.username,
  });

  factory BookMark.fromJson(Map<String, dynamic> json) {
    return BookMark(
      bookmarkType:
          json['bookmarkType'] != null ? json['bookmarkType'] as String : null,
      referenceUUID: json['referenceUUID'] != null
          ? json['referenceUUID'] as String
          : null,
      uuid: json['uuid'] != null ? json['uuid'] as String : null,
      createdBy: json['createdBy'] != null ? json['createdBy'] as String : null,
      updatedBy: json['updatedBy'] != null ? json['updatedBy'] as String : null,
      createdTimestamp: json['createdTimestamp'] != null
          ? json['createdTimestamp'] as String
          : null,
      updatedTimestamp: json['updatedTimestamp'] != null
          ? json['updatedTimestamp'] as String
          : null,
      tenantId: json['tenantId'] != null ? json['tenantId'] as String : null,
      username: json['username'] != null ? json['username'] as String : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['bookmarkType'] = bookmarkType;
    data['referenceUUID'] = referenceUUID;
    data['uuid'] = uuid;
    data['createdBy'] = createdBy;
    data['updatedBy'] = updatedBy;
    data['createdTimestamp'] = createdTimestamp;
    data['updatedTimestamp'] = updatedTimestamp;
    data['tenantId'] = tenantId;
    data['username'] = username;
    return data;
  }
}
