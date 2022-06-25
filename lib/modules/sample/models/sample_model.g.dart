// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sample_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SampleData _$$_SampleDataFromJson(Map<String, dynamic> json) =>
    _$_SampleData(
      id: json['id'] as int,
      samples: (json['samples'] as List<dynamic>?)
          ?.map((e) => SampleModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_SampleDataToJson(_$_SampleData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'samples': instance.samples,
    };

_$_SampleModel _$$_SampleModelFromJson(Map<String, dynamic> json) =>
    _$_SampleModel(
      id: json['id'] as int,
      title: json['title'] as String?,
    );

Map<String, dynamic> _$$_SampleModelToJson(_$_SampleModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
    };
