class Weather {
  int dt;
  double temp;
  double longitude;
  double latitude;
  double pressure;
  double humidity;
  double wind;
  double uvi;
  double clouds;
  double visibility;
  String rain;

  Weather({
    required this.dt,
    required this.temp,
    required this.longitude,
    required this.latitude,
    required this.pressure,
    required this.humidity,
    required this.wind,
    required this.uvi,
    required this.clouds,
    required this.visibility,
    required this.rain,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      dt: json['dt'] != null ? json['dt'].toInt() : 0,
      temp: json['temp'] != null ? json['temp'].toDouble() : 0.0,
      longitude: json['longitude'] != null ? json['longitude'].toDouble() : 0.0,
      latitude: json['latitude'] != null ? json['latitude'].toDouble() : 0.0,
      pressure: json['pressure'] != null ? json['pressure'].toDouble() : 0.0,
      humidity: json['humidity'] != null ? json['humidity'].toDouble() : 0.0,
      wind: json['wind'] != null ? json['wind'].toDouble() : 0.0,
      uvi: json['uvi'] != null ? json['uvi'].toDouble() : 0.0,
      clouds: json['clouds'] != null ? json['clouds'].toDouble() : 0.0,
      visibility:
          json['visibility'] != null ? json['visibility'].toDouble() : 0.0,
      rain: json['rain'] != null ? json['rain'] as String : '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'dt': dt,
      'temp': temp,
      'longitude': longitude,
      'latitude': latitude,
      'pressure': pressure,
      'humidity': humidity,
      'wind': wind,
      'uvi': uvi,
      'clouds': clouds,
      'visibility': visibility,
      'rain': rain,
    };
  }
}
