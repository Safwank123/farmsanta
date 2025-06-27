class ActiveHoursModel {
  final int min;
  final int max;

  ActiveHoursModel({
    required this.min,
    required this.max,
  });

  factory ActiveHoursModel.fromJson(Map<String, dynamic> json) {
    return ActiveHoursModel(
      min: json['min'] as int,
      max: json['max'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'min': min,
      'max': max,
    };
  }
}
