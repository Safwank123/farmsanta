import '../../Common/photo_model.dart';

class DeficiencyDto {
  String biologicalControl;
  String chemicalControl;
  String nutrient;
  String nutrientId;
  List<Photo> photos;
  String preventiveMeasures;
  int sequenceId;
  String symptomsOfDeficiency;

  DeficiencyDto({
    required this.biologicalControl,
    required this.chemicalControl,
    required this.nutrient,
    required this.nutrientId,
    required this.photos,
    required this.preventiveMeasures,
    required this.sequenceId,
    required this.symptomsOfDeficiency,
  });

  factory DeficiencyDto.fromJson(Map<String, dynamic> json) => DeficiencyDto(
        biologicalControl: json["biologicalControl"] != null
            ? json["biologicalControl"] as String
            : '',
        chemicalControl: json["chemicalControl"] != null
            ? json["chemicalControl"] as String
            : '',
        nutrient: json["nutrient"] != null ? json["nutrient"] as String : '',
        nutrientId:
            json["nutrientId"] != null ? json["nutrientId"] as String : '',
        photos: json["photos"] != null
            ? List<Photo>.from(json["photos"].map((x) => Photo.fromJson(x)))
            : [],
        preventiveMeasures: json["preventiveMeasures"] != null
            ? json["preventiveMeasures"] as String
            : '',
        sequenceId: json["sequenceId"] != null ? json["sequenceId"].toInt() : 0,
        symptomsOfDeficiency: json["symptomsOfDeficiency"] != null
            ? json["symptomsOfDeficiency"] as String
            : '',
      );

  Map<String, dynamic> toJson() => {
        "biologicalControl": biologicalControl,
        "chemicalControl": chemicalControl,
        "nutrient": nutrient,
        "nutrientId": nutrientId,
        "photos": List<dynamic>.from(photos.map((x) => x.toJson())),
        "preventiveMeasures": preventiveMeasures,
        "sequenceId": sequenceId,
        "symptomsOfDeficiency": symptomsOfDeficiency,
      };
}
