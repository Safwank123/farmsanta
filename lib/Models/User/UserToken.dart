class UserToken {
  String? firstName;
  String? lastName;
  String? token;
  String? refreshToken;
  int responseCode = 1;
  String? errorMessage;

  UserToken({
    this.firstName,
    this.lastName,
    this.token,
    this.refreshToken,
    this.responseCode = 1,
    this.errorMessage,
  });

  factory UserToken.fromJson(Map<String, dynamic> json) {
    return UserToken(
      firstName: json['firstName'] != null ? json['firstName'] as String : null,
      lastName: json['lastName'] != null ? json['lastName'] as String : null,
      token: json['token'] != null ? json['token'] as String : null,
      refreshToken:
          json['refreshToken'] != null ? json['refreshToken'] as String : null,
      responseCode:
          json['responseCode'] != null ? json['responseCode'] as int : 1,
      errorMessage:
          json['errorMessage'] != null ? json['errorMessage'] as String : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['token'] = token;
    data['refreshToken'] = refreshToken;
    data['responseCode'] = responseCode;
    data['errorMessage'] = errorMessage;
    return data;
  }
}
