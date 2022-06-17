// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'simple_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SimpleData _$SimpleDataFromJson(Map<String, dynamic> json) {
  return _SimpleData.fromJson(json);
}

/// @nodoc
mixin _$SimpleData {
  int get id => throw _privateConstructorUsedError;
  List<SimpleModel>? get simples => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SimpleDataCopyWith<SimpleData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SimpleDataCopyWith<$Res> {
  factory $SimpleDataCopyWith(
          SimpleData value, $Res Function(SimpleData) then) =
      _$SimpleDataCopyWithImpl<$Res>;
  $Res call({int id, List<SimpleModel>? simples});
}

/// @nodoc
class _$SimpleDataCopyWithImpl<$Res> implements $SimpleDataCopyWith<$Res> {
  _$SimpleDataCopyWithImpl(this._value, this._then);

  final SimpleData _value;
  // ignore: unused_field
  final $Res Function(SimpleData) _then;

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
              as List<SimpleModel>?,
    ));
  }
}

/// @nodoc
abstract class _$$_SimpleDataCopyWith<$Res>
    implements $SimpleDataCopyWith<$Res> {
  factory _$$_SimpleDataCopyWith(
          _$_SimpleData value, $Res Function(_$_SimpleData) then) =
      __$$_SimpleDataCopyWithImpl<$Res>;
  @override
  $Res call({int id, List<SimpleModel>? simples});
}

/// @nodoc
class __$$_SimpleDataCopyWithImpl<$Res> extends _$SimpleDataCopyWithImpl<$Res>
    implements _$$_SimpleDataCopyWith<$Res> {
  __$$_SimpleDataCopyWithImpl(
      _$_SimpleData _value, $Res Function(_$_SimpleData) _then)
      : super(_value, (v) => _then(v as _$_SimpleData));

  @override
  _$_SimpleData get _value => super._value as _$_SimpleData;

  @override
  $Res call({
    Object? id = freezed,
    Object? simples = freezed,
  }) {
    return _then(_$_SimpleData(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      simples: simples == freezed
          ? _value._simples
          : simples // ignore: cast_nullable_to_non_nullable
              as List<SimpleModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SimpleData extends _SimpleData {
  const _$_SimpleData(
      {required this.id, required final List<SimpleModel>? simples})
      : _simples = simples,
        super._();

  factory _$_SimpleData.fromJson(Map<String, dynamic> json) =>
      _$$_SimpleDataFromJson(json);

  @override
  final int id;
  final List<SimpleModel>? _simples;
  @override
  List<SimpleModel>? get simples {
    final value = _simples;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'SimpleData(id: $id, simples: $simples)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SimpleData &&
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
  _$$_SimpleDataCopyWith<_$_SimpleData> get copyWith =>
      __$$_SimpleDataCopyWithImpl<_$_SimpleData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SimpleDataToJson(this);
  }
}

abstract class _SimpleData extends SimpleData {
  const factory _SimpleData(
      {required final int id,
      required final List<SimpleModel>? simples}) = _$_SimpleData;
  const _SimpleData._() : super._();

  factory _SimpleData.fromJson(Map<String, dynamic> json) =
      _$_SimpleData.fromJson;

  @override
  int get id => throw _privateConstructorUsedError;
  @override
  List<SimpleModel>? get simples => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_SimpleDataCopyWith<_$_SimpleData> get copyWith =>
      throw _privateConstructorUsedError;
}

SimpleModel _$SimpleModelFromJson(Map<String, dynamic> json) {
  return _SimpleModel.fromJson(json);
}

/// @nodoc
mixin _$SimpleModel {
  int get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SimpleModelCopyWith<SimpleModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SimpleModelCopyWith<$Res> {
  factory $SimpleModelCopyWith(
          SimpleModel value, $Res Function(SimpleModel) then) =
      _$SimpleModelCopyWithImpl<$Res>;
  $Res call({int id, String? title});
}

/// @nodoc
class _$SimpleModelCopyWithImpl<$Res> implements $SimpleModelCopyWith<$Res> {
  _$SimpleModelCopyWithImpl(this._value, this._then);

  final SimpleModel _value;
  // ignore: unused_field
  final $Res Function(SimpleModel) _then;

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
abstract class _$$_SimpleModelCopyWith<$Res>
    implements $SimpleModelCopyWith<$Res> {
  factory _$$_SimpleModelCopyWith(
          _$_SimpleModel value, $Res Function(_$_SimpleModel) then) =
      __$$_SimpleModelCopyWithImpl<$Res>;
  @override
  $Res call({int id, String? title});
}

/// @nodoc
class __$$_SimpleModelCopyWithImpl<$Res> extends _$SimpleModelCopyWithImpl<$Res>
    implements _$$_SimpleModelCopyWith<$Res> {
  __$$_SimpleModelCopyWithImpl(
      _$_SimpleModel _value, $Res Function(_$_SimpleModel) _then)
      : super(_value, (v) => _then(v as _$_SimpleModel));

  @override
  _$_SimpleModel get _value => super._value as _$_SimpleModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
  }) {
    return _then(_$_SimpleModel(
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
class _$_SimpleModel extends _SimpleModel {
  const _$_SimpleModel({required this.id, required this.title}) : super._();

  factory _$_SimpleModel.fromJson(Map<String, dynamic> json) =>
      _$$_SimpleModelFromJson(json);

  @override
  final int id;
  @override
  final String? title;

  @override
  String toString() {
    return 'SimpleModel(id: $id, title: $title)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SimpleModel &&
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
  _$$_SimpleModelCopyWith<_$_SimpleModel> get copyWith =>
      __$$_SimpleModelCopyWithImpl<_$_SimpleModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SimpleModelToJson(this);
  }
}

abstract class _SimpleModel extends SimpleModel {
  const factory _SimpleModel(
      {required final int id, required final String? title}) = _$_SimpleModel;
  const _SimpleModel._() : super._();

  factory _SimpleModel.fromJson(Map<String, dynamic> json) =
      _$_SimpleModel.fromJson;

  @override
  int get id => throw _privateConstructorUsedError;
  @override
  String? get title => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_SimpleModelCopyWith<_$_SimpleModel> get copyWith =>
      throw _privateConstructorUsedError;
}
