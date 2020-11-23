import 'package:clapback_app/bloc/news/news-bloc.dart';
import 'package:clapback_app/routes.dart';
import 'package:clapback_app/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NewsBloc>(
          create: (context) => NewsBloc(),
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
