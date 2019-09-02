import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:news_application/news/model/api_response.dart';

import 'model/article.dart';

class NewsApiClient {
  static const baseUrl = "newsapi.org";
  static const _apiKey = "b1a7db3ddb784d8e95e44cdc119a3bb7";
  final http.Client client;

  NewsApiClient({ @required this.client }) : assert(client != null);

  Future<List<Article>> fetchArticles() async {
    final param = {
      'apiKey': _apiKey,
      'q': 'Bitcoin'
    };
    final url = Uri.https(baseUrl, "/v2/everything", param);
    final response = await http.get(url);

    final apiResponse = ApiResponse.fromJson(jsonDecode(response.body));

    if (apiResponse.status != 'ok') {
      throw Exception("Something went wrong!");
    }

    return apiResponse.articles;
  }
}
