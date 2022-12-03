// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'spread.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Spread _$SpreadFromJson(Map<String, dynamic> json) {
  return $Spread.fromJson(json);
}

/// @nodoc
mixin _$Spread {
  int? get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get createdTimestamp => throw _privateConstructorUsedError;
  int get modifiedTimestamp => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SpreadCopyWith<Spread> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpreadCopyWith<$Res> {
  factory $SpreadCopyWith(Spread value, $Res Function(Spread) then) =
      _$SpreadCopyWithImpl<$Res, Spread>;
  @useResult
  $Res call(
      {int? id, String name, int createdTimestamp, int modifiedTimestamp});
}

/// @nodoc
class _$SpreadCopyWithImpl<$Res, $Val extends Spread>
    implements $SpreadCopyWith<$Res> {
  _$SpreadCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? createdTimestamp = null,
    Object? modifiedTimestamp = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      createdTimestamp: null == createdTimestamp
          ? _value.createdTimestamp
          : createdTimestamp // ignore: cast_nullable_to_non_nullable
              as int,
      modifiedTimestamp: null == modifiedTimestamp
          ? _value.modifiedTimestamp
          : modifiedTimestamp // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$$SpreadCopyWith<$Res> implements $SpreadCopyWith<$Res> {
  factory _$$$SpreadCopyWith(_$$Spread value, $Res Function(_$$Spread) then) =
      __$$$SpreadCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id, String name, int createdTimestamp, int modifiedTimestamp});
}

/// @nodoc
class __$$$SpreadCopyWithImpl<$Res>
    extends _$SpreadCopyWithImpl<$Res, _$$Spread>
    implements _$$$SpreadCopyWith<$Res> {
  __$$$SpreadCopyWithImpl(_$$Spread _value, $Res Function(_$$Spread) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? createdTimestamp = null,
    Object? modifiedTimestamp = null,
  }) {
    return _then(_$$Spread(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      createdTimestamp: null == createdTimestamp
          ? _value.createdTimestamp
          : createdTimestamp // ignore: cast_nullable_to_non_nullable
              as int,
      modifiedTimestamp: null == modifiedTimestamp
          ? _value.modifiedTimestamp
          : modifiedTimestamp // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$$Spread implements $Spread {
  _$$Spread(
      {this.id,
      required this.name,
      required this.createdTimestamp,
      required this.modifiedTimestamp});

  factory _$$Spread.fromJson(Map<String, dynamic> json) =>
      _$$$SpreadFromJson(json);

  @override
  final int? id;
  @override
  final String name;
  @override
  final int createdTimestamp;
  @override
  final int modifiedTimestamp;

  @override
  String toString() {
    return 'Spread(id: $id, name: $name, createdTimestamp: $createdTimestamp, modifiedTimestamp: $modifiedTimestamp)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$$Spread &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.createdTimestamp, createdTimestamp) ||
                other.createdTimestamp == createdTimestamp) &&
            (identical(other.modifiedTimestamp, modifiedTimestamp) ||
                other.modifiedTimestamp == modifiedTimestamp));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, createdTimestamp, modifiedTimestamp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$$SpreadCopyWith<_$$Spread> get copyWith =>
      __$$$SpreadCopyWithImpl<_$$Spread>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$$SpreadToJson(
      this,
    );
  }
}

abstract class $Spread implements Spread {
  factory $Spread(
      {final int? id,
      required final String name,
      required final int createdTimestamp,
      required final int modifiedTimestamp}) = _$$Spread;

  factory $Spread.fromJson(Map<String, dynamic> json) = _$$Spread.fromJson;

  @override
  int? get id;
  @override
  String get name;
  @override
  int get createdTimestamp;
  @override
  int get modifiedTimestamp;
  @override
  @JsonKey(ignore: true)
  _$$$SpreadCopyWith<_$$Spread> get copyWith =>
      throw _privateConstructorUsedError;
}
