import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Appbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: 50,
        child: Container(
          child: Padding(
            padding: EdgeInsets.only(left: 15, top: 5),
            child: Text(
              'CLAPBACK',
              style: TextStyle(
                fontSize: 22,
                shadows: [Shadow(blurRadius: 3)],
                color: Colors.white,
              ),
            ),
          ),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[
                Colors.black,
                Color(0x55000000),
                Colors.transparent
              ])),
        ));
  }
}
