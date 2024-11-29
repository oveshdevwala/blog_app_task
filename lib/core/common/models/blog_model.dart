// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'blog_model.g.dart';

@JsonSerializable()
class BlogModel {
  final int? id;
  final String? title;
  final String? author;
  @JsonKey(name: 'date_published')
  final String? datePublished;
  final String? content;
  final String? image;
  final String? summary;
  BlogModel(
    this.id,
    this.title,
    this.author,
    this.datePublished,
    this.content,
    this.image,
    this.summary,
  );

  factory BlogModel.fromJson(Map<String, dynamic> json) =>
      _$BlogModelFromJson(json);
  Map<String, dynamic> toJson() => _$BlogModelToJson(this);
}
