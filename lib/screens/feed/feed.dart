import 'package:flutter/material.dart';

import 'components/topic.dart';

class Feed extends StatefulWidget {
  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  PageController _pageCtrl;

  @override
  void initState() {
    super.initState();
    _pageCtrl = PageController();
  }

  @override
  void dispose() {
    _pageCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello Clapback'),
      ),
      body: PageView(
        controller: _pageCtrl,
        scrollDirection: Axis.vertical,
        children: [
          Topic(),
          Topic(),
          Topic(),
          Topic(),
        ],
      ),
    );
  }
}
