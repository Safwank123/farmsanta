class Photos {
  String? caption;
  String? fileName;
  String? photoId;

  Photos({this.caption, this.fileName, this.photoId});

  Photos.fromJson(Map<String, dynamic> json) {
    caption = json['caption'] != null ? json['caption'] as String : null;
    fileName = json['fileName'] != null ? json['fileName'] as String : null;
    photoId = json['photoId'] != null ? json['photoId'] as String : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['caption'] = caption;
    data['fileName'] = fileName;
    data['photoId'] = photoId;
    return data;
  }
}
