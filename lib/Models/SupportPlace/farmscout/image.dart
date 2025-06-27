class Image {
  String scoutingID;
  String imageId;

  Image({
    required this.scoutingID,
    required this.imageId,
  });

  factory Image.fromJson(Map<String, dynamic> json) {
    return Image(
      scoutingID:
          json['scoutingID'] != null ? json['scoutingID'] as String : '',
      imageId: json['imageId'] != null ? json['imageId'] as String : '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'scoutingID': scoutingID,
      'imageId': imageId,
    };
  }
}
