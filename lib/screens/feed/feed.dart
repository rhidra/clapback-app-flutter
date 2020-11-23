import 'package:clapback_app/bloc/news/news-bloc.dart';
import 'package:clapback_app/bloc/news/news-state.dart';
import 'package:clapback_app/services/api-client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/topic.dart';

class Feed extends StatefulWidget {
  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  PageController _pageCtrl;
  ApiClient apiClient;

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
    return BlocBuilder<NewsBloc, NewsState>(
        bloc: BlocProvider.of<NewsBloc>(context),
        builder: (BuildContext context, NewsState state) {
          if (state is NewsStateLoading) {
            return CircularProgressIndicator();
          }
          if (state is NewsStateNotConnected) {
            return CircularProgressIndicator(backgroundColor: Colors.red);
          }
          if (state is NewsStateError) {
            return Text(state.error);
          }
          if (state is NewsStateSuccess) {
            return Scaffold(
              appBar: AppBar(
                title: Text('Hello Clapback'),
              ),
              body: PageView(
                controller: _pageCtrl,
                scrollDirection: Axis.vertical,
                children:
                    state.topics.map((t) => TopicWidget(topic: t)).toList(),
              ),
            );
          } else {
            return Text('Error');
          }
        });
  }
}
