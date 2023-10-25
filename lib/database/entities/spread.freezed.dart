// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
  int get journalId => throw _privateConstructorUsedError;
  List<String> get cards => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SpreadCopyWith<Spread> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpreadCopyWith<$Res> {
  factory $SpreadCopyWith(Spread value, $Res Function(Spread) then) =
      _$SpreadCopyWithImpl<$Res, Spread>;
  @useResult
  $Res call({int? id, int journalId, List<String> cards});
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
    Object? journalId = null,
    Object? cards = null,
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
      cards: null == cards
          ? _value.cards
          : cards // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$$SpreadImplCopyWith<$Res> implements $SpreadCopyWith<$Res> {
  factory _$$$SpreadImplCopyWith(
          _$$SpreadImpl value, $Res Function(_$$SpreadImpl) then) =
      __$$$SpreadImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, int journalId, List<String> cards});
}

/// @nodoc
class __$$$SpreadImplCopyWithImpl<$Res>
    extends _$SpreadCopyWithImpl<$Res, _$$SpreadImpl>
    implements _$$$SpreadImplCopyWith<$Res> {
  __$$$SpreadImplCopyWithImpl(
      _$$SpreadImpl _value, $Res Function(_$$SpreadImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? journalId = null,
    Object? cards = null,
  }) {
    return _then(_$$SpreadImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      journalId: null == journalId
          ? _value.journalId
          : journalId // ignore: cast_nullable_to_non_nullable
              as int,
      cards: null == cards
          ? _value._cards
          : cards // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$$SpreadImpl implements $Spread {
  _$$SpreadImpl(
      {this.id, required this.journalId, required final List<String> cards})
      : _cards = cards;

  factory _$$SpreadImpl.fromJson(Map<String, dynamic> json) =>
      _$$$SpreadImplFromJson(json);

  @override
  final int? id;
  @override
  final int journalId;
  final List<String> _cards;
  @override
  List<String> get cards {
    if (_cards is EqualUnmodifiableListView) return _cards;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cards);
  }

  @override
  String toString() {
    return 'Spread(id: $id, journalId: $journalId, cards: $cards)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$$SpreadImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.journalId, journalId) ||
                other.journalId == journalId) &&
            const DeepCollectionEquality().equals(other._cards, _cards));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, journalId, const DeepCollectionEquality().hash(_cards));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$$SpreadImplCopyWith<_$$SpreadImpl> get copyWith =>
      __$$$SpreadImplCopyWithImpl<_$$SpreadImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$$SpreadImplToJson(
      this,
    );
  }
}

abstract class $Spread implements Spread {
  factory $Spread(
      {final int? id,
      required final int journalId,
      required final List<String> cards}) = _$$SpreadImpl;

  factory $Spread.fromJson(Map<String, dynamic> json) = _$$SpreadImpl.fromJson;

  @override
  int? get id;
  @override
  int get journalId;
  @override
  List<String> get cards;
  @override
  @JsonKey(ignore: true)
  _$$$SpreadImplCopyWith<_$$SpreadImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
