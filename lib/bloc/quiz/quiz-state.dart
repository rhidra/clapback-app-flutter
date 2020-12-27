import 'package:clapback_app/models/quiz.dart';
import 'package:equatable/equatable.dart';

abstract class QuizState extends Equatable {
  final List _props;

  QuizState([this._props = const []]) : super();

  List<Object> get props => _props;
}

class QuizStateLoading extends QuizState {
  @override
  String toString() => 'QuizStateLoading';
}

class QuizStateNotConnected extends QuizState {
  @override
  String toString() => 'QuizStateNotConnected';
}

class QuizStateError extends QuizState {
  final String error;

  QuizStateError(this.error) : super([error]);

  @override
  String toString() => 'QuizStateError';
}

class QuizStateSuccess extends QuizState {
  final Quiz quiz;

  QuizStateSuccess(this.quiz) : super([quiz]);

  @override
  String toString() => 'QuizStateSuccess ${quiz.id}';
}
