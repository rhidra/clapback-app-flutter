import 'package:clapback_app/bloc/news/news-event.dart';
import 'package:clapback_app/bloc/news/news-state.dart';
import 'package:clapback_app/models/topic.dart';
import 'package:clapback_app/services/api-client.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final ApiClient _apiClient;

  NewsBloc(this._apiClient);

  @override
  NewsState get initialState => NewsStateLoading();

  @override
  void onTransition(Transition<NewsEvent, NewsState> transition) {
    print(transition);
    super.onTransition(transition);
  }

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
    try {
      var res = await _apiClient.requestFeed();
      final List topics = res.map<Topic>((o) => Topic.fromJson(o)).toList();
      yield NewsStateSuccess(topics);
    } catch (e) {
      print(e.toString());
      yield NewsStateError(e.toString());
    }
  }

  Stream<NewsState> _mapEventLikeToState(NewsEvent event) async* {
    print('liking');
  }
}
