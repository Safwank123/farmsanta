import '../product_model.dart';

class RentalOrderModel {
  final List<ProductModel> products;
  final double price;
  String status;
  final int? rentalDuration;
  final String? rentalDurationUnit;
  final DateTime pickupDateTime;
  final DateTime dropoffDateTime;
  String modeofPayment;
  final bool delivery;

  RentalOrderModel({
    required this.products,
    required this.price,
    required this.status,
    this.rentalDuration,
    this.rentalDurationUnit,
    required this.pickupDateTime,
    required this.dropoffDateTime,
    required this.modeofPayment,
    required this.delivery,
  });

  factory RentalOrderModel.fromJson(Map<String, dynamic> json) {
    return RentalOrderModel(
      products: (json['products'] as List<dynamic>)
          .map((product) =>
              ProductModel.fromJson(product as Map<String, dynamic>))
          .toList(),
      price: json['price'] as double,
      status: json['status'] as String,
      rentalDuration: json['rentalDuration'] as int?,
      rentalDurationUnit: json['rentalDurationUnit'] as String?,
      pickupDateTime: DateTime.parse(json['pickupDateTime'] as String),
      modeofPayment: json['ModeofPayment'] as String,
      dropoffDateTime: DateTime.parse(json['dropoffDateTime'] as String),
      delivery: json['delivery'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'products': products.map((product) => product.toJson()).toList(),
      'price': price,
      'status': status,
      'rentalDuration': rentalDuration,
      'rentalDurationUnit': rentalDurationUnit,
      'pickupDateTime': pickupDateTime.toIso8601String(),
      'dropoffDateTime': dropoffDateTime.toIso8601String(),
      'ModeofPayment': modeofPayment,
      'delivery': delivery,
    };
  }
}
