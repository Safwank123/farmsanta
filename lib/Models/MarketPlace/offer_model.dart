class OfferModel {
  final String? uuid;
  final String name;
  final int? percentageOff;
  final double? amountOff;

  OfferModel({
    this.uuid,
    required this.name,
    this.percentageOff,
    this.amountOff,
  });

  factory OfferModel.fromJson(Map<String, dynamic> json) {
    return OfferModel(
      uuid: json['uuid'] as String?,
      name: json['name'] as String,
      percentageOff: json['percentageOff'] as int?,
      amountOff: json['amountOff'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uuid': uuid,
      'name': name,
      'percentageOff': percentageOff,
      'amountOff': amountOff,
    };
  }
}
