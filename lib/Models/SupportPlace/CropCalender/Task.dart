class Tasklist {
  int? id;
  String? oprationName;
  String? oprationDescription;
  List<String>? taskImages;
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

  factory Tasklist.fromJson(Map<String, dynamic> json) {
    return Tasklist(
      id: json["id"] is int ? json["id"] : int.tryParse(json["id"].toString()),
      oprationName: json["oprationName"] as String?,
      oprationDescription: json["oprationDescription"] as String?,
      taskImages: json["taskImages"] != null
          ? List<String>.from(json["taskImages"].map((x) => x.toString()))
          : [],
      taskSequance: json["taskSequance"] is int
          ? json["taskSequance"]
          : int.tryParse(json["taskSequance"].toString()),
      status: json["status"] == true || json["status"] == "true",
      oprationType: json["oprationType"] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "oprationName": oprationName,
      "oprationDescription": oprationDescription,
      "taskImages": taskImages ?? [],
      "taskSequance": taskSequance,
      "status": status,
      "oprationType": oprationType,
    };
  }
}

class Week {
  List<Tasklist>? tasklist;

  Week({this.tasklist});

  factory Week.fromJson(Map<String, dynamic> json) {
    return Week(
      tasklist: json['tasklist'] != null
          ? List<Tasklist>.from(
              json['tasklist'].map((x) => Tasklist.fromJson(x)))
          : [],
    );
  }

  Map<String, dynamic> toJson() => {
        "tasklist": tasklist?.map((x) => x.toJson()).toList(),
      };
}
