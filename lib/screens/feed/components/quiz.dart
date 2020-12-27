import 'package:clapback_app/bloc/quiz/quiz-bloc.dart';
import 'package:clapback_app/bloc/quiz/quiz-event.dart';
import 'package:clapback_app/bloc/quiz/quiz-state.dart';
import 'package:clapback_app/components/error.dart';
import 'package:clapback_app/components/loading.dart';
import 'package:clapback_app/models/quiz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuizWidget extends StatefulWidget {
  final String _quizId;

  QuizWidget(this._quizId) : super();

  @override
  _QuizWidgetState createState() => _QuizWidgetState(_quizId);
}

class _QuizWidgetState extends State<QuizWidget> {
  final String _quizId;
  QuizBloc _bloc;

  _QuizWidgetState(this._quizId);

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of<QuizBloc>(context);
    _bloc.add(QuizEventGet(_quizId));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizBloc, QuizState>(
      bloc: _bloc,
      builder: (BuildContext context, QuizState state) {
        if (state is QuizStateLoading) {
          return LoadingScreen();
        } else if (state is QuizStateNotConnected) {
          return NetworkError();
        } else if (state is QuizStateError) {
          return ErrorScreen(error: state.error);
        } else if (state is QuizStateSuccess) {
          return _buildQuiz(state.quiz);
        } else {
          return ErrorScreen();
        }
      },
    );
  }

  Widget _buildQuiz(Quiz quiz) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          child: Image(
            fit: BoxFit.cover,
            image: AssetImage('assets/img/bg.png'),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 50, left: 12),
          child: Text(
            quiz.isPoll ? 'POLL' : 'QUIZ',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 100, left: 12),
          child: Text(
            quiz.question.toUpperCase(),
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              backgroundColor: Colors.red.shade800,
            ),
          ),
        ),
      ],
    );
  }
}
