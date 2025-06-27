
import 'package:farmsanta_new/Models/soil/Parameter.dart';

class SoilHealth {
  String? uuid;
  dynamic createdBy;
  dynamic updatedBy;
  DateTime? createdTimestamp;
  DateTime? updatedTimestamp;
  DateTime? startDate;
  DateTime? endDate;
  String? tenantId;
  dynamic farmer;
  String? farmerMobileNumber;
  String? dateOfSample;
  String? dateOfTesting;
  String? sampleDetails;
  String? labName;
  String? contactPerson;
  String? contactNumber;
  String? territory;
  String? region;
  String? status;
  List<Parameter>? parameters;

  SoilHealth({
    this.uuid,
    this.createdBy,
    required this.updatedBy,
    this.createdTimestamp,
    this.updatedTimestamp,
    this.startDate,
    this.endDate,
    this.tenantId,
    this.farmer,
    this.farmerMobileNumber,
    this.dateOfSample,
    this.dateOfTesting,
    this.sampleDetails,
    this.labName,
    this.contactPerson,
    this.contactNumber,
    this.territory,
    this.region,
    this.status,
    this.parameters,
  });

  factory SoilHealth.fromJson(Map<String, dynamic> json) {
    try {
      return SoilHealth(
        uuid: json['uuid'] != null ? json['uuid'] as String : null,
        createdBy: json['createdBy'],
        updatedBy: json['updatedBy'],
        createdTimestamp: json['createdTimestamp'] != null
            ? DateTime.parse(json['createdTimestamp'])
            : null,
        updatedTimestamp: json['updatedTimestamp'] != null
            ? DateTime.parse(json['updatedTimestamp'])
            : null,
        startDate: json['startDate'] != null
            ? DateTime.parse(json['startDate'])
            : null,
        endDate:
            json['endDate'] != null ? DateTime.parse(json['endDate']) : null,
        tenantId: json['tenantId'] != null ? json['tenantId'] as String : null,
        farmer: json['farmer'],
        farmerMobileNumber: json['farmerMobileNumber'] != null
            ? json['farmerMobileNumber'] as String
            : null,
        dateOfSample: json['dateOfSample'] != null
            ? json['dateOfSample'] as String
            : null,
        dateOfTesting: json['dateOfTesting'] != null
            ? json['dateOfTesting'] as String
            : null,
        sampleDetails: json['sampleDetails'] != null
            ? json['sampleDetails'] as String
            : null,
        labName: json['labName'] != null ? json['labName'] as String : null,
        contactPerson: json['contactPerson'] != null
            ? json['contactPerson'] as String
            : null,
        contactNumber: json['contactNumber'] != null
            ? json['contactNumber'] as String
            : null,
        territory:
            json['territory'] != null ? json['territory'] as String : null,
        region: json['region'] != null ? json['region'] as String : null,
        status: json['status'] != null ? json['status'] as String : null,
        parameters: json['parameters'] != null
            ? (json['parameters'] as List<dynamic>?)
                ?.map((e) => Parameter.fromJson(e as Map<String, dynamic>))
                .toList()
            : null,
      );
    } catch (e) {
      return SoilHealth(
        uuid: json['uuid'] != null ? json['uuid'] as String : null,
        createdBy: json['createdBy'],
        updatedBy: json['updatedBy'],
        createdTimestamp: json['createdTimestamp'] != null
            ? DateTime.fromMillisecondsSinceEpoch(json['createdTimestamp'])
            : null,
        updatedTimestamp: json['updatedTimestamp'] != null
            ? DateTime.fromMillisecondsSinceEpoch(json['updatedTimestamp'])
            : null,
        startDate: json['startDate'] != null
            ? DateTime.fromMillisecondsSinceEpoch(json['startDate'])
            : null,
        endDate: json['endDate'] != null
            ? DateTime.fromMillisecondsSinceEpoch(json['endDate'])
            : null,
        tenantId: json['tenantId'] != null ? json['tenantId'] as String : null,
        farmer: json['farmer'],
        farmerMobileNumber: json['farmerMobileNumber'] != null
            ? json['farmerMobileNumber'] as String
            : null,
        dateOfSample: json['dateOfSample'] != null
            ? json['dateOfSample'] as String
            : null,
        dateOfTesting: json['dateOfTesting'] != null
            ? json['dateOfTesting'] as String
            : null,
        sampleDetails: json['sampleDetails'] != null
            ? json['sampleDetails'] as String
            : null,
        labName: json['labName'] != null ? json['labName'] as String : null,
        contactPerson: json['contactPerson'] != null
            ? json['contactPerson'] as String
            : null,
        contactNumber: json['contactNumber'] != null
            ? json['contactNumber'] as String
            : null,
        territory:
            json['territory'] != null ? json['territory'] as String : null,
        region: json['region'] != null ? json['region'] as String : null,
        status: json['status'] != null ? json['status'] as String : null,
        parameters: json['parameters'] != null
            ? (json['parameters'] as List<dynamic>?)
                ?.map((e) => Parameter.fromJson(e as Map<String, dynamic>))
                .toList()
            : null,
      );
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['uuid'] = uuid;
    data['createdBy'] = createdBy;
    data['updatedBy'] = updatedBy;
    data['createdTimestamp'] = createdTimestamp;
    data['updatedTimestamp'] = updatedTimestamp;
    data['startDate'] = startDate;
    data['endDate'] = endDate;
    data['tenantId'] = tenantId;
    data['farmer'] = farmer;
    data['farmerMobileNumber'] = farmerMobileNumber;
    data['dateOfSample'] = dateOfSample;
    data['dateOfTesting'] = dateOfTesting;
    data['sampleDetails'] = sampleDetails;
    data['labName'] = labName;
    data['contactPerson'] = contactPerson;
    data['contactNumber'] = contactNumber;
    data['territory'] = territory;
    data['region'] = region;
    data['status'] = status;
    if (parameters != null) {
      data['parameters'] = parameters!.map((e) => e.toJson()).toList();
    }
    return data;
  }
}
