class Tasklist {
  int? id;
  String? oprationName;
  String? oprationDescription;
  List<dynamic>? taskImages;
  int? taskSequance;
  bool? status;
  String? oprationType;

  Tasklist({
    this.id,
    this.oprationName,
    this.oprationDescription,
    this.taskImages,
    this.taskSequance,
    this.status,
    this.oprationType,
  });

  factory Tasklist.fromJson(Map<String, dynamic> json) => Tasklist(
        id: json["id"] != null ? json["id"].toInt() : null,
        oprationName: json["oprationName"] != null
            ? json["oprationName"] as String
            : null,
        oprationDescription: json["oprationDescription"] != null
            ? json["oprationDescription"] as String
            : null,
        taskImages: json["taskImages"] == null
            ? null
            : List<dynamic>.from(json["taskImages"]!.map((x) => x)),
        taskSequance:
            json["taskSequance"] != null ? json["taskSequance"].toInt() : null,
        status: json["status"] != null ? json["status"] : null,
        oprationType: json["oprationType"] != null
            ? json["oprationType"] as String
            : null,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "oprationName": oprationName,
        "oprationDescription": oprationDescription,
        "taskImages": taskImages == null
            ? []
            : List<dynamic>.from(taskImages!.map((x) => x)),
        "taskSequance": taskSequance,
        "status": status,
        "oprationType": oprationType,
      };
}
