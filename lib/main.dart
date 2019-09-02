import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_application/news/bloc/news_bloc.dart';
import 'package:news_application/news/bloc/news_event.dart';
import 'package:news_application/news/news_api_client.dart';
import 'package:news_application/news/news_repository.dart';
import 'package:http/http.dart' as http;
import 'package:news_application/news/view/news_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  final newsRepository = NewsRepository(
      client: NewsApiClient(
          client: http.Client()
      )
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        builder: (context) => NewsBloc(newsRepository: newsRepository)
          ..dispatch(FetchNews()),
        child: NewsList(),
      ),
    );
  }
}
