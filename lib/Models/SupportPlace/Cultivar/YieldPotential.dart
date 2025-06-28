class YieldPotential {
  double? max;
  double? min;

  YieldPotential({this.max, this.min});

  YieldPotential.fromJson(Map<String, dynamic> json) {
    max = json['max']?.toDouble();
    min = json['min']?.toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['max'] = max;
    data['min'] = min;
    return data;
  }
}
