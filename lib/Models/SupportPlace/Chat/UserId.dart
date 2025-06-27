class UserId {
  String? stringValue;
  String? kind;

  UserId({this.stringValue, this.kind});

  UserId.fromJson(Map<String, dynamic> json) {
    stringValue =
        json['stringValue'] != null ? json['stringValue'] as String : null;
    kind = json['kind'] != null ? json['kind'] : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['stringValue'] = stringValue;
    data['kind'] = kind;
    return data;
  }
}
