class ScoutImage {
  String? image;
  String? comment;
  String? category;
  String? label;
  String? plantPart;
  String? status;

  ScoutImage({
    this.image,
    this.comment,
    this.category,
    this.label,
    this.plantPart,
    this.status,
  });

  factory ScoutImage.fromJson(Map<String, dynamic> json) {
    return ScoutImage(
      image: json['image'] != null ? json['image'] as String : null,
      comment: json['comment'] != null ? json['comment'] as String : null,
      category: json['category'] != null ? json['category'] as String : null,
      label: json['label'] != null ? json['label'] as String : null,
      plantPart: json['plantPart'] != null ? json['plantPart'] as String : null,
      status: json['status'] != null ? json['status'] as String : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'comment': comment,
      'category': category,
      'label': label,
      'plantPart': plantPart,
      'status': status,
    };
  }
}
