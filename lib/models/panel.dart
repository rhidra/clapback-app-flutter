import 'package:clapback_app/models/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'panel.g.dart';

@JsonSerializable()
class Panel {
  @JsonKey(name: '_id')
  final String id;

  final String video;
  final String text;
  final String textAlt;
  final String image;
  final String quiz;
  final User author;

  Panel(
      {this.video,
      this.text,
      this.textAlt,
      this.image,
      this.quiz,
      this.author,
      this.id});

  factory Panel.fromJson(Map<String, dynamic> json) => _$PanelFromJson(json);
  Map<String, dynamic> toJson() => _$PanelToJson(this);
}
