// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'topic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Topic _$TopicFromJson(Map<String, dynamic> json) {
  return Topic(
    id: json['_id'] as String,
    title: json['title'] as String,
    hashtags: (json['hashtags'] as List)?.map((e) => e as String)?.toList(),
    suggestedHashtags:
        (json['suggestedHashtags'] as List)?.map((e) => e as String)?.toList(),
    isPublic: json['isPublic'] as bool,
    isProcessing: json['isProcessing'] as bool,
    date: json['date'] as String,
    centerPanel: json['centerPanel'] == null
        ? null
        : Panel.fromJson(json['centerPanel'] as Map<String, dynamic>),
    leftPanel: json['leftPanel'] == null
        ? null
        : Panel.fromJson(json['leftPanel'] as Map<String, dynamic>),
    rightPanel: json['rightPanel'] == null
        ? null
        : Panel.fromJson(json['rightPanel'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$TopicToJson(Topic instance) => <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'hashtags': instance.hashtags,
      'suggestedHashtags': instance.suggestedHashtags,
      'isPublic': instance.isPublic,
      'isProcessing': instance.isProcessing,
      'date': instance.date,
      'centerPanel': instance.centerPanel,
      'leftPanel': instance.leftPanel,
      'rightPanel': instance.rightPanel,
    };
