import 'package:freezed_annotation/freezed_annotation.dart';

part 'nested_model.g.dart';

part 'nested_model.freezed.dart';

@freezed
class NestedData with _$NestedData {
  const NestedData._();

  const factory NestedData({
    int? id,
    String? name,
    List<NestedModel>? list,
  }) = _NestedData;

  factory NestedData.fromJson(Map<String, dynamic> json) =>
      _$NestedDataFromJson(json);
}

@freezed
class NestedModel with _$NestedModel {
  const NestedModel._();

  const factory NestedModel({
    int? id,
    String? title,
    String? content,
    String? name,
    String? avatar,
    String? cover,
    int? likeCount,
    int? commentCount,
  }) = _NestedModel;

  factory NestedModel.fromJson(Map<String, dynamic> json) =>
      _$NestedModelFromJson(json);
}
