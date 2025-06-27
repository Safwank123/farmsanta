class Main {
  late num? feelsLike;
  late num? humidity;
  late num? pressure;
  late num? temp;
  late num? tempMax;
  late num? tempMin;

  Main({
    required this.feelsLike,
    required this.humidity,
    required this.pressure,
    required this.temp,
    required this.tempMax,
    required this.tempMin,
  });

  factory Main.fromJson(Map<String, dynamic> json) {
    return Main(
      feelsLike: json['feels_like'] != null ? json['feels_like'] as num : null,
      humidity: json['humidity'] != null ? json['humidity'] as num : null,
      pressure: json['pressure'] != null ? json['pressure'] as num : null,
      temp: json['temp'] != null ? json['temp'] as num : null,
      tempMax: json['temp_max'] != null ? json['temp_max'] as num : null,
      tempMin: json['temp_min'] != null ? json['temp_min'] as num : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'feels_like': feelsLike,
      'humidity': humidity,
      'pressure': pressure,
      'temp': temp,
      'temp_max': tempMax,
      'temp_min': tempMin,
    };
  }
}
