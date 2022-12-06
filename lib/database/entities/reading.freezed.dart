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
  String get cardId => throw _privateConstructorUsedError;
  PositionTemplate get context => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReadingCopyWith<Reading> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReadingCopyWith<$Res> {
  factory $ReadingCopyWith(Reading value, $Res Function(Reading) then) =
      _$ReadingCopyWithImpl<$Res, Reading>;
  @useResult
  $Res call({String cardId, PositionTemplate context, String text});

  $PositionTemplateCopyWith<$Res> get context;
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
    Object? cardId = null,
    Object? context = null,
    Object? text = null,
  }) {
    return _then(_value.copyWith(
      cardId: null == cardId
          ? _value.cardId
          : cardId // ignore: cast_nullable_to_non_nullable
              as String,
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as PositionTemplate,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PositionTemplateCopyWith<$Res> get context {
    return $PositionTemplateCopyWith<$Res>(_value.context, (value) {
      return _then(_value.copyWith(context: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$$ReadingCopyWith<$Res> implements $ReadingCopyWith<$Res> {
  factory _$$$ReadingCopyWith(
          _$$Reading value, $Res Function(_$$Reading) then) =
      __$$$ReadingCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String cardId, PositionTemplate context, String text});

  @override
  $PositionTemplateCopyWith<$Res> get context;
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
    Object? cardId = null,
    Object? context = null,
    Object? text = null,
  }) {
    return _then(_$$Reading(
      cardId: null == cardId
          ? _value.cardId
          : cardId // ignore: cast_nullable_to_non_nullable
              as String,
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as PositionTemplate,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$$Reading implements $Reading {
  _$$Reading({required this.cardId, required this.context, required this.text});

  factory _$$Reading.fromJson(Map<String, dynamic> json) =>
      _$$$ReadingFromJson(json);

  @override
  final String cardId;
  @override
  final PositionTemplate context;
  @override
  final String text;

  @override
  String toString() {
    return 'Reading(cardId: $cardId, context: $context, text: $text)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$$Reading &&
            (identical(other.cardId, cardId) || other.cardId == cardId) &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.text, text) || other.text == text));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, cardId, context, text);

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
      {required final String cardId,
      required final PositionTemplate context,
      required final String text}) = _$$Reading;

  factory $Reading.fromJson(Map<String, dynamic> json) = _$$Reading.fromJson;

  @override
  String get cardId;
  @override
  PositionTemplate get context;
  @override
  String get text;
  @override
  @JsonKey(ignore: true)
  _$$$ReadingCopyWith<_$$Reading> get copyWith =>
      throw _privateConstructorUsedError;
}
