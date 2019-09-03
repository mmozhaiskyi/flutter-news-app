import 'package:floor/floor.dart';
import 'package:news_application/news/model/article.dart';
import 'package:news_application/news/model/source.dart';

@entity
class ArticleEntity {
  @PrimaryKey(autoGenerate: true)
  final int id;
  final String source;
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String content;

  ArticleEntity(
    this.id,
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content
  );

  factory ArticleEntity.fromArticle(Article article) => ArticleEntity(
      null,
      article.source.toString(),
      article.author,
      article.title,
      article.description,
      article.url,
      article.urlToImage,
      article.publishedAt.toString(),
      article.content
  );

  Article toArticle() => Article(
    source: Source.fromString(this.source),
    author: this.author,
    title: this.title,
    description: this.description,
    url: this.url,
    urlToImage: this.urlToImage,
    publishedAt: DateTime.parse(this.publishedAt),
    content: this.content
  );
}
