import 'package:clapback_app/models/topic.dart';
import 'package:equatable/equatable.dart';

abstract class NewsEvent extends Equatable {
  final List _props;

  NewsEvent([this._props = const []]) : super();

  List<Object> get props => _props;
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
