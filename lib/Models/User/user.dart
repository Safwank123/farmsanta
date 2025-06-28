// ignore_for_file: public_member_api_docs, sort_constructors_first

class UserModel {
  final int id;
  final String name;
  String phone;
  String secondaryNumber;
  String email;
  String firstName;
  String middleName;
  String lastName;
  String gender;
  String dob;
  String education;
  String farmSize;
  String image;
  String countryCode;
  String address;
  String state;
  String dataSource;
  bool hasSmartphone;
  String? country;
  String? district;
  String? village;
  String? subDistrict;
  String? pinCode;

  UserModel(
      this.id,
      this.name,
      this.phone,
      this.secondaryNumber,
      this.email,
      this.firstName,
      this.middleName,
      this.lastName,
      this.gender,
      this.dob,
      this.education,
      this.farmSize,
      this.countryCode,
      this.image,
      this.address,
      this.state,
      this.dataSource,
      this.hasSmartphone,
      this.country,
      this.district,
      this.pinCode,
      this.subDistrict,
      this.village);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'phone': phone,
      'secondaryNumber': secondaryNumber,
      'email': email,
      'firstName': firstName,
      'middleName': middleName,
      'lastName': lastName,
      'gender': gender,
      'dob': dob,
      'education': education,
      'farmSize': farmSize,
      'image': image,
      'countryCode': countryCode,
      'address': address,
      'state': state,
      'dataSource': dataSource,
      'hasSmartphone': hasSmartphone,
      'country': country,
      'district': district,
      'village': village,
      'subDistrict': subDistrict,
      'pinCode': pinCode,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      map['id'] != null ? map['id'] as int : 0,
      map['name'] != null ? map['name'] as String : '',
      map['phone'] != null ? map['phone'] as String : '',
      map['secondaryNumber'] != null ? map['secondaryNumber'] as String : '',
      map['email'] != null ? map['email'] as String : '',
      map['firstName'] != null ? map['firstName'] as String : '',
      map['middleName'] != null ? map['middleName'] as String : '',
      map['lastName'] != null ? map['lastName'] as String : '',
      map['gender'] != null ? map['gender'] as String : '',
      map['dob'] != null ? map['dob'] as String : '',
      map['education'] != null ? map['education'] as String : '',
      map['farmSize'] != null ? map['farmSize'] as String : '',
      map['image'] != null ? map['image'] as String : '',
      map['countryCode'] != null ? map['countryCode'] as String : '',
      map['address'] != null ? map['address'] as String : '',
      map['state'] != null ? map['state'] as String : '',
      map['dataSource'] != null ? map['dataSource'] as String : '',
      map['hasSmartphone'] != null ? map['hasSmartphone'] as bool : false,
      map['country'] != null ? map['country'] as String : null,
      map['district'] != null ? map['district'] as String : null,
      map['village'] != null ? map['village'] as String : null,
      map['subDistrict'] != null ? map['subDistrict'] as String : null,
      map['pinCode'] != null ? map['pinCode'] as String : null,
    );
  }

  Map<String, dynamic> toJson() => toMap();

  factory UserModel.fromJson(Map<String, dynamic> source) =>
      UserModel.fromMap(source);
}
