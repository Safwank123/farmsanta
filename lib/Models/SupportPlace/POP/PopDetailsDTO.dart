import '../Cultivar/Photo.dart';

class PoPModel {
  bool? agronomyManager;
  String? approvalAssignBy;
  String? author;
  bool? bookmarked;
  String? content;
  String? createdBy;
  String? createdTimestamp;
  String? crop;
  List<String>? cultivarGroups;
  List<String>? cultivars;
  String? firstName;
  int? languageId;
  String? lastName;
  List<Photos>? photos;
  String? profileImage;
  List<String>? regions;
  String? status;
  bool? superAdmin;
  List<String>? tags;
  String? tenantId;
  List<String>? territories;
  String? title;
  String? updatedBy;
  String? updatedTimestamp;
  String? uuid;
  String? cropName;

  PoPModel(
      {this.agronomyManager,
      this.approvalAssignBy,
      this.author,
      this.bookmarked,
      this.content,
      this.createdBy,
      this.createdTimestamp,
      this.crop,
      this.cultivarGroups,
      this.cultivars,
      this.firstName,
      this.languageId,
      this.lastName,
      this.photos,
      this.profileImage,
      this.regions,
      this.status,
      this.superAdmin,
      this.tags,
      this.tenantId,
      this.territories,
      this.title,
      this.updatedBy,
      this.updatedTimestamp,
      this.uuid});

  PoPModel.fromJson(Map<String, dynamic> json) {
    agronomyManager =
        json['agronomyManager'];
    approvalAssignBy = json['approvalAssignBy'] != null
        ? json['approvalAssignBy'] as String
        : null;
    author = json['author'] != null ? json['author'] as String : null;
    bookmarked = json['bookmarked'];
    content = json['content'] != null ? json['content'] as String : null;
    createdBy = json['createdBy'] != null ? json['createdBy'] as String : null;
    createdTimestamp = json['createdTimestamp'] != null
        ? json['createdTimestamp'] as String
        : null;
    crop = json['crop'] != null ? json['crop'] as String : null;
    cultivarGroups = json['cultivarGroups'] != null
        ? List<String>.from(json['cultivarGroups'])
        : null;
    cultivars =
        json['cultivars'] != null ? List<String>.from(json['cultivars']) : null;
    firstName = json['firstName'] != null ? json['firstName'] as String : null;
    languageId = json['languageId']?.toInt();
    lastName = json['lastName'] != null ? json['lastName'] as String : null;
    if (json['photos'] != null) {
      photos = <Photos>[];
      json['photos'].forEach((v) {
        photos!.add(Photos.fromJson(v));
      });
    }
    profileImage =
        json['profileImage'] != null ? json['profileImage'] as String : null;
    regions =
        json['regions'] != null ? List<String>.from(json['regions']) : null;
    status = json['status'] != null ? json['status'] as String : null;
    superAdmin = json['superAdmin'];
    tags = json['tags'] != null ? List<String>.from(json['tags']) : null;
    tenantId = json['tenantId'] != null ? json['tenantId'] as String : null;
    territories = json['territories'] != null
        ? List<String>.from(json['territories'])
        : null;
    title = json['title'] != null ? json['title'] as String : null;
    updatedBy = json['updatedBy'] != null ? json['updatedBy'] as String : null;
    updatedTimestamp = json['updatedTimestamp'] != null
        ? json['updatedTimestamp'] as String
        : null;
    uuid = json['uuid'] != null ? json['uuid'] as String : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['agronomyManager'] = agronomyManager;
    data['approvalAssignBy'] = approvalAssignBy;
    data['author'] = author;
    data['bookmarked'] = bookmarked;
    data['content'] = content;
    data['createdBy'] = createdBy;
    data['createdTimestamp'] = createdTimestamp;
    data['crop'] = crop;
    data['cultivarGroups'] = cultivarGroups;
    data['cultivars'] = cultivars;
    data['firstName'] = firstName;
    data['languageId'] = languageId;
    data['lastName'] = lastName;
    if (photos != null) {
      data['photos'] = photos!.map((v) => v.toJson()).toList();
    }
    data['profileImage'] = profileImage;
    data['regions'] = regions;
    data['status'] = status;
    data['superAdmin'] = superAdmin;
    data['tags'] = tags;
    data['tenantId'] = tenantId;
    data['territories'] = territories;
    data['title'] = title;
    data['updatedBy'] = updatedBy;
    data['updatedTimestamp'] = updatedTimestamp;
    data['uuid'] = uuid;
    return data;
  }
}
