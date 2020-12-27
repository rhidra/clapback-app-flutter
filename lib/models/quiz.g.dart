// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Quiz _$QuizFromJson(Map<String, dynamic> json) {
  return Quiz(
    question: json['question'] as String,
    content: json['content'] as String,
    topic: json['topic'] as String,
    isPoll: json['isPoll'] as bool,
    explanationText: json['explanationText'] as String,
    id: json['_id'] as String,
  );
}

Map<String, dynamic> _$QuizToJson(Quiz instance) => <String, dynamic>{
      '_id': instance.id,
      'question': instance.question,
      'content': instance.content,
      'topic': instance.topic,
      'isPoll': instance.isPoll,
      'explanationText': instance.explanationText,
    };
