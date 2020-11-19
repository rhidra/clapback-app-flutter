import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Topic extends StatefulWidget {
  @override
  _TopicState createState() => _TopicState();
}

class _TopicState extends State<Topic> {
  PageController _pageCtrl;

  @override
  void initState() {
    super.initState();
    _pageCtrl = PageController(initialPage: 1);
  }

  @override
  void dispose() {
    _pageCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageCtrl,
      scrollDirection: Axis.horizontal,
      children: [
        _buildPanel(context, Colors.green, 'left'),
        _buildPanel(context, Colors.red, 'center'),
        _buildPanel(context, Colors.purple, 'right'),
      ],
    );
  }

  Widget _buildPanel(BuildContext context, Color color, String text) {
    return Container(
      color: color,
      child: Center(child: Text(text)),
    );
  }
}
