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

class QuizStateUnanswered extends QuizState {
  final Quiz quiz;

  QuizStateUnanswered(this.quiz) : super([quiz]);

  @override
  String toString() => 'QuizStateUnanswered ${quiz.id}';
}

class QuizStateAnswered extends QuizState {
  final Quiz quiz;
  final String userChoice;

  QuizStateAnswered(this.quiz, this.userChoice) : super([quiz, userChoice]);

  @override
  String toString() => 'QuizStateAnswered ${quiz.id} ($userChoice)';
}
