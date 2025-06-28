import 'WheatherDet.dart';

class Hourly {
  num? dt;
  num? temp;
  num? feelsLike;
  num? pressure;
  num? humidity;
  num? dewPoint;
  num? uvi;
  num? clouds;
  num? visibility;
  num? windSpeed;
  num? windDeg;
  num? windGust;
  List<WeatherDet>? weather;
  num? pop;
  Object? rain;
  num? sunrise;
  num? sunset;
  num? moonrise;
  num? moonset;
  num? moonPhase;
  bool isExpanded;

  Hourly({
    this.dt,
    this.temp,
    this.feelsLike,
    this.pressure,
    this.humidity,
    this.dewPoint,
    this.uvi,
    this.clouds,
    this.visibility,
    this.windSpeed,
    this.windDeg,
    this.windGust,
    this.weather,
    this.pop,
    this.rain,
    this.sunrise,
    this.sunset,
    this.moonrise,
    this.moonset,
    this.moonPhase,
    this.isExpanded = false,
  });

  factory Hourly.fromJson(Map<String, dynamic> json) {
    return Hourly(
      dt: json['dt'] != null ? json['dt'] as num : null,
      temp: json['temp'] != null ? json['temp'] as num : null,
      feelsLike: json['feels_like'] != null ? json['feels_like'] as num : null,
      pressure: json['pressure'] != null ? json['pressure'] as num : null,
      humidity: json['humidity'] != null ? json['humidity'] as num : null,
      dewPoint: json['dew_point'] != null ? json['dew_point'] as num : null,
      uvi: json['uvi'] != null ? json['uvi'] as num : null,
      clouds: json['clouds'] != null ? json['clouds'] as num : null,
      visibility: json['visibility'] != null ? json['visibility'] as num : null,
      windSpeed: json['wind_speed'] != null ? json['wind_speed'] as num : null,
      windDeg: json['wind_deg'] != null ? json['wind_deg'] as num : null,
      windGust: json['wind_gust'] != null ? json['wind_gust'] as num : null,
      weather: json['weather'] != null
          ? (json['weather'] as List<dynamic>?)
              ?.map((e) => WeatherDet.fromJson(e))
              .toList()
          : null,
      pop: json['pop'] != null ? json['pop'] as num : null,
      rain: json['rain'],
      sunrise: json['sunrise'] != null ? json['sunrise'] as num : null,
      sunset: json['sunset'] != null ? json['sunset'] as num : null,
      moonrise: json['moonrise'] != null ? json['moonrise'] as num : null,
      moonset: json['moonset'] != null ? json['moonset'] as num : null,
      moonPhase: json['moon_phase'] != null ? json['moon_phase'] as num : null,
      isExpanded: false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'dt': dt,
      'temp': temp,
      'feels_like': feelsLike,
      'pressure': pressure,
      'humidity': humidity,
      'dew_point': dewPoint,
      'uvi': uvi,
      'clouds': clouds,
      'visibility': visibility,
      'wind_speed': windSpeed,
      'wind_deg': windDeg,
      'wind_gust': windGust,
      'weather': weather?.map((e) => e.toJson()).toList(),
      'pop': pop,
      'rain': rain,
      'sunrise': sunrise,
      'sunset': sunset,
      'moonrise': moonrise,
      'moonset': moonset,
      'moon_phase': moonPhase,
    };
  }
}
