class PreviousPrice {
  String currency;
  double value;

  PreviousPrice({
    required this.currency,
    required this.value,
  });

  factory PreviousPrice.fromJson(Map<String, dynamic> json) {
    return PreviousPrice(
      currency: json['currency'] != null ? json['currency'].toString() : '',
      value: json['value'] != null ? json['value'].toDouble() : 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'currency': currency,
      'value': value,
    };
  }
}
