import 'package:clapback_app/bloc/news/news-event.dart';
import 'package:clapback_app/bloc/news/news-state.dart';
import 'package:clapback_app/models/topic.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc();

  @override
  NewsState get initialState => NewsStateLoading();

  @override
  Stream<NewsState> mapEventToState(NewsEvent event) async* {
    if (event is NewsEventGet) {
      yield* _mapEventGetToState(event);
    }
    if (event is NewsEventLike) {
      yield* _mapEventLikeToState(event);
    }
  }

  Stream<NewsState> _mapEventGetToState(NewsEvent event) async* {
    yield NewsStateLoading();
    yield NewsStateSuccess([Topic()]);
  }

  Stream<NewsState> _mapEventLikeToState(NewsEvent event) async* {
    print('liking');
  }
}
