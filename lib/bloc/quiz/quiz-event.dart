import 'package:clapback_app/models/quiz.dart';
import 'package:equatable/equatable.dart';

abstract class QuizEvent extends Equatable {
  final List _props;

  QuizEvent([this._props = const []]) : super();

  List<Object> get props => _props;
}

class QuizEventGet extends QuizEvent {
  final String quizId;

  QuizEventGet(this.quizId) : super([quizId]);

  @override
  String toString() => 'Load Quiz';
}

class QuizEventChoice extends QuizEvent {
  final String choice;

  QuizEventChoice(this.choice) : super([choice]);

  @override
  String toString() => 'User Choice';
}
