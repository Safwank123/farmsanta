class CategoryModel {
  final String img;
  final String name;
  final String? uuid;

  CategoryModel({
    required this.img,
    required this.name,
    this.uuid,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      img: json['img'] as String,
      name: json['name'] as String,
      uuid: json['uuid'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'img': img,
      'name': name,
      'uuid': uuid,
    };
  }
}
