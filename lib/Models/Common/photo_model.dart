class Photo {
  String? caption;
  String? fileName;
  String? photoId;

  Photo({
    this.caption,
    this.fileName,
    this.photoId,
  });

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      caption: json["caption"] != null ? json["caption"] as String : null,
      fileName: json["fileName"] != null ? json["fileName"] as String : null,
      photoId: json["photoId"] != null ? json["photoId"] as String : null,
    );
  }

  Map<String, dynamic> toJson() => {
        "caption": caption,
        "fileName": fileName,
        "photoId": photoId,
      };
}
