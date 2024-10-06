// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reading.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Reading _$ReadingFromJson(Map<String, dynamic> json) {
  return $Reading.fromJson(json);
}

/// @nodoc
mixin _$Reading {
  int? get id => throw _privateConstructorUsedError;
  int get journalId => throw _privateConstructorUsedError;
  String get readings => throw _privateConstructorUsedError;

  /// Serializes this Reading to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Reading
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReadingCopyWith<Reading> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReadingCopyWith<$Res> {
  factory $ReadingCopyWith(Reading value, $Res Function(Reading) then) =
      _$ReadingCopyWithImpl<$Res, Reading>;
  @useResult
  $Res call({int? id, int journalId, String readings});
}

/// @nodoc
class _$ReadingCopyWithImpl<$Res, $Val extends Reading>
    implements $ReadingCopyWith<$Res> {
  _$ReadingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Reading
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? journalId = null,
    Object? readings = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      journalId: null == journalId
          ? _value.journalId
          : journalId // ignore: cast_nullable_to_non_nullable
              as int,
      readings: null == readings
          ? _value.readings
          : readings // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$$ReadingImplCopyWith<$Res> implements $ReadingCopyWith<$Res> {
  factory _$$$ReadingImplCopyWith(
          _$$ReadingImpl value, $Res Function(_$$ReadingImpl) then) =
      __$$$ReadingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, int journalId, String readings});
}

/// @nodoc
class __$$$ReadingImplCopyWithImpl<$Res>
    extends _$ReadingCopyWithImpl<$Res, _$$ReadingImpl>
    implements _$$$ReadingImplCopyWith<$Res> {
  __$$$ReadingImplCopyWithImpl(
      _$$ReadingImpl _value, $Res Function(_$$ReadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of Reading
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? journalId = null,
    Object? readings = null,
  }) {
    return _then(_$$ReadingImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      journalId: null == journalId
          ? _value.journalId
          : journalId // ignore: cast_nullable_to_non_nullable
              as int,
      readings: null == readings
          ? _value.readings
          : readings // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$$ReadingImpl implements $Reading {
  _$$ReadingImpl({this.id, required this.journalId, required this.readings});

  factory _$$ReadingImpl.fromJson(Map<String, dynamic> json) =>
      _$$$ReadingImplFromJson(json);

  @override
  final int? id;
  @override
  final int journalId;
  @override
  final String readings;

  @override
  String toString() {
    return 'Reading(id: $id, journalId: $journalId, readings: $readings)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$$ReadingImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.journalId, journalId) ||
                other.journalId == journalId) &&
            (identical(other.readings, readings) ||
                other.readings == readings));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, journalId, readings);

  /// Create a copy of Reading
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$$ReadingImplCopyWith<_$$ReadingImpl> get copyWith =>
      __$$$ReadingImplCopyWithImpl<_$$ReadingImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$$ReadingImplToJson(
      this,
    );
  }
}

abstract class $Reading implements Reading {
  factory $Reading(
      {final int? id,
      required final int journalId,
      required final String readings}) = _$$ReadingImpl;

  factory $Reading.fromJson(Map<String, dynamic> json) =
      _$$ReadingImpl.fromJson;

  @override
  int? get id;
  @override
  int get journalId;
  @override
  String get readings;

  /// Create a copy of Reading
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$$ReadingImplCopyWith<_$$ReadingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
