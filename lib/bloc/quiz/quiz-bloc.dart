import 'dart:io';

import 'package:clapback_app/bloc/quiz/quiz-event.dart';
import 'package:clapback_app/bloc/quiz/quiz-state.dart';
import 'package:clapback_app/models/quiz.dart';
import 'package:clapback_app/services/api-client.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  final ApiClient _apiClient;

  QuizBloc(this._apiClient);

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
      final res = await _apiClient.requestGet('/quiz/${event.quizId}');
      final Quiz quiz = Quiz.fromJson(res);
      yield QuizStateSuccess(quiz);
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
