import 'WeatherAll.dart';

class WeatherData {
  List<ThunderStromItem?>? thunderStrom;
  List<RainItem?>? rain;
  String? irrigation;
  String? harvesting;
  WeatherAll? weatherDetails;
  String? weeding;
  String? pesticideApplication;
  String? title;
  String? message;

  WeatherData({
    this.thunderStrom,
    this.rain,
    this.irrigation,
    this.harvesting,
    this.weatherDetails,
    this.weeding,
    this.pesticideApplication,
    this.title,
    this.message,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      thunderStrom: json['thunderStrom'] != null
          ? (json['thunderStrom'] as List<dynamic>?)
              ?.map((e) => ThunderStromItem.fromJson(e))
              .toList()
          : null,
      rain: json['rain'] != null
          ? (json['rain'] as List<dynamic>?)
              ?.map((e) => RainItem.fromJson(e))
              .toList()
          : null,
      irrigation:
          json['irrigation'] != null ? json['irrigation'] as String : null,
      harvesting:
          json['harvesting'] != null ? json['harvesting'] as String : null,
      weatherDetails: json['weatherDetails'] != null
          ? WeatherAll.fromJson(json['weatherDetails'])
          : null,
      weeding: json['weeding'] != null ? json['weeding'] as String : null,
      pesticideApplication: json['pesticideApplication'] != null
          ? json['pesticideApplication'] as String
          : null,
      title: json['title'] != null ? json['title'] as String : null,
      message: json['message'] != null ? json['message'] as String : null,
    );
  }
}

class Rain {
  num? jsonMember1h;

  Rain({
    this.jsonMember1h,
  });

  factory Rain.fromJson(Map<String, dynamic> json) {
    return Rain(
      jsonMember1h: json['1h'] != null ? json['1h'] as num : null,
    );
  }
}

class ThunderStromItem {
  String? dayType;
  bool? thunderStrom;

  ThunderStromItem({
    this.dayType,
    this.thunderStrom,
  });

  factory ThunderStromItem.fromJson(Map<String, dynamic> json) {
    return ThunderStromItem(
      dayType: json['dayType'] != null ? json['dayType'] as String : null,
      thunderStrom:
          json['thunderStrom'] != null ? json['thunderStrom'] as bool : null,
    );
  }
}

class RainItem {
  String? dayType;
  bool? rain;
  String? rainType;

  RainItem({
    this.dayType,
    this.rain,
    this.rainType,
  });

  factory RainItem.fromJson(Map<String, dynamic> json) {
    return RainItem(
      dayType: json['dayType'] != null ? json['dayType'] as String : null,
      rain: json['rain'] != null ? json['rain'] as bool : null,
      rainType: json['rainType'] != null ? json['rainType'] as String : null,
    );
  }
}
