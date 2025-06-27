class IdNameModel {
  final String? uuid;
  final String name;
  final int? id;
  IdNameModel(this.uuid, this.name, this.id);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uuid': uuid,
      'name': name,
      'id': id,
    };
  }

  factory IdNameModel.fromMap(Map<String, dynamic> map) {
    return IdNameModel(
      map['uuid'] != null ? map['uuid'] as String : null,
      map['name'] != null ? map['name'] as String : '',
      map['id'] != null ? map['id'] as int : null,
    );
  }

  Map<String, dynamic> toJson() => toMap();

  factory IdNameModel.fromJson(Map<String, dynamic> source) =>
      IdNameModel.fromMap(source);
}
