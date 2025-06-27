class FeelsLike {
  num? day;
  num? night;
  num? eve;
  num? morn;

  FeelsLike({
    this.day,
    this.night,
    this.eve,
    this.morn,
  });

  FeelsLike.fromJson(Map<String, dynamic> json) {
    day = json['day'] != null ? json['day'] as num : null;
    night = json['night'] != null ? json['night'] as num : null;
    eve = json['eve'] != null ? json['eve'] as num : null;
    morn = json['morn'] != null ? json['morn'] as num : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['day'] = day;
    data['night'] = night;
    data['eve'] = eve;
    data['morn'] = morn;
    return data;
  }
}
