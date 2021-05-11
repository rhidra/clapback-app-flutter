import 'dart:io';

import 'package:clapback_app/bloc/quiz/quiz-event.dart';
import 'package:clapback_app/bloc/quiz/quiz-state.dart';
import 'package:clapback_app/models/quiz.dart';
import 'package:clapback_app/services/api-client.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  final ApiClient _api;

  QuizBloc(this._api);

  @override
  QuizState get initialState => QuizStateLoading();

  @override
  Stream<QuizState> mapEventToState(QuizEvent event) async* {
    if (event is QuizEventGet) {
      yield* _mapEventGetToState(event);
    }
    if (event is QuizEventChoice) {
      yield* _mapEventChoiceToState(event);
    }
  }

  Stream<QuizState> _mapEventGetToState(QuizEventGet event) async* {
    yield QuizStateLoading();
    try {
      var res = await _api.requestGet('/quiz/${event.quizId}');
      final Quiz quiz = Quiz.fromJson(res);
      yield QuizStateUnanswered(quiz);

      final vote = await _api.requestGet('/quiz/vote/${event.quizId}');
      if (vote != null) {
        yield QuizStateAnswered(quiz, vote['choice']);
        if (quiz.isPoll) {
          res = await _api.requestGet('/quiz/vote/${event.quizId}/results');
          print(res);
          res.map((r) {
            final choice = quiz.choices.firstWhere((c) => c.id == r['choice']);
            choice.count = r['count'];
            print('${choice.id} ${choice.count}');
          });
          yield QuizStateAnswered(quiz, vote['choice']);
        }
      }
    } on SocketException catch (_) {
      yield QuizStateNotConnected();
    } catch (e) {
      print(e.toString());
      yield QuizStateError(e.toString());
    }
  }

  Stream<QuizState> _mapEventChoiceToState(QuizEventChoice event) async* {
    print('choice');
  }
}
