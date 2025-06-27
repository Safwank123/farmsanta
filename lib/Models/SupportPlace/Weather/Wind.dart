class Wind {
  num? deg;
  num? speed;

  Wind({
    this.deg,
    this.speed,
  });

  factory Wind.fromJson(Map<String, dynamic> json) {
    return Wind(
      deg: json['deg'] != null ? json['deg'] as num : null,
      speed: json['speed'] != null ? json['speed'] as num : null,
    );
  }
}
