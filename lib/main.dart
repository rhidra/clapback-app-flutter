import 'package:clapback_app/bloc/news/news-bloc.dart';
import 'package:clapback_app/bloc/quiz/quiz-bloc.dart';
import 'package:clapback_app/routes.dart';
import 'package:clapback_app/services/api-client.dart';
import 'package:clapback_app/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);

    return MultiBlocProvider(
      providers: [
        BlocProvider<NewsBloc>(
          create: (context) => NewsBloc(ApiClient()),
        ),
        BlocProvider<QuizBloc>(
          create: (context) => QuizBloc(ApiClient()),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: appTheme(),
        routes: appRoutes(),
        initialRoute: '/',
      ),
    );
  }
}
