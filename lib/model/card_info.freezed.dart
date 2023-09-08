// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'card_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CardInfo _$CardInfoFromJson(Map<String, dynamic> json) {
  return _CardInfo.fromJson(json);
}

/// @nodoc
mixin _$CardInfo {
  String? get id => throw _privateConstructorUsedError;
  String? get ten => throw _privateConstructorUsedError;
  String? get tinhTrang => throw _privateConstructorUsedError;
  String? get gioiThieu => throw _privateConstructorUsedError;
  String? get tag => throw _privateConstructorUsedError;
  String? get truongHoc => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CardInfoCopyWith<CardInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CardInfoCopyWith<$Res> {
  factory $CardInfoCopyWith(CardInfo value, $Res Function(CardInfo) then) =
      _$CardInfoCopyWithImpl<$Res, CardInfo>;
  @useResult
  $Res call(
      {String? id,
      String? ten,
      String? tinhTrang,
      String? gioiThieu,
      String? tag,
      String? truongHoc});
}

/// @nodoc
class _$CardInfoCopyWithImpl<$Res, $Val extends CardInfo>
    implements $CardInfoCopyWith<$Res> {
  _$CardInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? ten = freezed,
    Object? tinhTrang = freezed,
    Object? gioiThieu = freezed,
    Object? tag = freezed,
    Object? truongHoc = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      ten: freezed == ten
          ? _value.ten
          : ten // ignore: cast_nullable_to_non_nullable
              as String?,
      tinhTrang: freezed == tinhTrang
          ? _value.tinhTrang
          : tinhTrang // ignore: cast_nullable_to_non_nullable
              as String?,
      gioiThieu: freezed == gioiThieu
          ? _value.gioiThieu
          : gioiThieu // ignore: cast_nullable_to_non_nullable
              as String?,
      tag: freezed == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String?,
      truongHoc: freezed == truongHoc
          ? _value.truongHoc
          : truongHoc // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CardInfoCopyWith<$Res> implements $CardInfoCopyWith<$Res> {
  factory _$$_CardInfoCopyWith(
          _$_CardInfo value, $Res Function(_$_CardInfo) then) =
      __$$_CardInfoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? ten,
      String? tinhTrang,
      String? gioiThieu,
      String? tag,
      String? truongHoc});
}

/// @nodoc
class __$$_CardInfoCopyWithImpl<$Res>
    extends _$CardInfoCopyWithImpl<$Res, _$_CardInfo>
    implements _$$_CardInfoCopyWith<$Res> {
  __$$_CardInfoCopyWithImpl(
      _$_CardInfo _value, $Res Function(_$_CardInfo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? ten = freezed,
    Object? tinhTrang = freezed,
    Object? gioiThieu = freezed,
    Object? tag = freezed,
    Object? truongHoc = freezed,
  }) {
    return _then(_$_CardInfo(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      ten: freezed == ten
          ? _value.ten
          : ten // ignore: cast_nullable_to_non_nullable
              as String?,
      tinhTrang: freezed == tinhTrang
          ? _value.tinhTrang
          : tinhTrang // ignore: cast_nullable_to_non_nullable
              as String?,
      gioiThieu: freezed == gioiThieu
          ? _value.gioiThieu
          : gioiThieu // ignore: cast_nullable_to_non_nullable
              as String?,
      tag: freezed == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String?,
      truongHoc: freezed == truongHoc
          ? _value.truongHoc
          : truongHoc // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CardInfo implements _CardInfo {
  const _$_CardInfo(
      {this.id,
      this.ten,
      this.tinhTrang,
      this.gioiThieu,
      this.tag,
      this.truongHoc});

  factory _$_CardInfo.fromJson(Map<String, dynamic> json) =>
      _$$_CardInfoFromJson(json);

  @override
  final String? id;
  @override
  final String? ten;
  @override
  final String? tinhTrang;
  @override
  final String? gioiThieu;
  @override
  final String? tag;
  @override
  final String? truongHoc;

  @override
  String toString() {
    return 'CardInfo(id: $id, ten: $ten, tinhTrang: $tinhTrang, gioiThieu: $gioiThieu, tag: $tag, truongHoc: $truongHoc)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CardInfo &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.ten, ten) || other.ten == ten) &&
            (identical(other.tinhTrang, tinhTrang) ||
                other.tinhTrang == tinhTrang) &&
            (identical(other.gioiThieu, gioiThieu) ||
                other.gioiThieu == gioiThieu) &&
            (identical(other.tag, tag) || other.tag == tag) &&
            (identical(other.truongHoc, truongHoc) ||
                other.truongHoc == truongHoc));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, ten, tinhTrang, gioiThieu, tag, truongHoc);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CardInfoCopyWith<_$_CardInfo> get copyWith =>
      __$$_CardInfoCopyWithImpl<_$_CardInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CardInfoToJson(
      this,
    );
  }
}

abstract class _CardInfo implements CardInfo {
  const factory _CardInfo(
      {final String? id,
      final String? ten,
      final String? tinhTrang,
      final String? gioiThieu,
      final String? tag,
      final String? truongHoc}) = _$_CardInfo;

  factory _CardInfo.fromJson(Map<String, dynamic> json) = _$_CardInfo.fromJson;

  @override
  String? get id;
  @override
  String? get ten;
  @override
  String? get tinhTrang;
  @override
  String? get gioiThieu;
  @override
  String? get tag;
  @override
  String? get truongHoc;
  @override
  @JsonKey(ignore: true)
  _$$_CardInfoCopyWith<_$_CardInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
