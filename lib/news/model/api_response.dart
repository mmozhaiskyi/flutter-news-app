import 'package:json_annotation/json_annotation.dart';

import 'package:news_application/news/model/article.dart';

part 'api_response.g.dart';

@JsonSerializable(explicitToJson: true)
class ApiResponse {
  final String status;
  final int totalResults;
  final List<Article> articles;

  ApiResponse({ this.status, this.totalResults, this.articles });

  factory ApiResponse.fromJson(Map<String, dynamic> json) => _$ApiResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ApiResponseToJson(this);
}
