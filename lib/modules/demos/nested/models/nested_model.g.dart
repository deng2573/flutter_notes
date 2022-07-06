// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nested_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NestedData _$$_NestedDataFromJson(Map<String, dynamic> json) =>
    _$_NestedData(
      id: json['id'] as int?,
      name: json['name'] as String?,
      list: (json['list'] as List<dynamic>?)
          ?.map((e) => NestedModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_NestedDataToJson(_$_NestedData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'list': instance.list,
    };

_$_NestedModel _$$_NestedModelFromJson(Map<String, dynamic> json) =>
    _$_NestedModel(
      id: json['id'] as int?,
      title: json['title'] as String?,
      content: json['content'] as String?,
      name: json['name'] as String?,
      avatar: json['avatar'] as String?,
      cover: json['cover'] as String?,
      likeCount: json['likeCount'] as int?,
      commentCount: json['commentCount'] as int?,
    );

Map<String, dynamic> _$$_NestedModelToJson(_$_NestedModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'name': instance.name,
      'avatar': instance.avatar,
      'cover': instance.cover,
      'likeCount': instance.likeCount,
      'commentCount': instance.commentCount,
    };
