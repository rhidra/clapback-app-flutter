import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

// Every time this model is modifyed, you have to re-generate the user.g.dart file
// Run the command: flutter packages pub run build_runner build

@JsonSerializable()
class User {
  @JsonKey(name: '_id')
  final String id;

  final String name;
  final String email;
  final String phone;
  final String description;

  final String level;
  final bool verified;

  final List<String> permissions;

  final bool isFollowing = false;

  final int viewsCounter = 0;
  final int likesCounter = 0;
  final int clapbacksCounter = 0;
  final int commentsCounter = 0;

  User(
      {this.id,
      this.name,
      this.email,
      this.phone,
      this.description,
      this.level,
      this.verified,
      this.permissions});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
