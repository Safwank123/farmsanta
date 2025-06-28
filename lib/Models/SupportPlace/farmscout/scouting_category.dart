class ScoutingCategory {
  int id;
  CategoryList? list;

  ScoutingCategory({
    required this.id,
    this.list,
  });

  factory ScoutingCategory.fromJson(Map<String, dynamic> json) {
    return ScoutingCategory(
      id: json['id'] != null ? json['id'].toInt() : 0,
      list: json['List'] != null ? CategoryList.fromJson(json['List']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'List': list?.toJson(),
    };
  }
}

class CategoryList {
  List<CategoryItem?>? item;

  CategoryList({
    this.item,
  });

  factory CategoryList.fromJson(Map<String, dynamic> json) {
    return CategoryList(
      item: json['item'] != null
          ? List<CategoryItem?>.from(
              json['item'].map((x) => CategoryItem.fromJson(x)))
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'item': item != null
          ? List<dynamic>.from(item!.map((x) => x?.toJson()))
          : null,
    };
  }
}

class CategoryItem {
  int? sequenceNumber;
  String? globalIndicatorUuid;
  String? groupName;
  String? updatedBy;
  String? createdBy;
  String? createdTimestamp;
  String? tenantId;
  String? name;
  String? description;
  String uuid;
  String? updatedTimestamp;
  String? status;

  CategoryItem({
    this.sequenceNumber,
    this.globalIndicatorUuid,
    this.groupName,
    this.updatedBy,
    this.createdBy,
    this.createdTimestamp,
    this.tenantId,
    this.name,
    this.description,
    required this.uuid,
    this.updatedTimestamp,
    this.status,
  });

  factory CategoryItem.fromJson(Map<String, dynamic> json) {
    return CategoryItem(
      sequenceNumber: json['sequenceNumber']?.toInt(),
      globalIndicatorUuid: json['globalIndicatorUuid'] != null
          ? json['globalIndicatorUuid'] as String
          : null,
      groupName: json['groupName'] != null ? json['groupName'] as String : null,
      updatedBy: json['updatedBy'] != null ? json['updatedBy'] as String : null,
      createdBy: json['createdBy'] != null ? json['createdBy'] as String : null,
      createdTimestamp: json['createdTimestamp'] != null
          ? json['createdTimestamp'] as String
          : null,
      tenantId: json['tenantId'] != null ? json['tenantId'] as String : null,
      name: json['name'] != null ? json['name'] as String : null,
      description:
          json['description'] != null ? json['description'] as String : null,
      uuid: json['uuid'] != null ? json['uuid'] as String : '',
      updatedTimestamp: json['updatedTimestamp'] != null
          ? json['updatedTimestamp'] as String
          : null,
      status: json['status'] != null ? json['status'] as String : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'sequenceNumber': sequenceNumber,
      'globalIndicatorUuid': globalIndicatorUuid,
      'groupName': groupName,
      'updatedBy': updatedBy,
      'createdBy': createdBy,
      'createdTimestamp': createdTimestamp,
      'tenantId': tenantId,
      'name': name,
      'description': description,
      'uuid': uuid,
      'updatedTimestamp': updatedTimestamp,
      'status': status,
    };
  }
}
