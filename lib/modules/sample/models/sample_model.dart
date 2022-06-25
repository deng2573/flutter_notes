import 'package:freezed_annotation/freezed_annotation.dart';

part 'sample_model.g.dart';

part 'sample_model.freezed.dart';

@freezed
class SampleData with _$SampleData {
  const SampleData._();

  const factory SampleData({
    required int id,
    required List<SampleModel>? samples,
  }) = _SampleData;

  factory SampleData.fromJson(Map<String, dynamic> json) =>
      _$SampleDataFromJson(json);
}

@freezed
class SampleModel with _$SampleModel {
  const SampleModel._();

  const factory SampleModel({
    required int id,
    required String? title,
  }) = _SampleModel;

  factory SampleModel.fromJson(Map<String, dynamic> json) =>
      _$SampleModelFromJson(json);
}
