import 'Fields.dart';

class Parameters {
  Fields? fields;

  Parameters({this.fields});

  Parameters.fromJson(Map<String, dynamic> json) {
    fields = json['fields'] != null ? Fields.fromJson(json['fields']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (fields != null) {
      data['fields'] = fields!.toJson();
    }
    return data;
  }
}

// class Fields {
//   // Define the properties of Fields here
//   // ...

//   Fields.fromJson(Map<String, dynamic> json) {
//     // Initialize properties from the JSON data
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     // Add properties to the JSON data
//     return data;
//   }
// }
