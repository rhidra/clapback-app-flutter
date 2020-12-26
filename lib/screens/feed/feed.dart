import 'package:clapback_app/bloc/news/news-bloc.dart';
import 'package:clapback_app/bloc/news/news-event.dart';
import 'package:clapback_app/bloc/news/news-state.dart';
import 'package:clapback_app/components/drawer.dart';
import 'package:clapback_app/components/error.dart';
import 'package:clapback_app/screens/feed/components/appbar.dart';
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
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return BlocBuilder<NewsBloc, NewsState>(
        bloc: _bloc,
        builder: (BuildContext context, NewsState state) {
          Widget main;

          if (state is NewsStateLoading) {
            main = Center(child: CircularProgressIndicator());
          } else if (state is NewsStateNotConnected) {
            main = ErrorScreen(
              error:
                  'The server is unreachable. Are you connected to the internet ?',
              icon: Icons.wifi_off,
            );
          } else if (state is NewsStateError) {
            main = Text(state.error);
          } else if (state is NewsStateSuccess) {
            main = PageView(
              controller: _pageCtrl,
              scrollDirection: Axis.vertical,
              children: state.topics.map((t) => TopicWidget(topic: t)).toList(),
            );
          } else {
            main = Text('Error');
          }

          return Padding(
              padding: EdgeInsets.only(top: statusBarHeight),
              child: Scaffold(
                backgroundColor: Colors.black,
                drawer: AppDrawer(),
                extendBodyBehindAppBar: true,
                body: Stack(children: [
                  main,
                  Appbar(),
                ]),
              ));
        });
  }
}
