import 'package:clapback_app/models/panel.dart';
import 'package:json_annotation/json_annotation.dart';

part 'topic.g.dart';

@JsonSerializable()
class Topic {
  @JsonKey(name: '_id')
  final String id;

  final String title;
  final List<String> hashtags;
  final List<String> suggestedHashtags;
  final bool isPublic;
  final bool isProcessing;
  final String date;

  final Panel centerPanel;
  final Panel leftPanel;
  final Panel rightPanel;

  final int likesCounter = 0;
  final int viewsCounter = 0;
  final int commentsCounter = 0;
  final int clapbacksCounter = 0;
  final bool hasLiked = false;

  Topic(
      {this.id,
      this.title,
      this.hashtags,
      this.suggestedHashtags,
      this.isPublic,
      this.isProcessing,
      this.date,
      this.centerPanel,
      this.leftPanel,
      this.rightPanel});

  factory Topic.fromJson(Map<String, dynamic> json) => _$TopicFromJson(json);
  Map<String, dynamic> toJson() => _$TopicToJson(this);
}
