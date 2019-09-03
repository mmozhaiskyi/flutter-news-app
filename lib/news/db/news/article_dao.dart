import 'package:floor/floor.dart' as floor;
import 'package:news_application/news/db/news/article_entity.dart';

@floor.dao
abstract class ArticleDao {

  @floor.Query('SELECT * FROM ArticleEntity')
  Future<List<ArticleEntity>> selectAll();

  @floor.Query('SELECT * FROM ArticleEntity WHERE id = :id')
  Future<ArticleEntity> selectById(int id);

  @floor.insert
  Future<List<int>> insert(List<ArticleEntity> entities);
}
