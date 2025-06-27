import 'Task.dart';

class StageWeek {
  int? id;
  dynamic userId;
  bool? status;
  String? cropId;
  String? stageName;
  int? weekInfo;
  List<Tasklist>? tasklist;
  int? languageId;

  StageWeek({
    this.id,
    this.userId,
    this.status,
    this.cropId,
    this.stageName,
    this.weekInfo,
    this.tasklist,
    this.languageId,
  });

  factory StageWeek.fromJson(Map<String, dynamic> json) => StageWeek(
        id: json["id"] != null ? json["id"].toInt() : null,
        userId: json["userId"],
        status: json["status"] != null ? json["status"] : null,
        cropId: json["cropId"] != null ? json["cropId"] as String : null,
        stageName:
            json["stageName"] != null ? json["stageName"] as String : null,
        weekInfo: json["weekInfo"] != null ? json["weekInfo"].toInt() : null,
        tasklist: json["tasklist"] == null
            ? null
            : List<Tasklist>.from(
                json["tasklist"]!.map((x) => Tasklist.fromJson(x))),
        languageId:
            json["languageId"] != null ? json["languageId"].toInt() : null,
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
