// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'web3_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RecommendModel _$RecommendModelFromJson(Map<String, dynamic> json) {
  return _RecommendModel.fromJson(json);
}

/// @nodoc
mixin _$RecommendModel {
  int? get id => throw _privateConstructorUsedError;
  String? get cover => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get avatar => throw _privateConstructorUsedError;
  double? get price => throw _privateConstructorUsedError;
  int? get likeCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecommendModelCopyWith<RecommendModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecommendModelCopyWith<$Res> {
  factory $RecommendModelCopyWith(
          RecommendModel value, $Res Function(RecommendModel) then) =
      _$RecommendModelCopyWithImpl<$Res>;
  $Res call(
      {int? id,
      String? cover,
      String? name,
      String? avatar,
      double? price,
      int? likeCount});
}

/// @nodoc
class _$RecommendModelCopyWithImpl<$Res>
    implements $RecommendModelCopyWith<$Res> {
  _$RecommendModelCopyWithImpl(this._value, this._then);

  final RecommendModel _value;
  // ignore: unused_field
  final $Res Function(RecommendModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? cover = freezed,
    Object? name = freezed,
    Object? avatar = freezed,
    Object? price = freezed,
    Object? likeCount = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      cover: cover == freezed
          ? _value.cover
          : cover // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: avatar == freezed
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      likeCount: likeCount == freezed
          ? _value.likeCount
          : likeCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$$_RecommendModelCopyWith<$Res>
    implements $RecommendModelCopyWith<$Res> {
  factory _$$_RecommendModelCopyWith(
          _$_RecommendModel value, $Res Function(_$_RecommendModel) then) =
      __$$_RecommendModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? id,
      String? cover,
      String? name,
      String? avatar,
      double? price,
      int? likeCount});
}

/// @nodoc
class __$$_RecommendModelCopyWithImpl<$Res>
    extends _$RecommendModelCopyWithImpl<$Res>
    implements _$$_RecommendModelCopyWith<$Res> {
  __$$_RecommendModelCopyWithImpl(
      _$_RecommendModel _value, $Res Function(_$_RecommendModel) _then)
      : super(_value, (v) => _then(v as _$_RecommendModel));

  @override
  _$_RecommendModel get _value => super._value as _$_RecommendModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? cover = freezed,
    Object? name = freezed,
    Object? avatar = freezed,
    Object? price = freezed,
    Object? likeCount = freezed,
  }) {
    return _then(_$_RecommendModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      cover: cover == freezed
          ? _value.cover
          : cover // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: avatar == freezed
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      likeCount: likeCount == freezed
          ? _value.likeCount
          : likeCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RecommendModel extends _RecommendModel {
  const _$_RecommendModel(
      {this.id, this.cover, this.name, this.avatar, this.price, this.likeCount})
      : super._();

  factory _$_RecommendModel.fromJson(Map<String, dynamic> json) =>
      _$$_RecommendModelFromJson(json);

  @override
  final int? id;
  @override
  final String? cover;
  @override
  final String? name;
  @override
  final String? avatar;
  @override
  final double? price;
  @override
  final int? likeCount;

  @override
  String toString() {
    return 'RecommendModel(id: $id, cover: $cover, name: $name, avatar: $avatar, price: $price, likeCount: $likeCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RecommendModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.cover, cover) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.avatar, avatar) &&
            const DeepCollectionEquality().equals(other.price, price) &&
            const DeepCollectionEquality().equals(other.likeCount, likeCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(cover),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(avatar),
      const DeepCollectionEquality().hash(price),
      const DeepCollectionEquality().hash(likeCount));

  @JsonKey(ignore: true)
  @override
  _$$_RecommendModelCopyWith<_$_RecommendModel> get copyWith =>
      __$$_RecommendModelCopyWithImpl<_$_RecommendModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RecommendModelToJson(this);
  }
}

abstract class _RecommendModel extends RecommendModel {
  const factory _RecommendModel(
      {final int? id,
      final String? cover,
      final String? name,
      final String? avatar,
      final double? price,
      final int? likeCount}) = _$_RecommendModel;
  const _RecommendModel._() : super._();

  factory _RecommendModel.fromJson(Map<String, dynamic> json) =
      _$_RecommendModel.fromJson;

  @override
  int? get id => throw _privateConstructorUsedError;
  @override
  String? get cover => throw _privateConstructorUsedError;
  @override
  String? get name => throw _privateConstructorUsedError;
  @override
  String? get avatar => throw _privateConstructorUsedError;
  @override
  double? get price => throw _privateConstructorUsedError;
  @override
  int? get likeCount => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_RecommendModelCopyWith<_$_RecommendModel> get copyWith =>
      throw _privateConstructorUsedError;
}

RankingModel _$RankingModelFromJson(Map<String, dynamic> json) {
  return _RankingModel.fromJson(json);
}

/// @nodoc
mixin _$RankingModel {
  int? get id => throw _privateConstructorUsedError;
  int? get num => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get avatar => throw _privateConstructorUsedError;
  double? get price => throw _privateConstructorUsedError;
  double? get ratio => throw _privateConstructorUsedError;
  int? get count => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RankingModelCopyWith<RankingModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RankingModelCopyWith<$Res> {
  factory $RankingModelCopyWith(
          RankingModel value, $Res Function(RankingModel) then) =
      _$RankingModelCopyWithImpl<$Res>;
  $Res call(
      {int? id,
      int? num,
      String? name,
      String? avatar,
      double? price,
      double? ratio,
      int? count});
}

/// @nodoc
class _$RankingModelCopyWithImpl<$Res> implements $RankingModelCopyWith<$Res> {
  _$RankingModelCopyWithImpl(this._value, this._then);

  final RankingModel _value;
  // ignore: unused_field
  final $Res Function(RankingModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? num = freezed,
    Object? name = freezed,
    Object? avatar = freezed,
    Object? price = freezed,
    Object? ratio = freezed,
    Object? count = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      num: num == freezed
          ? _value.num
          : num // ignore: cast_nullable_to_non_nullable
              as int?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: avatar == freezed
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      ratio: ratio == freezed
          ? _value.ratio
          : ratio // ignore: cast_nullable_to_non_nullable
              as double?,
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$$_RankingModelCopyWith<$Res>
    implements $RankingModelCopyWith<$Res> {
  factory _$$_RankingModelCopyWith(
          _$_RankingModel value, $Res Function(_$_RankingModel) then) =
      __$$_RankingModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? id,
      int? num,
      String? name,
      String? avatar,
      double? price,
      double? ratio,
      int? count});
}

/// @nodoc
class __$$_RankingModelCopyWithImpl<$Res>
    extends _$RankingModelCopyWithImpl<$Res>
    implements _$$_RankingModelCopyWith<$Res> {
  __$$_RankingModelCopyWithImpl(
      _$_RankingModel _value, $Res Function(_$_RankingModel) _then)
      : super(_value, (v) => _then(v as _$_RankingModel));

  @override
  _$_RankingModel get _value => super._value as _$_RankingModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? num = freezed,
    Object? name = freezed,
    Object? avatar = freezed,
    Object? price = freezed,
    Object? ratio = freezed,
    Object? count = freezed,
  }) {
    return _then(_$_RankingModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      num: num == freezed
          ? _value.num
          : num // ignore: cast_nullable_to_non_nullable
              as int?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: avatar == freezed
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      ratio: ratio == freezed
          ? _value.ratio
          : ratio // ignore: cast_nullable_to_non_nullable
              as double?,
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RankingModel extends _RankingModel {
  const _$_RankingModel(
      {this.id,
      this.num,
      this.name,
      this.avatar,
      this.price,
      this.ratio,
      this.count})
      : super._();

  factory _$_RankingModel.fromJson(Map<String, dynamic> json) =>
      _$$_RankingModelFromJson(json);

  @override
  final int? id;
  @override
  final int? num;
  @override
  final String? name;
  @override
  final String? avatar;
  @override
  final double? price;
  @override
  final double? ratio;
  @override
  final int? count;

  @override
  String toString() {
    return 'RankingModel(id: $id, num: $num, name: $name, avatar: $avatar, price: $price, ratio: $ratio, count: $count)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RankingModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.num, num) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.avatar, avatar) &&
            const DeepCollectionEquality().equals(other.price, price) &&
            const DeepCollectionEquality().equals(other.ratio, ratio) &&
            const DeepCollectionEquality().equals(other.count, count));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(num),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(avatar),
      const DeepCollectionEquality().hash(price),
      const DeepCollectionEquality().hash(ratio),
      const DeepCollectionEquality().hash(count));

  @JsonKey(ignore: true)
  @override
  _$$_RankingModelCopyWith<_$_RankingModel> get copyWith =>
      __$$_RankingModelCopyWithImpl<_$_RankingModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RankingModelToJson(this);
  }
}

abstract class _RankingModel extends RankingModel {
  const factory _RankingModel(
      {final int? id,
      final int? num,
      final String? name,
      final String? avatar,
      final double? price,
      final double? ratio,
      final int? count}) = _$_RankingModel;
  const _RankingModel._() : super._();

  factory _RankingModel.fromJson(Map<String, dynamic> json) =
      _$_RankingModel.fromJson;

  @override
  int? get id => throw _privateConstructorUsedError;
  @override
  int? get num => throw _privateConstructorUsedError;
  @override
  String? get name => throw _privateConstructorUsedError;
  @override
  String? get avatar => throw _privateConstructorUsedError;
  @override
  double? get price => throw _privateConstructorUsedError;
  @override
  double? get ratio => throw _privateConstructorUsedError;
  @override
  int? get count => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_RankingModelCopyWith<_$_RankingModel> get copyWith =>
      throw _privateConstructorUsedError;
}

MarketModel _$MarketModelFromJson(Map<String, dynamic> json) {
  return _MarketModel.fromJson(json);
}

/// @nodoc
mixin _$MarketModel {
  int? get id => throw _privateConstructorUsedError;
  String? get cover => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get number => throw _privateConstructorUsedError;
  double? get price => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MarketModelCopyWith<MarketModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MarketModelCopyWith<$Res> {
  factory $MarketModelCopyWith(
          MarketModel value, $Res Function(MarketModel) then) =
      _$MarketModelCopyWithImpl<$Res>;
  $Res call(
      {int? id, String? cover, String? name, String? number, double? price});
}

/// @nodoc
class _$MarketModelCopyWithImpl<$Res> implements $MarketModelCopyWith<$Res> {
  _$MarketModelCopyWithImpl(this._value, this._then);

  final MarketModel _value;
  // ignore: unused_field
  final $Res Function(MarketModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? cover = freezed,
    Object? name = freezed,
    Object? number = freezed,
    Object? price = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      cover: cover == freezed
          ? _value.cover
          : cover // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      number: number == freezed
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String?,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
abstract class _$$_MarketModelCopyWith<$Res>
    implements $MarketModelCopyWith<$Res> {
  factory _$$_MarketModelCopyWith(
          _$_MarketModel value, $Res Function(_$_MarketModel) then) =
      __$$_MarketModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? id, String? cover, String? name, String? number, double? price});
}

/// @nodoc
class __$$_MarketModelCopyWithImpl<$Res> extends _$MarketModelCopyWithImpl<$Res>
    implements _$$_MarketModelCopyWith<$Res> {
  __$$_MarketModelCopyWithImpl(
      _$_MarketModel _value, $Res Function(_$_MarketModel) _then)
      : super(_value, (v) => _then(v as _$_MarketModel));

  @override
  _$_MarketModel get _value => super._value as _$_MarketModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? cover = freezed,
    Object? name = freezed,
    Object? number = freezed,
    Object? price = freezed,
  }) {
    return _then(_$_MarketModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      cover: cover == freezed
          ? _value.cover
          : cover // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      number: number == freezed
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String?,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MarketModel extends _MarketModel {
  const _$_MarketModel(
      {this.id, this.cover, this.name, this.number, this.price})
      : super._();

  factory _$_MarketModel.fromJson(Map<String, dynamic> json) =>
      _$$_MarketModelFromJson(json);

  @override
  final int? id;
  @override
  final String? cover;
  @override
  final String? name;
  @override
  final String? number;
  @override
  final double? price;

  @override
  String toString() {
    return 'MarketModel(id: $id, cover: $cover, name: $name, number: $number, price: $price)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MarketModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.cover, cover) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.number, number) &&
            const DeepCollectionEquality().equals(other.price, price));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(cover),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(number),
      const DeepCollectionEquality().hash(price));

  @JsonKey(ignore: true)
  @override
  _$$_MarketModelCopyWith<_$_MarketModel> get copyWith =>
      __$$_MarketModelCopyWithImpl<_$_MarketModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MarketModelToJson(this);
  }
}

abstract class _MarketModel extends MarketModel {
  const factory _MarketModel(
      {final int? id,
      final String? cover,
      final String? name,
      final String? number,
      final double? price}) = _$_MarketModel;
  const _MarketModel._() : super._();

  factory _MarketModel.fromJson(Map<String, dynamic> json) =
      _$_MarketModel.fromJson;

  @override
  int? get id => throw _privateConstructorUsedError;
  @override
  String? get cover => throw _privateConstructorUsedError;
  @override
  String? get name => throw _privateConstructorUsedError;
  @override
  String? get number => throw _privateConstructorUsedError;
  @override
  double? get price => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_MarketModelCopyWith<_$_MarketModel> get copyWith =>
      throw _privateConstructorUsedError;
}
