// ignore_for_file: public_member_api_docs, sort_constructors_first

class TerritoryModel {
  final String uuid;
  final String countryName;
  final String territoryName;
  final String status;
  final String regionLabel;
  final String countyLabel;
  final String subcountyLabel;
  final String villageLabel;
  final String phoneCode;

  TerritoryModel(
      this.uuid,
      this.countryName,
      this.territoryName,
      this.status,
      this.regionLabel,
      this.countyLabel,
      this.subcountyLabel,
      this.villageLabel,
      this.phoneCode);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uuid': uuid,
      'countryName': countryName,
      'territoryName': territoryName,
      'status': status,
      'regionLabel': regionLabel,
      'countyLabel': countyLabel,
      'subcountyLabel': subcountyLabel,
      'villageLabel': villageLabel,
      'phoneCode': phoneCode,
    };
  }

  factory TerritoryModel.fromMap(Map<String, dynamic> map) {
    return TerritoryModel(
      map['uuid'] != null ? map['uuid'].toString() : '',
      map['countryName'] != null ? map['countryName'].toString() : '',
      map['territoryName'] != null ? map['territoryName'].toString() : '',
      map['status'] != null ? map['status'].toString() : '',
      map['regionLabel'] != null ? map['regionLabel'].toString() : '',
      map['countyLabel'] != null ? map['countyLabel'].toString() : '',
      map['subcountyLabel'] != null ? map['subcountyLabel'].toString() : '',
      map['villageLabel'] != null ? map['villageLabel'].toString() : '',
      map['phoneCode'] != null ? map['phoneCode'].toString() : '',
    );
  }

  Map<String, dynamic> toJson() => toMap();

  factory TerritoryModel.fromJson(Map<String, dynamic> source) =>
      TerritoryModel.fromMap(source);
}
