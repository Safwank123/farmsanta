import 'dart:convert';
import 'package:intl/intl.dart'; // Required for formatting month names

CropCalendar cropCalendarFromJson(String str) =>
    CropCalendar.fromJson(json.decode(str));

String cropCalendarToJson(CropCalendar data) => json.encode(data.toJson());

class CropCalendar {
  String? cropId;
  int? id;
  int? stageId;
  DateTime? startDate;
  String? userId;

  CropCalendar({
    this.cropId,
    this.id,
    this.stageId,
    this.startDate,
    this.userId,
  });

  /// ✅ Computed month getter from startDate
  String get month {
    if (startDate != null) {
      return DateFormat.MMMM().format(startDate!); // Example: "June"
    }
    return 'Unknown';
  }

  factory CropCalendar.fromJson(Map<String, dynamic> json) {
    try {
      return CropCalendar(
        cropId: json["cropId"] != null ? json["cropId"] as String : null,
        id: json["id"]?.toInt(),
        stageId: json["stageId"]?.toInt(),
        startDate: json["startDate"] == null
            ? null
            : DateTime.parse(json["startDate"]),
        userId: json["userId"] != null ? json["userId"] as String : null,
      );
    } catch (e) {
      return CropCalendar(
        cropId: json["cropId"] != null ? json["cropId"] as String : null,
        id: json["id"]?.toInt(),
        stageId: json["stageId"]?.toInt(),
        startDate: json["startDate"] == null
            ? null
            : DateTime.fromMillisecondsSinceEpoch(json["startDate"]),
        userId: json["userId"] != null ? json["userId"] as String : null,
      );
    }
  }

  Map<String, dynamic> toJson() => {
        "cropId": cropId,
        "id": id,
        "stageId": stageId,
        "startDate": startDate?.toIso8601String(),
        "userId": userId,
      };
}
