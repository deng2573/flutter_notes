// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nested_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NestedData _$$_NestedDataFromJson(Map<String, dynamic> json) =>
    _$_NestedData(
      id: json['id'] as int,
      simples: (json['simples'] as List<dynamic>?)
          ?.map((e) => NestedModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_NestedDataToJson(_$_NestedData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'simples': instance.simples,
    };

_$_NestedModel _$$_NestedModelFromJson(Map<String, dynamic> json) =>
    _$_NestedModel(
      id: json['id'] as int,
      title: json['title'] as String?,
    );

Map<String, dynamic> _$$_NestedModelToJson(_$_NestedModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
    };
