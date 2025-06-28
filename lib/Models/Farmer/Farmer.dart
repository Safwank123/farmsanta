import 'Land.dart';

class Farmer {
  String? address;
  String? country;
  String? countryCode;
  String? createdBy;
  DateTime? createdTimestamp;
  String? crop1;
  String? crop2;
  String? crop3;
  String? dataSource;
  DateTime? dateOfBirth;
  String? district;
  List<String>? documents;
  String? education;
  String? email;
  String? farmerGroup;
  String? farmertag;
  String? firstName;
  String? gender;
  bool? hasSmartphone;
  int? id;
  List<LandModel>? lands;
  int? languageId;
  String? lastName;
  String? midName;
  String? mobile;
  String? pin;
  String? profileImage;
  List<String>? region;
  String? role;
  int? sequence;
  String? status;
  String? subDistrict;
  String? tenantId;
  List<String>? territory;
  String? updatedBy;
  DateTime? updatedTimestamp;
  String? userId;
  String? userName;
  String? uuid;
  String? village;
  Farmer({
    this.address,
    this.country,
    this.countryCode,
    this.createdBy,
    this.createdTimestamp,
    this.crop1,
    this.crop2,
    this.crop3,
    this.dataSource,
    this.dateOfBirth,
    this.district,
    this.documents,
    this.education,
    this.email,
    this.farmerGroup,
    this.farmertag,
    this.firstName,
    this.gender,
    this.hasSmartphone,
    this.id,
    this.lands,
    this.languageId,
    this.lastName,
    this.midName,
    this.mobile,
    this.pin,
    this.profileImage,
    this.region,
    this.role,
    this.sequence,
    this.status,
    this.subDistrict,
    this.tenantId,
    this.territory,
    this.updatedBy,
    this.updatedTimestamp,
    this.userId,
    this.userName,
    this.uuid,
    this.village,
  });

  Map<String, dynamic> toMap() {
    return {
      'address': address,
      'country': country,
      'countryCode': countryCode,
      'createdBy': createdBy,
      'createdTimestamp': createdTimestamp!.millisecondsSinceEpoch,
      'crop1': crop1,
      'crop2': crop2,
      'crop3': crop3,
      'dataSource': dataSource,
      'dateOfBirth': dateOfBirth!.millisecondsSinceEpoch,
      'district': district,
      'documents': documents,
      'education': education,
      'email': email,
      'farmerGroup': farmerGroup,
      'farmertag': farmertag,
      'firstName': firstName,
      'gender': gender,
      'hasSmartphone': hasSmartphone,
      'id': id,
      'lands': lands!.map((x) => x.toMap()).toList(),
      'languageId': languageId,
      'lastName': lastName,
      'midName': midName,
      'mobile': mobile,
      'pin': pin,
      'profileImage': profileImage,
      'region': region,
      'role': role,
      'sequence': sequence,
      'status': status,
      'subDistrict': subDistrict,
      'tenantId': tenantId,
      'territory': territory,
      'updatedBy': updatedBy,
      'updatedTimestamp': updatedTimestamp!.millisecondsSinceEpoch,
      'userId': userId,
      'userName': userName,
      'uuid': uuid,
      'village': village,
    };
  }

