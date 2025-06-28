class WaterRequirement {
  int? unit;
  String? uom;

  WaterRequirement({this.unit, this.uom});

  WaterRequirement.fromJson(Map<String, dynamic> json) {
    unit = json['unit']?.toInt();
    uom = json['uom'] != null ? json['uom'] as String : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['unit'] = unit;
    data['uom'] = uom;
    return data;
  }
}
