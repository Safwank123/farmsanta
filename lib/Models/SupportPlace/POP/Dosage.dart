class Dosage {
  int unit;
  String uom;
  Dosage({
    required this.unit,
    required this.uom,
  });

  factory Dosage.fromJson(Map<String, dynamic> json) => Dosage(
        unit: json["unit"] != null ? json["unit"].toInt() : 0,
        uom: json["uom"] != null ? json["uom"] as String : '',
      );

  Map<String, dynamic> toJson() => {
        "unit": unit,
        "uom": uom,
      };
}
