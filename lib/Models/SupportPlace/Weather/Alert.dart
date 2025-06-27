class Alert {
  String? senderName;
  String? event;
  num? start;
  num? end;
  String? description;
  List<String>? tags;

  Alert({
    this.senderName,
    this.event,
    this.start,
    this.end,
    this.description,
    this.tags,
  });

  Alert.fromJson(Map<String, dynamic> json) {
    senderName =
        json['sender_name'] != null ? json['sender_name'] as String : null;
    event = json['event'] != null ? json['event'] as String : null;
    start = json['start'] != null ? json['start'] as num : null;
    end = json['end'] != null ? json['end'] as num : null;
    description =
        json['description'] != null ? json['description'] as String : null;
    tags = json['tags'] != null ? List<String>.from(json['tags']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sender_name'] = senderName;
    data['event'] = event;
    data['start'] = start;
    data['end'] = end;
    data['description'] = description;
    data['tags'] = tags;
    return data;
  }
}
