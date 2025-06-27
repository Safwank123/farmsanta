import 'dart:convert';

SoilTestingReviewModel reviewModelFromJson(String str) =>
    SoilTestingReviewModel.fromJson(json.decode(str));

String reviewModelToJson(SoilTestingReviewModel data) => json.encode(data.toJson());

class SoilTestingReviewModel {
  String? avatar;
  String username;
  String? labId;
  String soilTestId;
  int rating;
  bool? isLiked;
  String review;
  int numberOfUser;

  SoilTestingReviewModel({
    this.avatar,
    required this.username,
    this.labId,
    required this.soilTestId,
    required this.rating,
    this.isLiked,
    required this.review,
    required this.numberOfUser,
  });

  factory SoilTestingReviewModel.fromJson(Map<String, dynamic> json) => SoilTestingReviewModel(
        avatar: json["avatar"],
        username: json["username"],
        labId: json["labId"],
        soilTestId: json["soilTestId"],
        rating: json["rating"],
        isLiked: json["isLiked"],
        review: json["review"],
        numberOfUser: json["numberOfUser"],
      );

  Map<String, dynamic> toJson() => {
        "avatar": avatar,
        "username": username,
        "labId": labId,
        "soilTestId": soilTestId,
        "rating": rating,
        "isLiked": isLiked,
        "review": review,
        "numberOfUser": numberOfUser,
      };
}
