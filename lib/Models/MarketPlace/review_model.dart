class ReviewModel {
  final String? avatar;
  final String username;
  final String? storeId;
  final String productId;
  final int rating;
  final bool? isLiked;
  final String review;

  ReviewModel({
    this.avatar,
    required this.username,
    this.storeId,
    required this.productId,
    required this.rating,
    this.isLiked,
    required this.review,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      avatar: json['avatar'] as String?,
      username: json['username'] as String,
      storeId: json['storeId'] as String?,
      productId: json['productId'] as String,
      rating: json['rating'] as int,
      isLiked: json['isLiked'] as bool?,
      review: json['review'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'avatar': avatar,
      'username': username,
      'storeId': storeId,
      'productId': productId,
      'rating': rating,
      'isLiked': isLiked,
      'review': review,
    };
  }
}