  factory Farmer.fromMap(Map<String, dynamic> map) {
    try {
      return Farmer(
        address: map['address'] ?? '',
        country: map['country'] ?? '',
        countryCode: map['countryCode'] ?? '',
        createdBy: map['createdBy'] ?? '',
        createdTimestamp: DateTime.parse(map['createdTimestamp']),
        crop1: map['crop1'] ?? '',
        crop2: map['crop2'] ?? '',
        crop3: map['crop3'] ?? '',
        dataSource: map['dataSource'] ?? '',
        dateOfBirth: DateTime.parse(map['dateOfBirth']),
        district: map['district'] ?? '',
        documents:
            map['documents'] != null ? List<String>.from(map['documents']) : [],
        education: map['education'] ?? '',
        email: map['email'] ?? '',
        farmerGroup: map['farmerGroup'] ?? '',
        farmertag: map['farmertag'] ?? '',
        firstName: map['firstName'] ?? '',
        gender: map['gender'] ?? '',
        hasSmartphone: map['hasSmartphone'] ?? false,
        id: map['id']?.toInt() ?? 0,
        lands: map['lands'] != null
            ? List<LandModel>.from(
                map['lands']?.map((x) => LandModel.fromMap(x)))
            : [],
        languageId: map['languageId']?.toInt() ?? 0,
        lastName: map['lastName'] ?? '',
        midName: map['midName'] ?? '',
        mobile: map['mobile'] ?? '',
        pin: map['pin'] ?? '',
        profileImage: map['profileImage'] ?? '',
        region: map['region'] != null ? List<String>.from(map['region']) : [],
        role: map['role'] ?? '',
        sequence: map['sequence']?.toInt() ?? 0,
        status: map['status'] ?? '',
        subDistrict: map['subDistrict'] ?? '',
        tenantId: map['tenantId'] ?? '',
        territory:
            map['territory'] != null ? List<String>.from(map['territory']) : [],
        updatedBy: map['updatedBy'] ?? '',
        updatedTimestamp: DateTime.parse(map['updatedTimestamp']),
        userId: map['userId'] ?? '',
        userName: map['userName'] ?? '',
        uuid: map['uuid'] ?? '',
        village: map['village'] ?? '',
      );
    } catch (e) {
      return Farmer(
        address: map['address'] ?? '',
        country: map['country'] ?? '',
        countryCode: map['countryCode'] ?? '',
        createdBy: map['createdBy'] ?? '',
        createdTimestamp:
            DateTime.fromMillisecondsSinceEpoch(map['createdTimestamp']),
        crop1: map['crop1'] ?? '',
        crop2: map['crop2'] ?? '',
        crop3: map['crop3'] ?? '',
        dataSource: map['dataSource'] ?? '',
        dateOfBirth: DateTime.fromMillisecondsSinceEpoch(map['dateOfBirth']),
        district: map['district'] ?? '',
        documents:
            map['documents'] != null ? List<String>.from(map['documents']) : [],
        education: map['education'] ?? '',
        email: map['email'] ?? '',
        farmerGroup: map['farmerGroup'] ?? '',
        farmertag: map['farmertag'] ?? '',
        firstName: map['firstName'] ?? '',
        gender: map['gender'] ?? '',
        hasSmartphone: map['hasSmartphone'] ?? false,
        id: map['id']?.toInt() ?? 0,
        lands: map['lands'] != null
            ? List<LandModel>.from(
                map['lands']?.map((x) => LandModel.fromMap(x)))
            : [],
        languageId: map['languageId']?.toInt() ?? 0,
        lastName: map['lastName'] ?? '',
        midName: map['midName'] ?? '',
        mobile: map['mobile'] ?? '',
        pin: map['pin'] ?? '',
        profileImage: map['profileImage'] ?? '',
        region: map['region'] != null ? List<String>.from(map['region']) : [],
        role: map['role'] ?? '',
        sequence: map['sequence']?.toInt() ?? 0,
        status: map['status'] ?? '',
        subDistrict: map['subDistrict'] ?? '',
        tenantId: map['tenantId'] ?? '',
        territory:
            map['territory'] != null ? List<String>.from(map['territory']) : [],
        updatedBy: map['updatedBy'] ?? '',
        updatedTimestamp:
            DateTime.fromMillisecondsSinceEpoch(map['updatedTimestamp']),
        userId: map['userId'] ?? '',
        userName: map['userName'] ?? '',
        uuid: map['uuid'] ?? '',
        village: map['village'] ?? '',
      );
    }
  }

  Map<String, dynamic> toJson() => toMap();

  factory Farmer.fromJson(Map<String, dynamic> source) =>
      Farmer.fromMap(source);
}
