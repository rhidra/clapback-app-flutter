import 'package:flutter/widgets.dart';

class ErrorScreen extends StatelessWidget {
  final String error;

  ErrorScreen({this.error = 'An unknown error happened'});

  @override
  Widget build(BuildContext context) {
    return Container(child: Text(error));
  }
}
