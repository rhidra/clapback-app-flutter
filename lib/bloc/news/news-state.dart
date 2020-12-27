import 'package:clapback_app/models/topic.dart';
import 'package:equatable/equatable.dart';

abstract class NewsState extends Equatable {
  final List _props;

  NewsState([this._props = const []]) : super();

  List<Object> get props => _props;
}

class NewsStateLoading extends NewsState {
  @override
  String toString() => 'NewsStateLoading';
}

class NewsStateNotConnected extends NewsState {
  @override
  String toString() => 'NewsStateNotConnected';
}

class NewsStateError extends NewsState {
  final String error;

  NewsStateError(this.error) : super([error]);

  @override
  String toString() => 'NewsStateError';
}

class NewsStateSuccess extends NewsState {
  final List<Topic> topics;

  NewsStateSuccess(this.topics) : super([topics]);

  @override
  String toString() => 'NewsStateSuccess';
}
