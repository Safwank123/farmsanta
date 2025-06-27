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
      nitrogenousFertilizer: json['nitrogenousFertilizer'] != null
          ? json['nitrogenousFertilizer'].toInt()
          : null,
      phosphorusFertilizer: json['phosphorusFertilizer'] != null
          ? json['phosphorusFertilizer'].toInt()
          : null,
      boronFertilizer: json['boronFertilizer'] != null
          ? json['boronFertilizer'].toInt()
          : null,
      zincLevelZN:
          json['zincLevelZN'] != null ? json['zincLevelZN'].toInt() : null,
      npkFertilizer:
          json['npkFertilizer'] != null ? json['npkFertilizer'].toInt() : null,
      sulphurS: json['sulphurS'] != null ? json['sulphurS'].toDouble() : null,
      sulphurLevelS:
          json['sulphurLevelS'] != null ? json['sulphurLevelS'].toInt() : null,
      borronLevelB:
          json['borronLevelB'] != null ? json['borronLevelB'].toInt() : null,
      nitrogenLevelN: json['nitrogenLevelN'] != null
          ? json['nitrogenLevelN'].toInt()
          : null,
      testReportAvailable: json['testReportAvailable'] != null
          ? json['testReportAvailable']
          : null,
      borronB: json['borronB'] != null ? json['borronB'].toDouble() : null,
      potassiumFertilizer: json['potassiumFertilizer'] != null
          ? json['potassiumFertilizer'].toInt()
          : null,
      area: json['area'] != null ? json['area'].toDouble() : null,
      phosphorusP:
          json['phosphorusP'] != null ? json['phosphorusP'].toDouble() : null,
      cropId: json['cropId'] != null ? json['cropId'] as String : null,
      id: json['id'] != null ? json['id'].toInt() : null,
      cropPriority:
          json['cropPriority'] != null ? json['cropPriority'].toInt() : null,
      photassiumLevelK: json['photassiumLevelK'] != null
          ? json['photassiumLevelK'].toInt()
          : null,
      ageOfPlant:
          json['ageOfPlant'] != null ? json['ageOfPlant'].toDouble() : null,
      zincZN: json['zincZN'] != null ? json['zincZN'].toDouble() : null,
      zincFertilizer: json['zincFertilizer'] != null
          ? json['zincFertilizer'].toInt()
          : null,
      photassiumK:
          json['photassiumK'] != null ? json['photassiumK'].toDouble() : null,
      potentialHydrogenLevelPH: json['potentialHydrogenLevelPH'] != null
          ? json['potentialHydrogenLevelPH'].toInt()
          : null,
      potentialHydrogenPH: json['potentialHydrogenPH'] != null
          ? json['potentialHydrogenPH'].toDouble()
          : null,
      phosphorusLevelP: json['phosphorusLevelP'] != null
          ? json['phosphorusLevelP'].toInt()
          : null,
      cropType: json['cropType'] != null ? json['cropType'].toInt() : null,
      nitrogenN:
          json['nitrogenN'] != null ? json['nitrogenN'].toDouble() : null,
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
