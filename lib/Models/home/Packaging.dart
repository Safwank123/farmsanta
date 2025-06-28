class Packaging {
  double? unit;
  String? uom;

  Packaging({
    this.unit,
    this.uom,
  });

  factory Packaging.fromJson(Map<String, dynamic> json) {
    return Packaging(
      unit: json['unit']?.toDouble(),
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
