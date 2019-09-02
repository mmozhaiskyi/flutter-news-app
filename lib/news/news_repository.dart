import 'package:flutter/foundation.dart';
import 'package:news_application/news/model/article.dart';
import 'package:news_application/news/news_api_client.dart';

class NewsRepository {
  final NewsApiClient client;

  NewsRepository({ @required this.client }) : assert(client != null);

  Future<List<Article>> getNews() {
    return client.fetchArticles();
  }
}
