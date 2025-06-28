class PriceCurrency {
  String? currency;
  int? value;

  PriceCurrency({
    this.currency,
    this.value,
  });

  factory PriceCurrency.fromJson(Map<String, dynamic> json) {
    return PriceCurrency(
      currency: json['currency'] != null ? json['currency'] as String : null,
      value: json['value']?.toInt(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'currency': currency,
      'value': value,
    };
  }
}
