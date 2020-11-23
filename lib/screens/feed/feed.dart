import 'package:clapback_app/bloc/news/news-bloc.dart';
import 'package:clapback_app/bloc/news/news-event.dart';
import 'package:clapback_app/bloc/news/news-state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/topic.dart';

class Feed extends StatefulWidget {
  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  PageController _pageCtrl;
  NewsBloc _bloc;

  @override
  void initState() {
    super.initState();
    _pageCtrl = PageController();
    _bloc = BlocProvider.of<NewsBloc>(context);
    _bloc.add(NewsEventGet(0));
  }

  @override
  void dispose() {
    _pageCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBloc, NewsState>(
        bloc: _bloc,
        builder: (BuildContext context, NewsState state) {
          if (state is NewsStateLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is NewsStateNotConnected) {
            return Center(
                child: CircularProgressIndicator(
              backgroundColor: Colors.green,
            ));
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
