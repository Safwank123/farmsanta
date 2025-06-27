class CropRecommendation {
  String? agronomistRecommendation;
  String? createdBy;
  String? createdTimestamp;
  String? crop;
  String? impact;
  String? nutritionalRecommendation;
  String? soilCard;
  String? status;
  String? tenantId;
  String? updatedBy;
  String? updatedTimestamp;
  String? uuid;
  String? cropName;

  CropRecommendation({
    this.agronomistRecommendation,
    this.createdBy,
    this.createdTimestamp,
    this.crop,
    this.impact,
    this.nutritionalRecommendation,
    this.soilCard,
    this.status,
    this.tenantId,
    this.updatedBy,
    this.updatedTimestamp,
    this.uuid,
    this.cropName,
  });

  factory CropRecommendation.fromJson(Map<String, dynamic> json) {
    return CropRecommendation(
      agronomistRecommendation: json['agronomistRecommendation'] != null
          ? json['agronomistRecommendation'] as String
          : null,
      createdBy: json['createdBy'] != null ? json['createdBy'] as String : null,
      createdTimestamp: json['createdTimestamp'] != null
          ? json['createdTimestamp'] as String
          : null,
      crop: json['crop'] != null ? json['crop'] as String : null,
      impact: json['impact'] != null ? json['impact'] as String : null,
      nutritionalRecommendation: json['nutritionalRecommendation'] != null
          ? json['nutritionalRecommendation'] as String
          : null,
      soilCard: json['soilCard'] != null ? json['soilCard'] as String : null,
      status: json['status'] != null ? json['status'] as String : null,
      tenantId: json['tenantId'] != null ? json['tenantId'] as String : null,
      updatedBy: json['updatedBy'] != null ? json['updatedBy'] as String : null,
      updatedTimestamp: json['updatedTimestamp'] != null
          ? json['updatedTimestamp'] as String
          : null,
      uuid: json['uuid'] != null ? json['uuid'] as String : null,
      cropName: json['cropName'] != null ? json['cropName'] as String : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['agronomistRecommendation'] = agronomistRecommendation;
    data['createdBy'] = createdBy;
    data['createdTimestamp'] = createdTimestamp;
    data['crop'] = crop;
    data['impact'] = impact;
    data['nutritionalRecommendation'] = nutritionalRecommendation;
    data['soilCard'] = soilCard;
    data['status'] = status;
    data['tenantId'] = tenantId;
    data['updatedBy'] = updatedBy;
    data['updatedTimestamp'] = updatedTimestamp;
    data['uuid'] = uuid;
    data['cropName'] = cropName;
    return data;
  }
}
