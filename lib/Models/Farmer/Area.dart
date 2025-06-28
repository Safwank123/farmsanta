class Area {
  final int unit;
  final String uom;

  Area({required this.unit, required this.uom});

  factory Area.fromMap(Map<String, dynamic> json) {
    return Area(
      unit: json['unit']?.toInt() ?? 0,
      uom: json['uom'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['unit'] = unit;
    data['uom'] = uom;
    return data;
  }

  Map<String, dynamic> toJson() => toMap();

  factory Area.fromJson(Map<String, dynamic> source) => Area.fromMap(source);
}
