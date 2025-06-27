import 'Alert.dart';
import 'Current.dart';
import 'Daily.dart';
import 'Hourly.dart';
import 'Location.dart';
import 'Minutely.dart';

class WeatherAll {
  num? lat;
  num? lon;
  Location? location;
  String? timezone;
  num? timezoneOffset;
  Current? current;
  List<Minutely>? minutely;
  List<Hourly>? hourly;
  List<Daily>? daily;
  List<Alert>? alerts;
  bool isExpanded;

  WeatherAll({
    this.lat,
    this.lon,
    this.location,
    this.timezone,
    this.timezoneOffset,
    this.current,
    this.minutely,
    this.hourly,
    this.daily,
    this.alerts,
    this.isExpanded = false,
  });

  factory WeatherAll.fromJson(Map<String, dynamic> json) {
    return WeatherAll(
      lat: json['lat'] != null ? json['lat'] as num : null,
      lon: json['lon'] != null ? json['lon'] as num : null,
      location:
          json['location'] != null ? Location.fromJson(json['location']) : null,
      timezone: json['timezone'] != null ? json['timezone'] as String : null,
      timezoneOffset: json['timezone_offset'] != null
          ? json['timezone_offset'] as num
          : null,
      current:
          json['current'] != null ? Current.fromJson(json['current']) : null,
      minutely: json['minutely'] != null
          ? (json['minutely'] as List<dynamic>?)
              ?.map((e) => Minutely.fromJson(e as Map<String, dynamic>))
              .toList()
          : null,
      hourly: json['hourly'] != null
          ? (json['hourly'] as List<dynamic>?)
              ?.map((e) => Hourly.fromJson(e as Map<String, dynamic>))
              .toList()
          : null,
      daily: json['daily'] != null
          ? (json['daily'] as List<dynamic>?)
              ?.map((e) => Daily.fromJson(e as Map<String, dynamic>))
              .toList()
          : null,
      alerts: json['alerts'] != null
          ? (json['alerts'] as List<dynamic>?)
              ?.map((e) => Alert.fromJson(e as Map<String, dynamic>))
              .toList()
          : null,
      isExpanded: json['isExpanded'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['lat'] = lat;
    data['lon'] = lon;
    if (location != null) {
      data['location'] = location!.toJson();
    }
    data['timezone'] = timezone;
    data['timezone_offset'] = timezoneOffset;
    if (current != null) {
      data['current'] = current!.toJson();
    }
    if (minutely != null) {
      data['minutely'] = minutely!.map((e) => e.toJson()).toList();
    }
    if (hourly != null) {
      data['hourly'] = hourly!.map((e) => e.toJson()).toList();
    }
    if (daily != null) {
      data['daily'] = daily!.map((e) => e.toJson()).toList();
    }
    if (alerts != null) {
      data['alerts'] = alerts!.map((e) => e.toJson()).toList();
    }
    data['isExpanded'] = isExpanded;
    return data;
  }
}
