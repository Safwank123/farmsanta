class StoreCardModel {
  final String? name;
  final String? image;
  final double? distance;
  final bool? isSaved;
  final double? ratings;
  final List<String>? cropList;

  StoreCardModel(this.name, this.image, this.distance, this.isSaved, this.ratings, this.cropList);
}

class NameImageModel {
  final String? name;
  final String? image;

  NameImageModel(this.name, this.image, );
}
