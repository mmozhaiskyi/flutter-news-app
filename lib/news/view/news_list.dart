import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_application/news/bloc/news_bloc.dart';
import 'package:news_application/news/bloc/news_state.dart';
import 'package:news_application/news/model/article.dart';

class NewsList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News')
      ),
      body: Center(
        child: BlocBuilder<NewsBloc, NewsState>(
            builder: (context, state) {
              if (state is Empty) {
                return Center(child: Text('News is empty'));
              }

              if (state is Loading) {
                return Center(child: CircularProgressIndicator());
              }

              if (state is Error) {
                return Center(child: Text('Something went wrong'));
              }

              if (state is Content) {
                final items = state.articles;
                return ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) => _buildArticleTile(items[index])
                );
              }
              return null;
            }
        ),
      ),
    );
  }

  Widget _buildArticleTile(Article article) {
    return Card(
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Image.network(article.urlToImage),
              Positioned(
                  bottom: 10,
                  left: 10,
                  right: 10,
                  child: Text(
                      article.title,
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white
                      )
                  )
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              article.description,
              style: TextStyle(
                fontSize: 14
              )
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                article.author,
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey
                ),
              ),
            ),
          )
        ],
      )
    );
  }
}
