// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'imagelist.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Imagelist _$ImagelistFromJson(Map<String, dynamic> json) {
  return _Imagelist.fromJson(json);
}

/// @nodoc
mixin _$Imagelist {
  String? get id => throw _privateConstructorUsedError;
  String? get idimg => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ImagelistCopyWith<Imagelist> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImagelistCopyWith<$Res> {
  factory $ImagelistCopyWith(Imagelist value, $Res Function(Imagelist) then) =
      _$ImagelistCopyWithImpl<$Res, Imagelist>;
  @useResult
  $Res call({String? id, String? idimg, String? name});
}

/// @nodoc
class _$ImagelistCopyWithImpl<$Res, $Val extends Imagelist>
    implements $ImagelistCopyWith<$Res> {
  _$ImagelistCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? idimg = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      idimg: freezed == idimg
          ? _value.idimg
          : idimg // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ImagelistCopyWith<$Res> implements $ImagelistCopyWith<$Res> {
  factory _$$_ImagelistCopyWith(
          _$_Imagelist value, $Res Function(_$_Imagelist) then) =
      __$$_ImagelistCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, String? idimg, String? name});
}

/// @nodoc
class __$$_ImagelistCopyWithImpl<$Res>
    extends _$ImagelistCopyWithImpl<$Res, _$_Imagelist>
    implements _$$_ImagelistCopyWith<$Res> {
  __$$_ImagelistCopyWithImpl(
      _$_Imagelist _value, $Res Function(_$_Imagelist) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? idimg = freezed,
    Object? name = freezed,
  }) {
    return _then(_$_Imagelist(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      idimg: freezed == idimg
          ? _value.idimg
          : idimg // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Imagelist implements _Imagelist {
  const _$_Imagelist({this.id, this.idimg, this.name});

  factory _$_Imagelist.fromJson(Map<String, dynamic> json) =>
      _$$_ImagelistFromJson(json);

  @override
  final String? id;
  @override
  final String? idimg;
  @override
  final String? name;

  @override
  String toString() {
    return 'Imagelist(id: $id, idimg: $idimg, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Imagelist &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.idimg, idimg) || other.idimg == idimg) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, idimg, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ImagelistCopyWith<_$_Imagelist> get copyWith =>
      __$$_ImagelistCopyWithImpl<_$_Imagelist>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ImagelistToJson(
      this,
    );
  }
}

abstract class _Imagelist implements Imagelist {
  const factory _Imagelist(
      {final String? id,
      final String? idimg,
      final String? name}) = _$_Imagelist;

  factory _Imagelist.fromJson(Map<String, dynamic> json) =
      _$_Imagelist.fromJson;

  @override
  String? get id;
  @override
  String? get idimg;
  @override
  String? get name;
  @override
  @JsonKey(ignore: true)
  _$$_ImagelistCopyWith<_$_Imagelist> get copyWith =>
      throw _privateConstructorUsedError;
}
