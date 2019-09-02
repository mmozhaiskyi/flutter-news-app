import 'package:news_application/news/model/article.dart';

abstract class NewsState {}

class Empty extends NewsState {}

class Loading extends NewsState {}

class Error extends NewsState {}

class Content extends NewsState {
  final List<Article> articles;

  Content({ this.articles });
}
