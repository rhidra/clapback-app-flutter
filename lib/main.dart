import 'package:clapback_app/routes.dart';
import 'package:clapback_app/theme/style.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: appTheme(),
      routes: appRoutes(),
      initialRoute: '/',
    );
  }
}
