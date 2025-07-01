import 'dart:convert';
import 'package:intl/intl.dart';

CropCalendar cropCalendarFromJson(String str) =>
    CropCalendar.fromJson(json.decode(str));

String cropCalendarToJson(CropCalendar data) => json.encode(data.toJson());

class CropCalendar {
  String? cropId;
  int? id;
  int? stageId;
  DateTime? startDate;
  String? userId;

  String? cropName;       // ✅ Added
  String? imagePath;      // ✅ Added
  String? notes;          // ✅ Added
  String? location;       // ✅ Added
  int? durationInDays;    // ✅ Added

  CropCalendar({
    this.cropId,
    this.id,
    this.stageId,
    this.startDate,
    this.userId,
    this.cropName,
    this.imagePath,
    this.notes,
    this.location,
    this.durationInDays,
  });

  /// ✅ Month name from startDate (e.g., "July")
  String get month {
    if (startDate != null) {
      return DateFormat.MMMM().format(startDate!);
    }
    return 'Unknown';
  }

  /// ✅ Convert JSON to CropCalendar object
  factory CropCalendar.fromJson(Map<String, dynamic> json) {
    try {
      return CropCalendar(
        cropId: json["cropId"] as String?,
        id: json["id"]?.toInt(),
        stageId: json["stageId"]?.toInt(),
        startDate: json["startDate"] == null
            ? null
            : DateTime.tryParse(json["startDate"]),
        userId: json["userId"] as String?,
        cropName: json["cropName"] as String?,
        imagePath: json["imagePath"] as String?,
        notes: json["notes"] as String?,
        location: json["location"] as String?,
        durationInDays: json["durationInDays"]?.toInt(),
      );
    } catch (_) {
      return CropCalendar(); // Fallback empty object
    }
  }

  /// ✅ Convert CropCalendar object to JSON map
  Map<String, dynamic> toJson() => {
        "cropId": cropId,
        "id": id,
        "stageId": stageId,
        "startDate": startDate?.toIso8601String(),
        "userId": userId,
        "cropName": cropName,
        "imagePath": imagePath,
        "notes": notes,
        "location": location,
        "durationInDays": durationInDays,
      };
}
