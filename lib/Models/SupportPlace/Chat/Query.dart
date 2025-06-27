import 'Context.dart';

class Query {
  String? userId;
  String? query;
  List<Context>? contexts;

  Query({this.userId, this.query, this.contexts});

  Query.fromJson(Map<String, dynamic> json) {
    userId = json['userId'] != null ? json['userId'] as String : null;
    query = json['query'] != null ? json['query'] as String : null;
    if (json['contexts'] != null) {
      contexts =
          List<Context>.from(json['contexts'].map((x) => Context.fromJson(x)));
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['query'] = query;
    if (contexts != null) {
      data['contexts'] = contexts!.map((x) => x.toJson()).toList();
    }
    return data;
  }
}
