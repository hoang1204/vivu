// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tag.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Tag _$TagFromJson(Map<String, dynamic> json) {
  return _Tag.fromJson(json);
}

/// @nodoc
mixin _$Tag {
  String? get idduyettag => throw _privateConstructorUsedError;
  String? get account => throw _privateConstructorUsedError;
  String? get nametag => throw _privateConstructorUsedError;
  String? get tinhtrang => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TagCopyWith<Tag> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TagCopyWith<$Res> {
  factory $TagCopyWith(Tag value, $Res Function(Tag) then) =
      _$TagCopyWithImpl<$Res, Tag>;
  @useResult
  $Res call(
      {String? idduyettag,
      String? account,
      String? nametag,
      String? tinhtrang});
}

/// @nodoc
class _$TagCopyWithImpl<$Res, $Val extends Tag> implements $TagCopyWith<$Res> {
  _$TagCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idduyettag = freezed,
    Object? account = freezed,
    Object? nametag = freezed,
    Object? tinhtrang = freezed,
  }) {
    return _then(_value.copyWith(
      idduyettag: freezed == idduyettag
          ? _value.idduyettag
          : idduyettag // ignore: cast_nullable_to_non_nullable
              as String?,
      account: freezed == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as String?,
      nametag: freezed == nametag
          ? _value.nametag
          : nametag // ignore: cast_nullable_to_non_nullable
              as String?,
      tinhtrang: freezed == tinhtrang
          ? _value.tinhtrang
          : tinhtrang // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TagCopyWith<$Res> implements $TagCopyWith<$Res> {
  factory _$$_TagCopyWith(_$_Tag value, $Res Function(_$_Tag) then) =
      __$$_TagCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? idduyettag,
      String? account,
      String? nametag,
      String? tinhtrang});
}

/// @nodoc
class __$$_TagCopyWithImpl<$Res> extends _$TagCopyWithImpl<$Res, _$_Tag>
    implements _$$_TagCopyWith<$Res> {
  __$$_TagCopyWithImpl(_$_Tag _value, $Res Function(_$_Tag) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idduyettag = freezed,
    Object? account = freezed,
    Object? nametag = freezed,
    Object? tinhtrang = freezed,
  }) {
    return _then(_$_Tag(
      idduyettag: freezed == idduyettag
          ? _value.idduyettag
          : idduyettag // ignore: cast_nullable_to_non_nullable
              as String?,
      account: freezed == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as String?,
      nametag: freezed == nametag
          ? _value.nametag
          : nametag // ignore: cast_nullable_to_non_nullable
              as String?,
      tinhtrang: freezed == tinhtrang
          ? _value.tinhtrang
          : tinhtrang // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Tag implements _Tag {
  const _$_Tag({this.idduyettag, this.account, this.nametag, this.tinhtrang});

  factory _$_Tag.fromJson(Map<String, dynamic> json) => _$$_TagFromJson(json);

  @override
  final String? idduyettag;
  @override
  final String? account;
  @override
  final String? nametag;
  @override
  final String? tinhtrang;

  @override
  String toString() {
    return 'Tag(idduyettag: $idduyettag, account: $account, nametag: $nametag, tinhtrang: $tinhtrang)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Tag &&
            (identical(other.idduyettag, idduyettag) ||
                other.idduyettag == idduyettag) &&
            (identical(other.account, account) || other.account == account) &&
            (identical(other.nametag, nametag) || other.nametag == nametag) &&
            (identical(other.tinhtrang, tinhtrang) ||
                other.tinhtrang == tinhtrang));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, idduyettag, account, nametag, tinhtrang);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TagCopyWith<_$_Tag> get copyWith =>
      __$$_TagCopyWithImpl<_$_Tag>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TagToJson(
      this,
    );
  }
}

abstract class _Tag implements Tag {
  const factory _Tag(
      {final String? idduyettag,
      final String? account,
      final String? nametag,
      final String? tinhtrang}) = _$_Tag;

  factory _Tag.fromJson(Map<String, dynamic> json) = _$_Tag.fromJson;

  @override
  String? get idduyettag;
  @override
  String? get account;
  @override
  String? get nametag;
  @override
  String? get tinhtrang;
  @override
  @JsonKey(ignore: true)
  _$$_TagCopyWith<_$_Tag> get copyWith => throw _privateConstructorUsedError;
}
