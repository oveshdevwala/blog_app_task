// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blog_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlogModel _$BlogModelFromJson(Map<String, dynamic> json) => BlogModel(
      (json['id'] as num?)?.toInt(),
      json['title'] as String?,
      json['author'] as String?,
      json['date_published'] as String?,
      json['content'] as String?,
      json['image'] as String?,
      json['summary'] as String?,
      json['deeplink'] as String?,
    );

Map<String, dynamic> _$BlogModelToJson(BlogModel instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'author': instance.author,
      'date_published': instance.datePublished,
      'content': instance.content,
      'image': instance.image,
      'summary': instance.summary,
      'deeplink': instance.deeplink,
    };
