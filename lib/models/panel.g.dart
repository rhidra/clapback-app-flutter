// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'panel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Panel _$PanelFromJson(Map<String, dynamic> json) {
  return Panel(
    video: json['video'] as String,
    text: json['text'] as String,
    textAlt: json['textAlt'] as String,
    image: json['image'] as String,
    quiz: json['quiz'] as String,
    author: json['author'] == null
        ? null
        : User.fromJson(json['author'] as Map<String, dynamic>),
    id: json['_id'] as String,
  );
}

Map<String, dynamic> _$PanelToJson(Panel instance) => <String, dynamic>{
      '_id': instance.id,
      'video': instance.video,
      'text': instance.text,
      'textAlt': instance.textAlt,
      'image': instance.image,
      'quiz': instance.quiz,
      'author': instance.author,
    };
