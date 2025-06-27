class Parameter {
  String? parameter;
  double? value;
  String? unit;
  String? rating;
  NormalValue? normalValue;

  Parameter({
    this.parameter,
    this.value,
    this.unit,
    this.rating,
    this.normalValue,
  });

  factory Parameter.fromJson(Map<String, dynamic> json) {
    return Parameter(
      parameter: json['parameter'] != null ? json['parameter'] as String : null,
      value: json['value'] != null ? json['value'] as double : null,
      unit: json['unit'] != null ? json['unit'] as String : null,
      rating: json['rating'] != null ? json['rating'] as String : null,
      normalValue: json['normalValue'] != null
          ? NormalValue.fromJson(json['normalValue'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['parameter'] = parameter;
    data['value'] = value;
    data['unit'] = unit;
    data['rating'] = rating;
    if (normalValue != null) {
      data['normalValue'] = normalValue!.toJson();
    }
    return data;
  }
}

class NormalValue {
  double? minValue;
  double? maxValue;

  NormalValue({
    this.minValue,
    this.maxValue,
  });

  factory NormalValue.fromJson(Map<String, dynamic> json) {
    return NormalValue(
      minValue: json['minValue'] != null ? json['minValue'] as double : null,
      maxValue: json['maxValue'] != null ? json['maxValue'] as double : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['minValue'] = minValue;
    data['maxValue'] = maxValue;
    return data;
  }
}
