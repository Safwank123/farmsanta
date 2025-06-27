class Image {
  String fileName;
  String photoId;
  String caption;

  Image({
    required this.fileName,
    required this.photoId,
    required this.caption,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        fileName: json['fileName'] != null ? json['fileName'] as String : '',
        photoId: json['photoId'] != null ? json['photoId'] as String : '',
        caption: json['caption'] != null ? json['caption'] as String : '',
      );

  Map<String, dynamic> toJson() => {
        'fileName': fileName,
        'photoId': photoId,
        'caption': caption,
      };
}
