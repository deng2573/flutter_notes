import 'package:freezed_annotation/freezed_annotation.dart';

part 'simple_model.g.dart';

part 'simple_model.freezed.dart';

@freezed
class SimpleData with _$SimpleData {
  const SimpleData._();

  const factory SimpleData({
    required int id,
    required List<SimpleModel>? simples,
  }) = _SimpleData;

  factory SimpleData.fromJson(Map<String, dynamic> json) =>
      _$SimpleDataFromJson(json);
}

@freezed
class SimpleModel with _$SimpleModel {
  const SimpleModel._();

  const factory SimpleModel({
    required int id,
    required String? title,
  }) = _SimpleModel;

  factory SimpleModel.fromJson(Map<String, dynamic> json) =>
      _$SimpleModelFromJson(json);
}
