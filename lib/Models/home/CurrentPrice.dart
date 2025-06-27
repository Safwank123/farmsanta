class CurrentPrice {
  String? currency;
  double? value;

  CurrentPrice({
    this.currency,
    this.value,
  });

  factory CurrentPrice.fromJson(Map<String, dynamic> json) {
    return CurrentPrice(
      currency: json['currency'] != null ? json['currency'] as String : null,
      value: json['value'] != null ? json['value']!.toDouble() : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'currency': currency,
      'value': value,
    };
  }
}
