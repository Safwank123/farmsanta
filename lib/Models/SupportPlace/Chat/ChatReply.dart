import 'Context.dart';

class ChatReply {
  List<String>? text;
  List<Context>? contexts;

  ChatReply({this.text, this.contexts});

  ChatReply.fromJson(Map<String, dynamic> json) {
    text = json['text'] != null ? List<String>.from(json['text']) : null;
    if (json['contexts'] != null) {
      contexts = <Context>[];
      json['contexts'].forEach((v) {
        contexts!.add(Context.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (text != null) {
      data['text'] = text;
    }
    if (contexts != null) {
      data['contexts'] = contexts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
 