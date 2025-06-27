class Stage {
  dynamic sequenceNumber;
  String? growthStage;
  int? start;
  int? end;

  Stage({
    this.sequenceNumber,
    this.growthStage,
    this.start,
    this.end,
  });

  factory Stage.fromJson(Map<String, dynamic> json) {
    return Stage(
      sequenceNumber: json['sequenceNumber'],
      growthStage:
          json['growthStage'] != null ? json['growthStage'] as String : null,
      start: json['start'] != null ? json['start'].toInt() : null,
      end: json['end'] != null ? json['end'].toInt() : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'sequenceNumber': sequenceNumber,
      'growthStage': growthStage,
      'start': start,
      'end': end,
    };
  }
}
