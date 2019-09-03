// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_db.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String name;

  final List<Migration> _migrations = [];

  Callback _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final database = _$AppDatabase();
    database.database = await database.open(
      name ?? ':memory:',
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String> listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  ArticleDao _articleDaoInstance;

  Future<sqflite.Database> open(String name, List<Migration> migrations,
      [Callback callback]) async {
    final path = join(await sqflite.getDatabasesPath(), name);

    return sqflite.openDatabase(
      path,
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `ArticleEntity` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `source` TEXT, `author` TEXT, `title` TEXT, `description` TEXT, `url` TEXT, `urlToImage` TEXT, `publishedAt` TEXT, `content` TEXT)');

        await callback?.onCreate?.call(database, version);
      },
    );
  }

  @override
  ArticleDao get articleDao {
    return _articleDaoInstance ??= _$ArticleDao(database, changeListener);
  }
}

class _$ArticleDao extends ArticleDao {
  _$ArticleDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _articleEntityInsertionAdapter = InsertionAdapter(
            database,
            'ArticleEntity',
            (ArticleEntity item) => <String, dynamic>{
                  'id': item.id,
                  'source': item.source,
                  'author': item.author,
                  'title': item.title,
                  'description': item.description,
                  'url': item.url,
                  'urlToImage': item.urlToImage,
                  'publishedAt': item.publishedAt,
                  'content': item.content
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  static final _articleEntityMapper = (Map<String, dynamic> row) =>
      ArticleEntity(
          row['id'] as int,
          row['source'] as String,
          row['author'] as String,
          row['title'] as String,
          row['description'] as String,
          row['url'] as String,
          row['urlToImage'] as String,
          row['publishedAt'] as String,
          row['content'] as String);

  final InsertionAdapter<ArticleEntity> _articleEntityInsertionAdapter;

  @override
  Future<List<ArticleEntity>> selectAll() async {
    return _queryAdapter.queryList('SELECT * FROM ArticleEntity',
        mapper: _articleEntityMapper);
  }

  @override
  Future<ArticleEntity> selectById(int id) async {
    return _queryAdapter.query('SELECT * FROM ArticleEntity WHERE id = ?',
        arguments: <dynamic>[id], mapper: _articleEntityMapper);
  }

  @override
  Future<List<int>> insert(List<ArticleEntity> entities) {
    return _articleEntityInsertionAdapter.insertListAndReturnIds(
        entities, sqflite.ConflictAlgorithm.abort);
  }
}
