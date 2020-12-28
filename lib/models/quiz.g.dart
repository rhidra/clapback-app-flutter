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
    choices: (json['choices'] as List)
        ?.map((e) =>
            e == null ? null : QuizChoice.fromJson(e as Map<String, dynamic>))
        ?.toList(),
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
      'choices': instance.choices,
    };

QuizChoice _$QuizChoiceFromJson(Map<String, dynamic> json) {
  return QuizChoice(
    id: json['_id'] as String,
    text: json['text'] as String,
    color: json['color'] as String,
    goodAnswer: json['goodAnswer'] as bool,
    count: json['count'] as int,
  );
}

Map<String, dynamic> _$QuizChoiceToJson(QuizChoice instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'text': instance.text,
      'color': instance.color,
      'goodAnswer': instance.goodAnswer,
      'count': instance.count,
    };
