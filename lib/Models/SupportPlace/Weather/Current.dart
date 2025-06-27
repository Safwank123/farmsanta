import 'WheatherDet.dart';

class Current {
  num? dt;
  num? sunrise;
  num? sunset;
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
  Object? rain;

  Current({
    this.dt,
    this.sunrise,
    this.sunset,
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
    this.rain,
  });

  Current.fromJson(Map<String, dynamic> json) {
    dt = json['dt'] != null ? json['dt'] as num : null;
    sunrise = json['sunrise'] != null ? json['sunrise'] as num : null;
    sunset = json['sunset'] != null ? json['sunset'] as num : null;
    temp = json['temp'] != null ? json['temp'] as num : null;
    feelsLike = json['feels_like'] != null ? json['feels_like'] as num : null;
    pressure = json['pressure'] != null ? json['pressure'] as num : null;
    humidity = json['humidity'] != null ? json['humidity'] as num : null;
    dewPoint = json['dew_point'] != null ? json['dew_point'] as num : null;
    uvi = json['uvi'] != null ? json['uvi'] as num : null;
    clouds = json['clouds'] != null ? json['clouds'] as num : null;
    visibility = json['visibility'] != null ? json['visibility'] as num : null;
    windSpeed = json['wind_speed'] != null ? json['wind_speed'] as num : null;
    windDeg = json['wind_deg'] != null ? json['wind_deg'] as num : null;
    windGust = json['wind_gust'] != null ? json['wind_gust'] as num : null;
    if (json['weather'] != null) {
      weather = <WeatherDet>[];
      json['weather'].forEach((v) {
        weather!.add(WeatherDet.fromJson(v));
      });
    }
    rain = json['rain'] != null ? json['rain'] : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['dt'] = dt;
    data['sunrise'] = sunrise;
    data['sunset'] = sunset;
    data['temp'] = temp;
    data['feels_like'] = feelsLike;
    data['pressure'] = pressure;
    data['humidity'] = humidity;
    data['dew_point'] = dewPoint;
    data['uvi'] = uvi;
    data['clouds'] = clouds;
    data['visibility'] = visibility;
    data['wind_speed'] = windSpeed;
    data['wind_deg'] = windDeg;
    data['wind_gust'] = windGust;
    if (weather != null) {
      data['weather'] = weather!.map((v) => v.toJson()).toList();
    }
    data['rain'] = rain;
    return data;
  }
}
