class TrendingTags {
  int id;
  List<String> tags;

  TrendingTags({
    this.id = -1,
    required this.tags,
  });

  factory TrendingTags.fromJson(Map<String, dynamic> json) =>
      _$TrendingTagsFromJson(json);
  Map<String, dynamic> toJson() => _$TrendingTagsToJson(this);
}

TrendingTags _$TrendingTagsFromJson(Map<String, dynamic> json) {
  return TrendingTags(
    id: json['id'] as int? ?? -1,
    tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
  );
}

Map<String, dynamic> _$TrendingTagsToJson(TrendingTags instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tags': instance.tags,
    };
