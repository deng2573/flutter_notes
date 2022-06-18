// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'nested_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NestedData _$NestedDataFromJson(Map<String, dynamic> json) {
  return _NestedData.fromJson(json);
}

/// @nodoc
mixin _$NestedData {
  int get id => throw _privateConstructorUsedError;
  List<NestedModel>? get simples => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NestedDataCopyWith<NestedData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NestedDataCopyWith<$Res> {
  factory $NestedDataCopyWith(
          NestedData value, $Res Function(NestedData) then) =
      _$NestedDataCopyWithImpl<$Res>;
  $Res call({int id, List<NestedModel>? simples});
}

/// @nodoc
class _$NestedDataCopyWithImpl<$Res> implements $NestedDataCopyWith<$Res> {
  _$NestedDataCopyWithImpl(this._value, this._then);

  final NestedData _value;
  // ignore: unused_field
  final $Res Function(NestedData) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? simples = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      simples: simples == freezed
          ? _value.simples
          : simples // ignore: cast_nullable_to_non_nullable
              as List<NestedModel>?,
    ));
  }
}

/// @nodoc
abstract class _$$_NestedDataCopyWith<$Res>
    implements $NestedDataCopyWith<$Res> {
  factory _$$_NestedDataCopyWith(
          _$_NestedData value, $Res Function(_$_NestedData) then) =
      __$$_NestedDataCopyWithImpl<$Res>;
  @override
  $Res call({int id, List<NestedModel>? simples});
}

/// @nodoc
class __$$_NestedDataCopyWithImpl<$Res> extends _$NestedDataCopyWithImpl<$Res>
    implements _$$_NestedDataCopyWith<$Res> {
  __$$_NestedDataCopyWithImpl(
      _$_NestedData _value, $Res Function(_$_NestedData) _then)
      : super(_value, (v) => _then(v as _$_NestedData));

  @override
  _$_NestedData get _value => super._value as _$_NestedData;

  @override
  $Res call({
    Object? id = freezed,
    Object? simples = freezed,
  }) {
    return _then(_$_NestedData(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      simples: simples == freezed
          ? _value._simples
          : simples // ignore: cast_nullable_to_non_nullable
              as List<NestedModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NestedData extends _NestedData {
  const _$_NestedData(
      {required this.id, required final List<NestedModel>? simples})
      : _simples = simples,
        super._();

  factory _$_NestedData.fromJson(Map<String, dynamic> json) =>
      _$$_NestedDataFromJson(json);

  @override
  final int id;
  final List<NestedModel>? _simples;
  @override
  List<NestedModel>? get simples {
    final value = _simples;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'NestedData(id: $id, simples: $simples)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NestedData &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other._simples, _simples));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(_simples));

  @JsonKey(ignore: true)
  @override
  _$$_NestedDataCopyWith<_$_NestedData> get copyWith =>
      __$$_NestedDataCopyWithImpl<_$_NestedData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NestedDataToJson(this);
  }
}

abstract class _NestedData extends NestedData {
  const factory _NestedData(
      {required final int id,
      required final List<NestedModel>? simples}) = _$_NestedData;
  const _NestedData._() : super._();

  factory _NestedData.fromJson(Map<String, dynamic> json) =
      _$_NestedData.fromJson;

  @override
  int get id => throw _privateConstructorUsedError;
  @override
  List<NestedModel>? get simples => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_NestedDataCopyWith<_$_NestedData> get copyWith =>
      throw _privateConstructorUsedError;
}

NestedModel _$NestedModelFromJson(Map<String, dynamic> json) {
  return _NestedModel.fromJson(json);
}

/// @nodoc
mixin _$NestedModel {
  int get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NestedModelCopyWith<NestedModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NestedModelCopyWith<$Res> {
  factory $NestedModelCopyWith(
          NestedModel value, $Res Function(NestedModel) then) =
      _$NestedModelCopyWithImpl<$Res>;
  $Res call({int id, String? title});
}

/// @nodoc
class _$NestedModelCopyWithImpl<$Res> implements $NestedModelCopyWith<$Res> {
  _$NestedModelCopyWithImpl(this._value, this._then);

  final NestedModel _value;
  // ignore: unused_field
  final $Res Function(NestedModel) _then;

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
abstract class _$$_NestedModelCopyWith<$Res>
    implements $NestedModelCopyWith<$Res> {
  factory _$$_NestedModelCopyWith(
          _$_NestedModel value, $Res Function(_$_NestedModel) then) =
      __$$_NestedModelCopyWithImpl<$Res>;
  @override
  $Res call({int id, String? title});
}

/// @nodoc
class __$$_NestedModelCopyWithImpl<$Res> extends _$NestedModelCopyWithImpl<$Res>
    implements _$$_NestedModelCopyWith<$Res> {
  __$$_NestedModelCopyWithImpl(
      _$_NestedModel _value, $Res Function(_$_NestedModel) _then)
      : super(_value, (v) => _then(v as _$_NestedModel));

  @override
  _$_NestedModel get _value => super._value as _$_NestedModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
  }) {
    return _then(_$_NestedModel(
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
class _$_NestedModel extends _NestedModel {
  const _$_NestedModel({required this.id, required this.title}) : super._();

  factory _$_NestedModel.fromJson(Map<String, dynamic> json) =>
      _$$_NestedModelFromJson(json);

  @override
  final int id;
  @override
  final String? title;

  @override
  String toString() {
    return 'NestedModel(id: $id, title: $title)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NestedModel &&
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
  _$$_NestedModelCopyWith<_$_NestedModel> get copyWith =>
      __$$_NestedModelCopyWithImpl<_$_NestedModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NestedModelToJson(this);
  }
}

abstract class _NestedModel extends NestedModel {
  const factory _NestedModel(
      {required final int id, required final String? title}) = _$_NestedModel;
  const _NestedModel._() : super._();

  factory _NestedModel.fromJson(Map<String, dynamic> json) =
      _$_NestedModel.fromJson;

  @override
  int get id => throw _privateConstructorUsedError;
  @override
  String? get title => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_NestedModelCopyWith<_$_NestedModel> get copyWith =>
      throw _privateConstructorUsedError;
}
