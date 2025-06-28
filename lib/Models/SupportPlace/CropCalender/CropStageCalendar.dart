import 'dart:convert';


import 'package:farmsanta_new/Models/SupportPlace/CropCalender/StageWeek.dart';

import 'Task.dart';

CropStageCalendar cropStageCalendarFromJson(String str) =>
    CropStageCalendar.fromJson(json.decode(str));

String cropStageCalendarToJson(CropStageCalendar data) =>
    json.encode(data.toJson());

class CropStageCalendar {
  String? cropId;
  List<StageWeek>? stageList;
  String? stageName;
  int? stageStatus;
  String? stageWeek;
  String? startEndDate;
  bool isCurrentTask;

  CropStageCalendar(
      {this.cropId,
      this.stageList,
      this.stageName,
      this.stageStatus,
      this.stageWeek,
      this.startEndDate,
      this.isCurrentTask = false});

  factory CropStageCalendar.fromJson(Map<String, dynamic> json) =>
      CropStageCalendar(
        cropId: json["cropId"] != null ? json["cropId"] as String : null,
        stageList: json["stageList"] == null
            ? null
            : List<StageWeek>.from(
                json["stageList"]!.map((x) => StageWeek.fromJson(x))),
        stageName:
            json["stageName"] != null ? json["stageName"] as String : null,
        stageStatus:
            json["stageStatus"]?.toInt(),
        stageWeek:
            json["stageWeek"] != null ? json["stageWeek"] as String : null,
        startEndDate: json["startEndDate"] != null
            ? json["startEndDate"] as String
            : null,
        isCurrentTask:
            json["isCurrentTask"] ?? false,
      );

  Map<String, dynamic> toJson() => {
        "cropId": cropId,
        "stageList": stageList == null
            ? []
            : List<dynamic>.from(stageList!.map((x) => x.toJson())),
        "stageName": stageName,
        "stageStatus": stageStatus,
        "stageWeek": stageWeek,
        "startEndDate": startEndDate,
        "isCurrentTask": isCurrentTask
      };
}
