import '../product_model.dart';

class PurchaseOrderModel {
  final List<ProductModel> products;
  final double price;
  String status;
  String modeofPayment;
  bool delivery;

  PurchaseOrderModel({
    required this.products,
    required this.price,
    required this.status,
    required this.modeofPayment,
    required this.delivery,
  });

  factory PurchaseOrderModel.fromJson(Map<String, dynamic> json) {
    return PurchaseOrderModel(
      products: (json['products'] as List<dynamic>)
          .map((product) =>
              ProductModel.fromJson(product as Map<String, dynamic>))
          .toList(),
      price: json['price'] as double,
      status: json['status'] as String,
      modeofPayment: json['ModeofPayment'] as String,
      delivery: json['delivery'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'products': products.map((product) => product.toJson()).toList(),
      'price': price,
      'status': status,
      'ModeofPayment': modeofPayment,
      'delivery': delivery,
    };
  }
}
