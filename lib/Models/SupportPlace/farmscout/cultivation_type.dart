class CultivationType {
  String id;
  Object userId;
  String lastUpdated;
  String type;
  String value;
  String parentType;
  String parentValue;
  Object attributes;

  CultivationType({
    required this.id,
    required this.userId,
    required this.lastUpdated,
    required this.type,
    required this.value,
    required this.parentType,
    required this.parentValue,
    required this.attributes,
  });

  factory CultivationType.fromJson(Map<String, dynamic> json) {
    return CultivationType(
      id: json['id'] != null ? json['id'] as String : '',
      userId: json['userId'] != null ? json['userId'] : null,
      lastUpdated:
          json['lastUpdated'] != null ? json['lastUpdated'] as String : '',
      type: json['type'] != null ? json['type'] as String : '',
      value: json['value'] != null ? json['value'] as String : '',
      parentType:
          json['parentType'] != null ? json['parentType'] as String : '',
      parentValue:
          json['parentValue'] != null ? json['parentValue'] as String : '',
      attributes: json['attributes'] != null ? json['attributes'] : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['userId'] = userId;
    data['lastUpdated'] = lastUpdated;
    data['type'] = type;
    data['value'] = value;
    data['parentType'] = parentType;
    data['parentValue'] = parentValue;
    data['attributes'] = attributes;
    return data;
  }
}
