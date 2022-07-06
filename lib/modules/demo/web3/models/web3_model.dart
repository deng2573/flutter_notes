import 'package:freezed_annotation/freezed_annotation.dart';

part 'web3_model.g.dart';
part 'web3_model.freezed.dart';

@freezed
class RecommendModel with _$RecommendModel {
  const RecommendModel._();

  const factory RecommendModel({
    int? id,
    String? cover,
    String? name,
    String? avatar,
    double? price,
    int? likeCount,
  }) = _RecommendModel;

  factory RecommendModel.fromJson(Map<String, dynamic> json) =>
      _$RecommendModelFromJson(json);
}

@freezed
class RankingModel with _$RankingModel {
  const RankingModel._();

  const factory RankingModel({
    int? id,
    int? num,
    String? name,
    String? avatar,
    double? price,
    double? ratio,
    int? count,
  }) = _RankingModel;

  factory RankingModel.fromJson(Map<String, dynamic> json) =>
      _$RankingModelFromJson(json);
}

@freezed
class MarketModel with _$MarketModel {
  const MarketModel._();

  const factory MarketModel({
    int? id,
    String? cover,
    String? name,
    String? number,
    double? price,
  }) = _MarketModel;

  factory MarketModel.fromJson(Map<String, dynamic> json) =>
      _$MarketModelFromJson(json);
}
