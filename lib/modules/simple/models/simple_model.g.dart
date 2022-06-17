// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'simple_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SimpleData _$$_SimpleDataFromJson(Map<String, dynamic> json) =>
    _$_SimpleData(
      id: json['id'] as int,
      simples: (json['simples'] as List<dynamic>?)
          ?.map((e) => SimpleModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_SimpleDataToJson(_$_SimpleData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'simples': instance.simples,
    };

_$_SimpleModel _$$_SimpleModelFromJson(Map<String, dynamic> json) =>
    _$_SimpleModel(
      id: json['id'] as int,
      title: json['title'] as String?,
    );

Map<String, dynamic> _$$_SimpleModelToJson(_$_SimpleModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
    };
