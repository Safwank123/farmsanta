class VariantModel {
  final String? productID;
  final String? categoryID;
  final String variantName;
  final double? price;
  final int? discount;

  VariantModel({
    this.productID,
    this.categoryID,
    required this.variantName,
    this.price,
    this.discount,
  });

  factory VariantModel.fromJson(Map<String, dynamic> json) {
    return VariantModel(
      productID: json['productID'] as String?,
      categoryID: json['categoryID'] as String?,
      variantName: json['variantName'] as String,
      price: json['price'] as double?,
      discount: json['discount'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'productID': productID,
      'categoryID': categoryID,
      'variantName': variantName,
      'price': price,
      'discount': discount,
    };
  }
}
