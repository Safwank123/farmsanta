import 'comment.dart';
import 'image.dart';

class Message {
  List<Comment> comments;
  String createdBy;
  String createdTimestamp;
  String description;
  String endDate;
  String firstName;
  List<Image> images;
  String lastName;
  String profileImage;
  int likes;
  List<String> links;
  String parentId;
  List<String> regions;
  String startDate;
  List<String> tags;
  String tenantId;
  String title;
  String updatedBy;
  String updatedTimestamp;
  String uuid;
  int selfLike;
  int languageId;
  bool agronomyManager;
  bool superAdmin;
  bool isMyPost;
  bool isBookMarked;
  String createdDate;

  Message({
    required this.comments,
    required this.createdBy,
    required this.createdTimestamp,
    required this.description,
    required this.endDate,
    required this.firstName,
    required this.images,
    required this.lastName,
    required this.profileImage,
    required this.likes,
    required this.links,
    required this.parentId,
    required this.regions,
    required this.startDate,
    required this.tags,
    required this.tenantId,
    required this.title,
    required this.updatedBy,
    required this.updatedTimestamp,
    required this.uuid,
    required this.selfLike,
    required this.languageId,
    required this.agronomyManager,
    required this.superAdmin,
    required this.isMyPost,
    required this.isBookMarked,
    required this.createdDate,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      comments: json['comments'] != null
          ? (json['comments'] as List<dynamic>)
              .map((e) => Comment.fromJson(e as Map<String, dynamic>))
              .toList()
          : [],
      createdBy: json['createdBy'] != null ? json['createdBy'] as String : '',
      createdTimestamp: json['createdTimestamp'] != null
          ? json['createdTimestamp'] as String
          : '',
      description:
          json['description'] != null ? json['description'] as String : '',
      endDate: json['endDate'] != null ? json['endDate'] as String : '',
      firstName: json['firstName'] != null ? json['firstName'] as String : '',
      images: json['images'] != null
          ? (json['images'] as List<dynamic>)
              .map((e) => Image.fromJson(e as Map<String, dynamic>))
              .toList()
          : [],
      lastName: json['lastName'] != null ? json['lastName'] as String : '',
      profileImage:
          json['profileImage'] != null ? json['profileImage'] as String : '',
      likes: json['likes'] != null ? json['likes'].toInt() : 0,
      links: json['links'] != null
          ? (json['links'] as List<dynamic>).map((e) => e as String).toList()
          : [],
      parentId: json['parentId'] != null ? json['parentId'] as String : '',
      regions: json['regions'] != null
          ? (json['regions'] as List<dynamic>).map((e) => e as String).toList()
          : [],
      startDate: json['startDate'] != null ? json['startDate'] as String : '',
      tags: json['tags'] != null
          ? (json['tags'] as List<dynamic>).map((e) => e as String).toList()
          : [],
      tenantId: json['tenantId'] != null ? json['tenantId'] as String : '',
      title: json['title'] != null ? json['title'] as String : '',
      updatedBy: json['updatedBy'] != null ? json['updatedBy'] as String : '',
      updatedTimestamp: json['updatedTimestamp'] != null
          ? json['updatedTimestamp'] as String
          : '',
      uuid: json['uuid'] != null ? json['uuid'] as String : '',
      selfLike: json['selfLike'] != null ? json['selfLike'].toInt() : 0,
      languageId: json['languageId'] != null ? json['languageId'].toInt() : 0,
      agronomyManager: json['agronomyManager'] ?? false,
      superAdmin: json['superAdmin'] ?? false,
      isMyPost: json['isMyPost'] ?? false,
      isBookMarked: json['isBookMarked'] ?? false,
      createdDate:
          json['createdDate'] != null ? json['createdDate'] as String : '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'comments': comments.map((e) => e.toJson()).toList(),
      'createdBy': createdBy,
      'createdTimestamp': createdTimestamp,
      'description': description,
      'endDate': endDate,
      'firstName': firstName,
      'images': images.map((e) => e.toJson()).toList(),
      'lastName': lastName,
      'profileImage': profileImage,
      'likes': likes,
      'links': links,
      'parentId': parentId,
      'regions': regions,
      'startDate': startDate,
      'tags': tags,
      'tenantId': tenantId,
      'title': title,
      'updatedBy': updatedBy,
      'updatedTimestamp': updatedTimestamp,
      'uuid': uuid,
      'selfLike': selfLike,
      'languageId': languageId,
      'agronomyManager': agronomyManager,
      'superAdmin': superAdmin,
      'createDate': createdDate,
    };
  }
}
