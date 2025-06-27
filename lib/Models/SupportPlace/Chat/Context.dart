import 'Parameters.dart';

class Context {
  String? name;
  int? lifespanCount;
  Parameters? parameters;

  Context({this.name, this.lifespanCount, this.parameters});

  Context.fromJson(Map<String, dynamic> json) {
    name = json['name'] != null ? json['name'] as String : null;
    lifespanCount =
        json['lifespanCount'] != null ? json['lifespanCount'].toInt() : null;
    parameters = json['parameters'] != null
        ? Parameters.fromJson(json['parameters'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['lifespanCount'] = lifespanCount;
    if (parameters != null) {
      data['parameters'] = parameters!.toJson();
    }
    return data;
  }
}
