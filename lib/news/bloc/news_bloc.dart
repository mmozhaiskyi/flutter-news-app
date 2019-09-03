import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:news_application/news/bloc/news_event.dart';
import 'package:news_application/news/bloc/news_state.dart';
import 'package:news_application/news/news_repository.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsRepository newsRepository;

  NewsBloc({ @required this.newsRepository }) : assert(newsRepository != null);

  @override
  NewsState get initialState => Loading();

  @override
  Stream<NewsState> mapEventToState(NewsEvent event) async* {
    if (event is FetchNews) {
      try {
        final articles = await newsRepository.getNews();
        yield Content(articles: articles);
      } catch (_) {
        yield Error();
      }
    }
  }
}
