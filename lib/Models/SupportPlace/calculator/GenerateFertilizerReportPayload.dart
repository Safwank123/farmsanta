class GenerateFertilizerReportPayload {
  int? nitrogenousFertilizer;
  int? phosphorusFertilizer;
  int? boronFertilizer;
  int? zincLevelZN;
  int? npkFertilizer;
  double? sulphurS;
  int? sulphurLevelS;
  int? borronLevelB;
  int? nitrogenLevelN;
  bool testReportAvailable;
  double? borronB;
  int? potassiumFertilizer;
  double? area;
  double? phosphorusP;
  String? cropId;
  int? id;
  int? cropPriority;
  int? photassiumLevelK;
  double? ageOfPlant;
  double? zincZN;
  int? zincFertilizer;
  double? photassiumK;
  int? potentialHydrogenLevelPH;
  double? potentialHydrogenPH;
  int? phosphorusLevelP;
  int? cropType;
  double? nitrogenN;

  GenerateFertilizerReportPayload({
    this.nitrogenousFertilizer,
    this.phosphorusFertilizer,
    this.boronFertilizer,
    this.zincLevelZN,
    this.npkFertilizer,
    this.sulphurS,
    this.sulphurLevelS,
    this.borronLevelB,
    this.nitrogenLevelN,
    this.testReportAvailable = false,
    this.borronB,
    this.potassiumFertilizer,
    this.area,
    this.phosphorusP,
    this.cropId,
    this.id,
    this.cropPriority,
    this.photassiumLevelK,
    this.ageOfPlant,
    this.zincZN,
    this.zincFertilizer,
    this.photassiumK,
    this.potentialHydrogenLevelPH,
    this.potentialHydrogenPH,
    this.phosphorusLevelP,
    this.cropType,
    this.nitrogenN,
  });

  factory GenerateFertilizerReportPayload.fromJson(Map<String, dynamic> json) {
    return GenerateFertilizerReportPayload(
      nitrogenousFertilizer: json['nitrogenousFertilizer']?.toInt(),
      phosphorusFertilizer: json['phosphorusFertilizer']?.toInt(),
      boronFertilizer: json['boronFertilizer']?.toInt(),
      zincLevelZN:
          json['zincLevelZN']?.toInt(),
      npkFertilizer:
          json['npkFertilizer']?.toInt(),
      sulphurS: json['sulphurS']?.toDouble(),
      sulphurLevelS:
          json['sulphurLevelS']?.toInt(),
      borronLevelB:
          json['borronLevelB']?.toInt(),
      nitrogenLevelN: json['nitrogenLevelN']?.toInt(),
      testReportAvailable: json['testReportAvailable'],
      borronB: json['borronB']?.toDouble(),
      potassiumFertilizer: json['potassiumFertilizer']?.toInt(),
      area: json['area']?.toDouble(),
      phosphorusP:
          json['phosphorusP']?.toDouble(),
      cropId: json['cropId'] != null ? json['cropId'] as String : null,
      id: json['id']?.toInt(),
      cropPriority:
          json['cropPriority']?.toInt(),
      photassiumLevelK: json['photassiumLevelK']?.toInt(),
      ageOfPlant:
          json['ageOfPlant']?.toDouble(),
      zincZN: json['zincZN']?.toDouble(),
      zincFertilizer: json['zincFertilizer']?.toInt(),
      photassiumK:
          json['photassiumK']?.toDouble(),
      potentialHydrogenLevelPH: json['potentialHydrogenLevelPH']?.toInt(),
      potentialHydrogenPH: json['potentialHydrogenPH']?.toDouble(),
      phosphorusLevelP: json['phosphorusLevelP']?.toInt(),
      cropType: json['cropType']?.toInt(),
      nitrogenN:
          json['nitrogenN']?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['nitrogenousFertilizer'] = nitrogenousFertilizer;
    data['phosphorusFertilizer'] = phosphorusFertilizer;
    data['boronFertilizer'] = boronFertilizer;
    data['zincLevelZN'] = zincLevelZN;
    data['npkFertilizer'] = npkFertilizer;
    data['sulphurS'] = sulphurS;
    data['sulphurLevelS'] = sulphurLevelS;
    data['borronLevelB'] = borronLevelB;
    data['nitrogenLevelN'] = nitrogenLevelN;
    data['testReportAvailable'] = testReportAvailable;
    data['borronB'] = borronB;
    data['potassiumFertilizer'] = potassiumFertilizer;
    data['area'] = area;
    data['phosphorusP'] = phosphorusP;
    data['cropId'] = cropId;
    data['id'] = id;
    data['cropPriority'] = cropPriority;
    data['photassiumLevelK'] = photassiumLevelK;
    data['ageOfPlant'] = ageOfPlant;
    data['zincZN'] = zincZN;
    data['zincFertilizer'] = zincFertilizer;
    data['photassiumK'] = photassiumK;
    data['potentialHydrogenLevelPH'] = potentialHydrogenLevelPH;
    data['potentialHydrogenPH'] = potentialHydrogenPH;
    data['phosphorusLevelP'] = phosphorusLevelP;
    data['cropType'] = cropType;
    data['nitrogenN'] = nitrogenN;
    return data;
  }
}
