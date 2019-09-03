import 'package:flutter/foundation.dart';
import 'package:news_application/news/db/news/article_dao.dart';
import 'package:news_application/news/db/news/article_entity.dart';
import 'package:news_application/news/model/article.dart';
import 'package:news_application/news/news_api_client.dart';

class NewsRepository {
  final NewsApiClient client;
  final ArticleDao dao;

  NewsRepository({
    @required this.client,
    @required this.dao
  }) : assert(client != null),
        assert(dao != null);

  Future<List<Article>> getNews() async {
    final remoteData = await client.fetchArticles();

    final dbData = remoteData.map((article) => ArticleEntity.fromArticle(article)).toList();
    await dao.insert(dbData);

    return remoteData;
  }

  Future<List<Article>> getSavedNews() async {
    final dbData = await dao.selectAll();
    return dbData.map((item) => item.toArticle()).toList();
  }
}
