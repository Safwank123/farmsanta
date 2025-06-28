class PreHarvestInterval {
  int? unit;
  String? uom;

  PreHarvestInterval({
    this.unit,
    this.uom,
  });

  factory PreHarvestInterval.fromJson(Map<String, dynamic> json) {
    return PreHarvestInterval(
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
