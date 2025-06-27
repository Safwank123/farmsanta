class YieldPotential {
  double? max;
  double? min;

  YieldPotential({this.max, this.min});

  YieldPotential.fromJson(Map<String, dynamic> json) {
    max = json['max'] != null ? json['max']?.toDouble() : null;
    min = json['min'] != null ? json['min']?.toDouble() : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['max'] = max;
    data['min'] = min;
    return data;
  }
}
