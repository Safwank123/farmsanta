import 'active_hours_model.dart';
import 'category_model.dart';
import 'offer_model.dart';
import 'product_model.dart';
import 'review_model.dart';

class StoreModel {
  final String? uuid;
  final String name;
  final double rating;
  final List<ReviewModel> reviews;
  final String image;
  final double kmAway;
  final String address;
  final String contact;
  final ActiveHoursModel? activeHours;
  final List<CategoryModel> categories;
  final List<ProductModel> products;
  final List<OfferModel> offers;

  StoreModel({
    this.uuid,
    required this.name,
    required this.rating,
    required this.reviews,
    required this.image,
    required this.kmAway,
    required this.address,
    required this.contact,
    required this.activeHours,
    required this.categories,
    required this.products,
    required this.offers,
  });

  factory StoreModel.fromJson(Map<String, dynamic> json) {
    return StoreModel(
      uuid: json['uuid'] as String?,
      name: json['name'] as String,
      rating: json['rating'] as double,
      reviews: (json['reviews'] as List<dynamic>)
          .map((review) => ReviewModel.fromJson(review as Map<String, dynamic>))
          .toList(),
      image: json['image'] as String,
      kmAway: json['kmAway'] as double,
      address: json['address'] as String,
      contact: json['contact'] as String,
      activeHours: json['activeHours'] != null
          ? ActiveHoursModel.fromJson(
          json['activeHours'] as Map<String, dynamic>)
          : null,
      categories: (json['categories'] as List<dynamic>)
          .map((category) =>
          CategoryModel.fromJson(category as Map<String, dynamic>))
          .toList(),
      products: (json['products'] as List<dynamic>)
          .map((product) =>
          ProductModel.fromJson(product as Map<String, dynamic>))
          .toList(),
      offers: (json['offers'] as List<dynamic>)
          .map((offer) => OfferModel.fromJson(offer as Map<String, dynamic>))
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
      'kmAway': kmAway,
      'address': address,
      'contact': contact,
      'activeHours': activeHours,
      'categories': categories.map((category) => category.toJson()).toList(),
      'products': products.map((product) => product.toJson()).toList(),
      'offers': offers.map((offer) => offer.toJson()).toList(),
    };
  }
}