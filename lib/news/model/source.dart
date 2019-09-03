import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'source.g.dart';

@JsonSerializable()
class Source {
  final String id;
  final String name;

  Source({ this.id, this.name });

  factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);

  Map<String, dynamic> toJson() => _$SourceToJson(this);

  @override
  String toString() => jsonEncode(this.toJson());

  factory Source.fromString(String source) => Source.fromJson(jsonDecode(source));
}
