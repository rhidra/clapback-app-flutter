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

  final List<QuizChoice> choices;

  Quiz(
      {this.question,
      this.content,
      this.topic,
      this.isPoll,
      this.explanationText,
      this.choices,
      this.id});

  factory Quiz.fromJson(Map<String, dynamic> json) => _$QuizFromJson(json);
  Map<String, dynamic> toJson() => _$QuizToJson(this);
}

@JsonSerializable()
class QuizChoice {
  @JsonKey(name: '_id')
  final String id;

  final String text;
  final String color;
  final bool goodAnswer;
  int count;

  QuizChoice({this.id, this.text, this.color, this.goodAnswer, this.count});

  factory QuizChoice.fromJson(Map<String, dynamic> json) =>
      _$QuizChoiceFromJson(json);
  Map<String, dynamic> toJson() => _$QuizChoiceToJson(this);
}
