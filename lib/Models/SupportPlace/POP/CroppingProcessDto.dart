import 'PopDto.dart';
import 'Process.dart';

class CroppingProcessDto {
  DateTime createDate;
  String createdBy;
  String crop;
  String description;
  int id;
  int languageId;
  DateTime modifiedDate;
  List<Process> processlist;
  bool status;
  String territory;

  CroppingProcessDto({
    required this.createDate,
    required this.createdBy,
    required this.crop,
    required this.description,
    required this.id,
    required this.languageId,
    required this.modifiedDate,
    required this.processlist,
    required this.status,
    required this.territory,
  });

  factory CroppingProcessDto.fromJson(Map<String, dynamic> json) {
    try {
      return CroppingProcessDto(
        createDate: json["createDate"] != null
            ? DateTime.parse(json["createDate"])
            : DateTime.now(),
        createdBy: json["createdBy"] != null ? json["createdBy"] as String : '',
        crop: json["crop"] != null ? json["crop"] as String : '',
        description:
            json["description"] != null ? json["description"] as String : '',
        id: json["id"] != null ? json["id"].toInt() : 0,
        languageId: json["languageId"] != null ? json["languageId"].toInt() : 0,
        modifiedDate: json["modifiedDate"] != null
            ? DateTime.parse(json["modifiedDate"])
            : DateTime.now(),
        processlist: json["processlist"] != null
            ? List<Process>.from(
                json["processlist"].map((x) => Process.fromJson(x)))
            : [],
        status: json["status"] != null ? json["status"] : false,
        territory: json["territory"] != null ? json["territory"] as String : '',
      );
    } catch (e) {
      return CroppingProcessDto(
        createDate: json["createDate"] != null
            ? DateTime.fromMillisecondsSinceEpoch(json["createDate"])
            : DateTime.now(),
        createdBy: json["createdBy"] != null ? json["createdBy"] as String : '',
        crop: json["crop"] != null ? json["crop"] as String : '',
        description:
            json["description"] != null ? json["description"] as String : '',
        id: json["id"] != null ? json["id"].toInt() : 0,
        languageId: json["languageId"] != null ? json["languageId"].toInt() : 0,
        modifiedDate: json["modifiedDate"] != null
            ? DateTime.fromMillisecondsSinceEpoch(json["modifiedDate"])
            : DateTime.now(),
        processlist: json["processlist"] != null
            ? List<Process>.from(
                json["processlist"].map((x) => Process.fromJson(x)))
            : [],
        status: json["status"] != null ? json["status"] : false,
        territory: json["territory"] != null ? json["territory"] as String : '',
      );
    }
  }

  Map<String, dynamic> toJson() => {
        "createDate": createDate.toIso8601String(),
        "createdBy": createdBy,
        "crop": crop,
        "description": description,
        "id": id,
        "languageId": languageId,
        "modifiedDate": modifiedDate.toIso8601String(),
        "processlist": List<dynamic>.from(processlist.map((x) => x.toJson())),
        "status": status,
        "territory": territory,
      };
}
