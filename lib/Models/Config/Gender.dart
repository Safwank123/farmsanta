class Gender {
  String? gender;

  Gender({
    this.gender,
  });

  factory Gender.fromJson(Map<String, dynamic> json) {
    return Gender(
      gender: json['gender'] != null ? json['gender'] as String : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['gender'] = gender;
    return data;
  }
}
