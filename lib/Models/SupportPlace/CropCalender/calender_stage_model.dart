import 'dart:convert';

import 'package:farmsanta_new/Models/SupportPlace/CropCalender/Task.dart';


CropStageCalendar calenderStageModelFromJson(String str) =>
    CropStageCalendar.fromJson(json.decode(str));

String calenderStageModelToJson(CropStageCalendar data) =>
    json.encode(data.toJson());

class CropStageCalendar {
  String? cropId;
  List<StageList>? stageList;
  String? stageName;
  int? stageStatus;
  String? stageWeek;
  bool isCurrentTask;

  CropStageCalendar(
      {this.cropId,
      this.stageList,
      this.stageName,
      this.stageStatus,
      this.stageWeek,
      this.isCurrentTask = false});

  factory CropStageCalendar.fromJson(Map<String, dynamic> json) =>
      CropStageCalendar(
        cropId: json["cropId"] != null ? json["cropId"] as String : null,
        stageList: json["stageList"] == null
            ? null
            : List<StageList>.from(
                json["stageList"]!.map((x) => StageList.fromJson(x))),
        stageName:
            json["stageName"] != null ? json["stageName"] as String : null,
        stageStatus:
            json["stageStatus"]?.toInt(),
        stageWeek:
            json["stageWeek"] != null ? json["stageWeek"] as String : null,
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
        "isCurrentTask": isCurrentTask
      };
}

class StageList {
  int? id;
  dynamic userId;
  bool? status;
  String? cropId;
  String? stageName;
  int? weekInfo;
  List<Tasklist>? tasklist;
  int? languageId;

  StageList({
    this.id,
    this.userId,
    this.status,
    this.cropId,
    this.stageName,
    this.weekInfo,
    this.tasklist,
    this.languageId,
  });

  factory StageList.fromJson(Map<String, dynamic> json) => StageList(
        id: json["id"]?.toInt(),
        userId: json["userId"],
        status: json["status"],
        cropId: json["cropId"] != null ? json["cropId"] as String : null,
        stageName:
            json["stageName"] != null ? json["stageName"] as String : null,
        weekInfo: json["weekInfo"]?.toInt(),
        tasklist: json["tasklist"] == null
            ? null
            : List<Tasklist>.from(
                json["tasklist"]!.map((x) => Tasklist.fromJson(x))),
        languageId:
            json["languageId"]?.toInt(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "status": status,
        "cropId": cropId,
        "stageName": stageName,
        "weekInfo": weekInfo,
        "tasklist": tasklist == null
            ? []
            : List<dynamic>.from(tasklist!.map((x) => x.toJson())),
        "languageId": languageId,
      };
}
