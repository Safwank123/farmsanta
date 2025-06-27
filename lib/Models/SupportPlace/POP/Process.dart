class Process {
  String description;
  int id;
  int processId;
  int sequenceId;
  String title;

  Process({
    required this.description,
    required this.id,
    required this.processId,
    required this.sequenceId,
    required this.title,
  });

  factory Process.fromJson(Map<String, dynamic> json) => Process(
        description:
            json['description'] != null ? json['description'] as String : '',
        id: json['id'] != null ? json['id'].toInt() : 0,
        processId: json['processId'] != null ? json['processId'].toInt() : 0,
        sequenceId: json['sequenceId'] != null ? json['sequenceId'].toInt() : 0,
        title: json['title'] != null ? json['title'] as String : '',
      );

  Map<String, dynamic> toJson() => {
        "description": description,
        "id": id,
        "processId": processId,
        "sequenceId": sequenceId,
        "title": title,
      };
}
