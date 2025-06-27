class CropName {
  String? stringValue;
  String? kind;

  CropName({this.stringValue, this.kind});

  CropName.fromJson(Map<String, dynamic> json) {
    stringValue =
        json['stringValue'] != null ? json['stringValue'] as String : null;
    kind = json['kind'] != null ? json['kind'] as String : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['stringValue'] = stringValue;
    data['kind'] = kind;
    return data;
  }
}
