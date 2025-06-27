import 'dart:convert';

class CouponModel {
  final String? uuid;
  final String name;
  final String description;
  final String code;
  final int validity;

  CouponModel({
    this.uuid,
    required this.name,
    required this.description,
    required this.code,
    required this.validity,
  });

  factory CouponModel.fromJson(Map<String, dynamic> json) {
    return CouponModel(
      uuid: json['uuid'] as String?,
      name: json['name'] as String,
      description: json['description'] as String,
      code: json['code'] as String,
      validity: json['validity'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uuid': uuid,
      'name': name,
      'description': description,
      'code': code,
      'validity': validity,
    };
  }

  // String toJson() => json.encode(toJson());

  factory CouponModel.fromJsonString(String jsonString) =>
      CouponModel.fromJson(json.decode(jsonString) as Map<String, dynamic>);
}
