import 'package:clapback_app/models/user.dart';

class Topic {
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
  
  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      id: json['_id'],
      title: json['title'],
      title: json['title'],
      title: json['title'],
      title: json['title'],
    )
  }
}

class Panel {
  final String video;
  final String text;
  final String textAlt;
  final String image;
  final String quiz;
  final User author;
}
