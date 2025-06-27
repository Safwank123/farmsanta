import 'FeelsLike.dart';
import 'Temp.dart';
import 'WheatherDet.dart';

class Daily {
  num? dt;
  num? sunrise;
  num? sunset;
  num? moonrise;
  num? moonset;
  num? moonPhase;
  Temp? temp;
  FeelsLike? feelsLike;
  num? pressure;
  num? humidity;
  num? dewPoint;
  num? windSpeed;
  num? windDeg;
  num? windGust;
  List<WeatherDet>? weather;
  num? clouds;
  num? pop;
  num? rain;
  num? uvi;
  late bool isExpanded;

  Daily({
    this.dt,
    this.sunrise,
    this.sunset,
    this.moonrise,
    this.moonset,
    this.moonPhase,
    this.temp,
    this.feelsLike,
    this.pressure,
    this.humidity,
    this.dewPoint,
    this.windSpeed,
    this.windDeg,
    this.windGust,
    this.weather,
    this.clouds,
    this.pop,
    this.rain,
    this.uvi,
    this.isExpanded = false,
  });

  Daily.fromJson(Map<String, dynamic> json) {
    dt = json['dt'] != null ? json['dt'] as num : null;
    sunrise = json['sunrise'] != null ? json['sunrise'] as num : null;
    sunset = json['sunset'] != null ? json['sunset'] as num : null;
    moonrise = json['moonrise'] != null ? json['moonrise'] as num : null;
    moonset = json['moonset'] != null ? json['moonset'] as num : null;
    moonPhase = json['moon_phase'] != null ? json['moon_phase'] as num : null;
    temp = json['temp'] != null ? Temp.fromJson(json['temp']) : null;
    feelsLike = json['feels_like'] != null
        ? FeelsLike.fromJson(json['feels_like'])
        : null;
    pressure = json['pressure'] != null ? json['pressure'] as num : null;
    humidity = json['humidity'] != null ? json['humidity'] as num : null;
    dewPoint = json['dew_point'] != null ? json['dew_point'] as num : null;
    windSpeed = json['wind_speed'] != null ? json['wind_speed'] as num : null;
    windDeg = json['wind_deg'] != null ? json['wind_deg'] as num : null;
    windGust = json['wind_gust'] != null ? json['wind_gust'] as num : null;
    if (json['weather'] != null) {
      weather = <WeatherDet>[];
      json['weather'].forEach((v) {
        weather!.add(WeatherDet.fromJson(v));
      });
    }
    clouds = json['clouds'] != null ? json['clouds'] as num : null;
    pop = json['pop'] != null ? json['pop'] as num : null;
    rain = json['rain'] != null ? json['rain'] as num : null;
    uvi = json['uvi'] != null ? json['uvi'] as num : null;
    isExpanded = false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['dt'] = dt;
    data['sunrise'] = sunrise;
    data['sunset'] = sunset;
    data['moonrise'] = moonrise;
    data['moonset'] = moonset;
    data['moon_phase'] = moonPhase;
    if (temp != null) {
      data['temp'] = temp!.toJson();
    }
    if (feelsLike != null) {
      data['feels_like'] = feelsLike!.toJson();
    }
    data['pressure'] = pressure;
    data['humidity'] = humidity;
    data['dew_point'] = dewPoint;
    data['wind_speed'] = windSpeed;
    data['wind_deg'] = windDeg;
    data['wind_gust'] = windGust;
    if (weather != null) {
      data['weather'] = weather!.map((v) => v.toJson()).toList();
    }
    data['clouds'] = clouds;
    data['pop'] = pop;
    data['rain'] = rain;
    data['uvi'] = uvi;
    return data;
  }
}
