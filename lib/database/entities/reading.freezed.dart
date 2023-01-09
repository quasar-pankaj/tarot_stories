// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'reading.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Reading _$ReadingFromJson(Map<String, dynamic> json) {
  return $Reading.fromJson(json);
}

/// @nodoc
mixin _$Reading {
  int? get id => throw _privateConstructorUsedError;
  int get journalId => throw _privateConstructorUsedError;
  String get readings => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
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
abstract class _$$$ReadingCopyWith<$Res> implements $ReadingCopyWith<$Res> {
  factory _$$$ReadingCopyWith(
          _$$Reading value, $Res Function(_$$Reading) then) =
      __$$$ReadingCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, int journalId, String readings});
}

/// @nodoc
class __$$$ReadingCopyWithImpl<$Res>
    extends _$ReadingCopyWithImpl<$Res, _$$Reading>
    implements _$$$ReadingCopyWith<$Res> {
  __$$$ReadingCopyWithImpl(_$$Reading _value, $Res Function(_$$Reading) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? journalId = null,
    Object? readings = null,
  }) {
    return _then(_$$Reading(
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
class _$$Reading implements $Reading {
  _$$Reading({this.id, required this.journalId, required this.readings});

  factory _$$Reading.fromJson(Map<String, dynamic> json) =>
      _$$$ReadingFromJson(json);

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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$$Reading &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.journalId, journalId) ||
                other.journalId == journalId) &&
            (identical(other.readings, readings) ||
                other.readings == readings));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, journalId, readings);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$$ReadingCopyWith<_$$Reading> get copyWith =>
      __$$$ReadingCopyWithImpl<_$$Reading>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$$ReadingToJson(
      this,
    );
  }
}

abstract class $Reading implements Reading {
  factory $Reading(
      {final int? id,
      required final int journalId,
      required final String readings}) = _$$Reading;

  factory $Reading.fromJson(Map<String, dynamic> json) = _$$Reading.fromJson;

  @override
  int? get id;
  @override
  int get journalId;
  @override
  String get readings;
  @override
  @JsonKey(ignore: true)
  _$$$ReadingCopyWith<_$$Reading> get copyWith =>
      throw _privateConstructorUsedError;
}
