// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'web3_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RecommendModel _$$_RecommendModelFromJson(Map<String, dynamic> json) =>
    _$_RecommendModel(
      id: json['id'] as int?,
      cover: json['cover'] as String?,
      name: json['name'] as String?,
      avatar: json['avatar'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      likeCount: json['likeCount'] as int?,
    );

Map<String, dynamic> _$$_RecommendModelToJson(_$_RecommendModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cover': instance.cover,
      'name': instance.name,
      'avatar': instance.avatar,
      'price': instance.price,
      'likeCount': instance.likeCount,
    };

_$_RankingModel _$$_RankingModelFromJson(Map<String, dynamic> json) =>
    _$_RankingModel(
      id: json['id'] as int?,
      num: json['num'] as int?,
      name: json['name'] as String?,
      avatar: json['avatar'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      ratio: (json['ratio'] as num?)?.toDouble(),
      count: json['count'] as int?,
    );

Map<String, dynamic> _$$_RankingModelToJson(_$_RankingModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'num': instance.num,
      'name': instance.name,
      'avatar': instance.avatar,
      'price': instance.price,
      'ratio': instance.ratio,
      'count': instance.count,
    };

_$_MarketModel _$$_MarketModelFromJson(Map<String, dynamic> json) =>
    _$_MarketModel(
      id: json['id'] as int?,
      cover: json['cover'] as String?,
      name: json['name'] as String?,
      number: json['number'] as String?,
      price: (json['price'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_MarketModelToJson(_$_MarketModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cover': instance.cover,
      'name': instance.name,
      'number': instance.number,
      'price': instance.price,
    };
