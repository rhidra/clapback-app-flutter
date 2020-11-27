import 'package:clapback_app/models/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'panel.g.dart';

@JsonSerializable()
class Panel {
  static const VIDEO = 1;
  static const TEXT = 2;
  static const QUIZ = 3;

  @JsonKey(name: '_id')
  final String id;

  final String video;
  final String text;
  final String textAlt;
  final String image;
  final String quiz;

  @JsonKey(fromJson: _authorFromJson)
  final dynamic author;

  Panel(
      {this.video,
      this.text,
      this.textAlt,
      this.image,
      this.quiz,
      this.author,
      this.id});

  int get type {
    if (quiz != null) {
      return QUIZ;
    } else if (text != null) {
      return TEXT;
    } else if (video != null) {
      return VIDEO;
    } else {
      return -1;
    }
  }

  factory Panel.fromJson(Map<String, dynamic> json) => _$PanelFromJson(json);
  Map<String, dynamic> toJson() => _$PanelToJson(this);
}

dynamic _authorFromJson(dynamic json) =>
    json is String ? json : User.fromJson(json);
