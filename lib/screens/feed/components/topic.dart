import 'package:clapback_app/models/panel.dart';
import 'package:clapback_app/models/topic.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TopicWidget extends StatefulWidget {
  final Topic topic;

  TopicWidget({Key key, this.topic}) : super(key: key);

  @override
  _TopicWidgetState createState() => _TopicWidgetState();
}

class _TopicWidgetState extends State<TopicWidget> {
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
        _buildPanel(widget.topic.leftPanel),
        _buildPanel(widget.topic.centerPanel),
        _buildPanel(widget.topic.rightPanel),
      ],
    );
  }

  Widget _buildPanel(Panel panel) {
    return Container(
      color: Colors.red,
      child: Center(child: Text(panel.author.name)),
    );
  }
}
