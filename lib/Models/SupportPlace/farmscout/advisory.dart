import 'advisory_details.dart';
import 'advisory_table.dart';
import 'image.dart';

class Advisory {
  String uuid;
  String createdBy;
  String updatedBy;
  String createdTimestamp;
  String updatedTimestamp;
  String startDate;
  String endDate;
  String tenantId;
  String label;
  String category;
  String farmerGroup;
  String cropName;
  List<Image> images;
  AdvisoryDetails? advisoryDetails;
  List<AdvisoryTable> advisoryTable;

  Advisory({
    required this.uuid,
    required this.createdBy,
    required this.updatedBy,
    required this.createdTimestamp,
    required this.updatedTimestamp,
    required this.startDate,
    required this.endDate,
    required this.tenantId,
    required this.label,
    required this.category,
    required this.farmerGroup,
    required this.cropName,
    required this.images,
    required this.advisoryDetails,
    required this.advisoryTable,
  });

  factory Advisory.fromJson(Map<String, dynamic> json) {
    return Advisory(
      uuid: json['uuid'] != null ? json['uuid'] as String : '',
      createdBy: json['createdBy'] != null ? json['createdBy'] as String : '',
      updatedBy: json['updatedBy'] != null ? json['updatedBy'] as String : '',
      createdTimestamp: json['createdTimestamp'] != null
          ? json['createdTimestamp'] as String
          : '',
      updatedTimestamp: json['updatedTimestamp'] != null
          ? json['updatedTimestamp'] as String
          : '',
      startDate: json['startDate'] != null ? json['startDate'] as String : '',
      endDate: json['endDate'] != null ? json['endDate'] as String : '',
      tenantId: json['tenantId'] != null ? json['tenantId'] as String : '',
      label: json['label'] != null ? json['label'] as String : '',
      category: json['category'] != null ? json['category'] as String : '',
      farmerGroup:
          json['farmerGroup'] != null ? json['farmerGroup'] as String : '',
      cropName: json['cropName'] != null ? json['cropName'] as String : '',
      images: json['images'] != null
          ? List<Image>.from(json['images'].map((x) => Image.fromJson(x)))
          : [],
      advisoryDetails: json['advisoryDetails'] != null
          ? AdvisoryDetails.fromJson(json['advisoryDetails'])
          : null,
      advisoryTable: json['advisoryTable'] != null
          ? List<AdvisoryTable>.from(
              json['advisoryTable'].map((x) => AdvisoryTable.fromJson(x)))
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['uuid'] = uuid;
    data['createdBy'] = createdBy;
    data['updatedBy'] = updatedBy;
    data['createdTimestamp'] = createdTimestamp;
    data['updatedTimestamp'] = updatedTimestamp;
    data['startDate'] = startDate;
    data['endDate'] = endDate;
    data['tenantId'] = tenantId;
    data['label'] = label;
    data['category'] = category;
    data['farmerGroup'] = farmerGroup;
    data['cropName'] = cropName;
    data['images'] = List<dynamic>.from(images.map((x) => x.toJson()));
    data['advisoryDetails'] = advisoryDetails!.toJson();
    data['advisoryTable'] =
        List<dynamic>.from(advisoryTable.map((x) => x.toJson()));
    return data;
  }
}
