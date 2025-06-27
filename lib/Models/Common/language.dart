// ignore_for_file: public_member_api_docs, sort_constructors_first
class LanguageModel {
  final int id;
  final String name;
  final String lang;
  final String locale;

  LanguageModel(this.id, this.name, this.lang, this.locale);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'lang': lang,
      'locale': locale,
    };
  }

  factory LanguageModel.fromMap(Map<String, dynamic> map) {
    return LanguageModel(
      map['id'] != null ? map['id'] as int : 0,
      map['name'] != null ? map['name'] as String : '',
      map['lang'] != null ? map['lang'] as String : '',
      map['locale'] != null ? map['locale'] as String : '',
    );
  }

  Map<String, dynamic> toJson() => toMap();

  factory LanguageModel.fromJson(Map<String, dynamic> source) =>
      LanguageModel.fromMap(source);
}
