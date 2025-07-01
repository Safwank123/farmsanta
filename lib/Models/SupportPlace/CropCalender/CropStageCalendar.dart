import 'dart:convert';
import 'package:farmsanta_new/Models/SupportPlace/CropCalender/StageWeek.dart';

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

  CropStageCalendar({
    this.cropId,
    this.stageList,
    this.stageName,
    this.stageStatus,
    this.stageWeek,
    this.startEndDate,
    this.isCurrentTask = false,
  });

  factory CropStageCalendar.fromJson(Map<String, dynamic> json) =>
      CropStageCalendar(
        cropId: json["cropId"] as String?,
        stageList: json["stageList"] == null
            ? null
            : List<StageWeek>.from(
                json["stageList"].map((x) => StageWeek.fromJson(x))),
        stageName: json["stageName"] as String?,
        stageStatus: json["stageStatus"]?.toInt(),
        stageWeek: json["stageWeek"] as String?,
        startEndDate: json["startEndDate"] as String?,
        isCurrentTask: json["isCurrentTask"] ?? false,
      );

  Map<String, dynamic> toJson() => {
        "cropId": cropId,
        "stageList": stageList?.map((x) => x.toJson()).toList() ?? [],
        "stageName": stageName,
        "stageStatus": stageStatus,
        "stageWeek": stageWeek,
        "startEndDate": startEndDate,
        "isCurrentTask": isCurrentTask,
      };
}
