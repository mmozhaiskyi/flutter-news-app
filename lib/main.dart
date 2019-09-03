import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_application/news/bloc/news_bloc.dart';
import 'package:news_application/news/bloc/news_event.dart';
import 'package:news_application/news/db/app_db.dart';
import 'package:news_application/news/news_api_client.dart';
import 'package:news_application/news/news_repository.dart';
import 'package:http/http.dart' as http;
import 'package:news_application/news/view/news_list.dart';

Future<void> main() async {
  final db = await $FloorAppDatabase.databaseBuilder('news.db').build();
  final articleDao = db.articleDao;

  final newsRepository = NewsRepository(
      client: NewsApiClient(
          client: http.Client()
      ),
      dao: articleDao
  );

  runApp(MyApp(repository: newsRepository));
}

class MyApp extends StatelessWidget {

  final NewsRepository repository;

  MyApp({ this.repository });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        builder: (context) => NewsBloc(newsRepository: repository)
          ..dispatch(FetchNews()),
        child: NewsList(),
      ),
    );
  }
}
