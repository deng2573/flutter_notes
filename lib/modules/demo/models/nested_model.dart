import 'package:freezed_annotation/freezed_annotation.dart';

part 'nested_model.g.dart';

part 'nested_model.freezed.dart';

@freezed
class NestedData with _$NestedData {
  const NestedData._();

  const factory NestedData({
    required int id,
    required List<NestedModel>? simples,
  }) = _NestedData;

  factory NestedData.fromJson(Map<String, dynamic> json) =>
      _$NestedDataFromJson(json);
}

@freezed
class NestedModel with _$NestedModel {
  const NestedModel._();

  const factory NestedModel({
    required int id,
    required String? title,
  }) = _NestedModel;

  factory NestedModel.fromJson(Map<String, dynamic> json) =>
      _$NestedModelFromJson(json);
}
