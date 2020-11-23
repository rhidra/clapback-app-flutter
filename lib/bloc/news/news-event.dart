import 'package:clapback_app/models/topic.dart';
import 'package:equatable/equatable.dart';

abstract class NewsEvent extends Equatable {
  NewsEvent([List props = const []]) : super();

  List<Object> get props => props;
}

class NewsEventGet extends NewsEvent {
  final int page;

  NewsEventGet(this.page) : super([page]);

  @override
  String toString() => 'Load news';
}

class NewsEventLike extends NewsEvent {
  final Topic topic;

  NewsEventLike(this.topic) : super([topic]);

  @override
  String toString() => 'Like topic';
}
