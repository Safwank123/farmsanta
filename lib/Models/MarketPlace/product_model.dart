import 'offer_model.dart';
import 'review_model.dart';
import 'variant_model.dart';

class ProductModel {
  final String? uuid;
  final String name;
  final String rating;
  final List<ReviewModel> reviews;
  final String image;
  final String? categoryId;
  final OfferModel? offersId;
  final double amount;
  final String? rentalUnit;
  final int quantity;
  final List<VariantModel> variants;

  ProductModel({
    this.uuid,
    required this.name,
    required this.rating,
    required this.reviews,
    required this.image,
    this.categoryId,
    this.offersId,
    required this.amount,
    this.rentalUnit,
    required this.quantity,
    required this.variants,
  });

  // factory ProductModel.fromJson(Map<String, dynamic> json) {
  //   return ProductModel(
  //     uuid: json['uuid'] as String?,
  //     name: json['name'] as String,
  //     rating: json['rating'] as String,
  //     reviews: (json['reviews'] as List<dynamic>)
  //         .map((review) => ReviewModel.fromJson(review as Map<String, dynamic>))
  //         .toList(),
  //     image: json['image'] as String,
  //     categoryId: json['categoryId'] as String?,
  //     offersId: json['offersId'] != null
  //         ? OfferModel.fromJson(json['offersId'] as Map<String, dynamic>)
  //         : null,
  //     amount: json['amount'] as double,
  //     rentalUnit: json['rentalUnit'] as String?,
  //     quantity: json['quantity'] as int,
  //     variants: (json['variants'] as List<dynamic>)
  //         .map((variant) =>
  //             VariantModel.fromJson(variant as Map<String, dynamic>))
  //         .toList(),
  //   );
  // }

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      uuid: json['uuid'] as String?,
      name: json['name'] as String,
      rating: json['rating'] as String,
      reviews: (json['reviews'] as List<dynamic>)
          .map((review) => ReviewModel.fromJson(review as Map<String, dynamic>))
          .toList(),
      image: json['image'] as String,
      categoryId: json['categoryId'] as String?,
      offersId: json['offersId'] != null
          ? OfferModel.fromJson(json['offersId'] as Map<String, dynamic>)
          : null,
      amount: json['amount'] as double,
      rentalUnit: json['rentalUnit'] as String?,
      quantity: json['quantity'] as int,
      variants: (json['variants'] as List<dynamic>)
          .map((variant) => VariantModel.fromJson(variant as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uuid': uuid,
      'name': name,
      'rating': rating,
      'reviews': reviews.map((review) => review.toJson()).toList(),
      'image': image,
      'categoryId': categoryId,
      'offersId': offersId?.toJson(),
      'amount': amount,
      'rentalUnit': rentalUnit,
      'quantity': quantity,
      'variants': variants.map((variant) => variant.toJson()).toList(),
    };
  }
}
