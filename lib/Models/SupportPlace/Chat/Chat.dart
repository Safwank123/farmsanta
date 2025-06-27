import 'ChatReply.dart';
import 'Query.dart';

class Chat {
  final ChatReply? reply;
  final Query? query;

  Chat({this.reply, this.query});

  factory Chat.fromJson(Map<String, dynamic> json) {
    return Chat(
      reply: json['reply'] != null ? ChatReply.fromJson(json['reply']) : null,
      query: json['query'] != null ? Query.fromJson(json['query']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (reply != null) {
      data['reply'] = reply!.toJson();
    }
    if (query != null) {
      data['query'] = query!.toJson();
    }
    return data;
  }
}
 
 
