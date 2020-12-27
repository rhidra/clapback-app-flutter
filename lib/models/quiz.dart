import 'package:json_annotation/json_annotation.dart';

part 'quiz.g.dart';

@JsonSerializable()
class Quiz {
  @JsonKey(name: '_id')
  final String id;

  final String question;
  final String content;
  final String topic;
  final bool isPoll;
  final String explanationText;

  Quiz(
      {this.question,
      this.content,
      this.topic,
      this.isPoll,
      this.explanationText,
      this.id});

  factory Quiz.fromJson(Map<String, dynamic> json) => _$QuizFromJson(json);
  Map<String, dynamic> toJson() => _$QuizToJson(this);
}
