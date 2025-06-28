class AdvisoryDetails {
  String localName;
  String symptomsOfAttack;
  String favourableConditions;
  String preventiveMeasures;
  String culturalMechanicalControl;
  String description;
  Object? culturalControl;

  AdvisoryDetails({
    required this.localName,
    required this.symptomsOfAttack,
    required this.favourableConditions,
    required this.preventiveMeasures,
    required this.culturalMechanicalControl,
    required this.description,
    this.culturalControl,
  });

  factory AdvisoryDetails.fromJson(Map<String, dynamic> json) {
    return AdvisoryDetails(
      localName: json['localName'] != null ? json['localName'] as String : '',
      symptomsOfAttack: json['symptomsOfAttack'] != null
          ? json['symptomsOfAttack'] as String
          : '',
      favourableConditions: json['favourableConditions'] != null
          ? json['favourableConditions'] as String
          : '',
      preventiveMeasures: json['preventiveMeasures'] != null
          ? json['preventiveMeasures'] as String
          : '',
      culturalMechanicalControl: json['culturalMechanicalControl'] != null
          ? json['culturalMechanicalControl'] as String
          : '',
      description:
          json['description'] != null ? json['description'] as String : '',
      culturalControl:
          json['culturalControl'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['localName'] = localName;
    data['symptomsOfAttack'] = symptomsOfAttack;
    data['favourableConditions'] = favourableConditions;
    data['preventiveMeasures'] = preventiveMeasures;
    data['culturalMechanicalControl'] = culturalMechanicalControl;
    data['description'] = description;
    data['culturalControl'] = culturalControl;
    return data;
  }
}
