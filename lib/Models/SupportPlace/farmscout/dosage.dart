class Dosage {
  int? unit;
  String? uom;

  Dosage({this.unit, this.uom});

  factory Dosage.fromJson(Map<String, dynamic> json) {
    return Dosage(
      unit: json['unit']?.toInt(),
      uom: json['uom'] != null ? json['uom'] as String : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'unit': unit,
      'uom': uom,
    };
  }
}
