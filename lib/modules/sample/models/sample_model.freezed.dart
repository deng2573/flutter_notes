// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'sample_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SampleData _$SampleDataFromJson(Map<String, dynamic> json) {
  return _SampleData.fromJson(json);
}

/// @nodoc
mixin _$SampleData {
  int get id => throw _privateConstructorUsedError;
  List<SampleModel>? get samples => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SampleDataCopyWith<SampleData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SampleDataCopyWith<$Res> {
  factory $SampleDataCopyWith(
          SampleData value, $Res Function(SampleData) then) =
      _$SampleDataCopyWithImpl<$Res>;
  $Res call({int id, List<SampleModel>? samples});
}

/// @nodoc
class _$SampleDataCopyWithImpl<$Res> implements $SampleDataCopyWith<$Res> {
  _$SampleDataCopyWithImpl(this._value, this._then);

  final SampleData _value;
  // ignore: unused_field
  final $Res Function(SampleData) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? samples = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      samples: samples == freezed
          ? _value.samples
          : samples // ignore: cast_nullable_to_non_nullable
              as List<SampleModel>?,
    ));
  }
}

/// @nodoc
abstract class _$$_SampleDataCopyWith<$Res>
    implements $SampleDataCopyWith<$Res> {
  factory _$$_SampleDataCopyWith(
          _$_SampleData value, $Res Function(_$_SampleData) then) =
      __$$_SampleDataCopyWithImpl<$Res>;
  @override
  $Res call({int id, List<SampleModel>? samples});
}

/// @nodoc
class __$$_SampleDataCopyWithImpl<$Res> extends _$SampleDataCopyWithImpl<$Res>
    implements _$$_SampleDataCopyWith<$Res> {
  __$$_SampleDataCopyWithImpl(
      _$_SampleData _value, $Res Function(_$_SampleData) _then)
      : super(_value, (v) => _then(v as _$_SampleData));

  @override
  _$_SampleData get _value => super._value as _$_SampleData;

  @override
  $Res call({
    Object? id = freezed,
    Object? samples = freezed,
  }) {
    return _then(_$_SampleData(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      samples: samples == freezed
          ? _value._samples
          : samples // ignore: cast_nullable_to_non_nullable
              as List<SampleModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SampleData extends _SampleData {
  const _$_SampleData(
      {required this.id, required final List<SampleModel>? samples})
      : _samples = samples,
        super._();

  factory _$_SampleData.fromJson(Map<String, dynamic> json) =>
      _$$_SampleDataFromJson(json);

  @override
  final int id;
  final List<SampleModel>? _samples;
  @override
  List<SampleModel>? get samples {
    final value = _samples;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'SampleData(id: $id, samples: $samples)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SampleData &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other._samples, _samples));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(_samples));

  @JsonKey(ignore: true)
  @override
  _$$_SampleDataCopyWith<_$_SampleData> get copyWith =>
      __$$_SampleDataCopyWithImpl<_$_SampleData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SampleDataToJson(this);
  }
}

abstract class _SampleData extends SampleData {
  const factory _SampleData(
      {required final int id,
      required final List<SampleModel>? samples}) = _$_SampleData;
  const _SampleData._() : super._();

  factory _SampleData.fromJson(Map<String, dynamic> json) =
      _$_SampleData.fromJson;

  @override
  int get id => throw _privateConstructorUsedError;
  @override
  List<SampleModel>? get samples => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_SampleDataCopyWith<_$_SampleData> get copyWith =>
      throw _privateConstructorUsedError;
}

SampleModel _$SampleModelFromJson(Map<String, dynamic> json) {
  return _SampleModel.fromJson(json);
}

/// @nodoc
mixin _$SampleModel {
  int get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SampleModelCopyWith<SampleModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SampleModelCopyWith<$Res> {
  factory $SampleModelCopyWith(
          SampleModel value, $Res Function(SampleModel) then) =
      _$SampleModelCopyWithImpl<$Res>;
  $Res call({int id, String? title});
}

/// @nodoc
class _$SampleModelCopyWithImpl<$Res> implements $SampleModelCopyWith<$Res> {
  _$SampleModelCopyWithImpl(this._value, this._then);

  final SampleModel _value;
  // ignore: unused_field
  final $Res Function(SampleModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_SampleModelCopyWith<$Res>
    implements $SampleModelCopyWith<$Res> {
  factory _$$_SampleModelCopyWith(
          _$_SampleModel value, $Res Function(_$_SampleModel) then) =
      __$$_SampleModelCopyWithImpl<$Res>;
  @override
  $Res call({int id, String? title});
}

/// @nodoc
class __$$_SampleModelCopyWithImpl<$Res> extends _$SampleModelCopyWithImpl<$Res>
    implements _$$_SampleModelCopyWith<$Res> {
  __$$_SampleModelCopyWithImpl(
      _$_SampleModel _value, $Res Function(_$_SampleModel) _then)
      : super(_value, (v) => _then(v as _$_SampleModel));

  @override
  _$_SampleModel get _value => super._value as _$_SampleModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
  }) {
    return _then(_$_SampleModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SampleModel extends _SampleModel {
  const _$_SampleModel({required this.id, required this.title}) : super._();

  factory _$_SampleModel.fromJson(Map<String, dynamic> json) =>
      _$$_SampleModelFromJson(json);

  @override
  final int id;
  @override
  final String? title;

  @override
  String toString() {
    return 'SampleModel(id: $id, title: $title)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SampleModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.title, title));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(title));

  @JsonKey(ignore: true)
  @override
  _$$_SampleModelCopyWith<_$_SampleModel> get copyWith =>
      __$$_SampleModelCopyWithImpl<_$_SampleModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SampleModelToJson(this);
  }
}

abstract class _SampleModel extends SampleModel {
  const factory _SampleModel(
      {required final int id, required final String? title}) = _$_SampleModel;
  const _SampleModel._() : super._();

  factory _SampleModel.fromJson(Map<String, dynamic> json) =
      _$_SampleModel.fromJson;

  @override
  int get id => throw _privateConstructorUsedError;
  @override
  String? get title => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_SampleModelCopyWith<_$_SampleModel> get copyWith =>
      throw _privateConstructorUsedError;
}
