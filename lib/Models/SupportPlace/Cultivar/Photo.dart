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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['caption'] = this.caption;
    data['fileName'] = this.fileName;
    data['photoId'] = this.photoId;
    return data;
  }
}
