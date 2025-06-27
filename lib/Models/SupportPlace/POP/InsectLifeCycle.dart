import '../../Common/photo_model.dart';

class InsectLifeCycle {
  String characteristics;
  String lifecycleStage;
  Photo? photo;
  String symptomsOfAttack;

  InsectLifeCycle({
    required this.characteristics,
    required this.lifecycleStage,
    required this.photo,
    required this.symptomsOfAttack,
  });

  factory InsectLifeCycle.fromJson(Map<String, dynamic> json) =>
      InsectLifeCycle(
        characteristics: json["characteristics"] != null
            ? json["characteristics"] as String
            : '',
        lifecycleStage: json["lifecycleStage"] != null
            ? json["lifecycleStage"] as String
            : '',
        photo: json["photo"] != null ? Photo.fromJson(json["photo"]) : null,
        symptomsOfAttack: json["symptomsOfAttack"] != null
            ? json["symptomsOfAttack"] as String
            : '',
      );

  Map<String, dynamic> toJson() => {
        "characteristics": characteristics,
        "lifecycleStage": lifecycleStage,
        "photo": photo!.toJson(),
        "symptomsOfAttack": symptomsOfAttack,
      };
}
