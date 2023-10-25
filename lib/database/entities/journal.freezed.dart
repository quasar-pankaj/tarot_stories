// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'journal.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Journal _$JournalFromJson(Map<String, dynamic> json) {
  return $Journal.fromJson(json);
}

/// @nodoc
mixin _$Journal {
  int? get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get query => throw _privateConstructorUsedError;
  int get createdTimestamp => throw _privateConstructorUsedError;
  int get modifiedTimestamp => throw _privateConstructorUsedError;
  int get elementId => throw _privateConstructorUsedError;
  SpreadShape get shape => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $JournalCopyWith<Journal> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JournalCopyWith<$Res> {
  factory $JournalCopyWith(Journal value, $Res Function(Journal) then) =
      _$JournalCopyWithImpl<$Res, Journal>;
  @useResult
  $Res call(
      {int? id,
      String name,
      String? query,
      int createdTimestamp,
      int modifiedTimestamp,
      int elementId,
      SpreadShape shape});
}

/// @nodoc
class _$JournalCopyWithImpl<$Res, $Val extends Journal>
    implements $JournalCopyWith<$Res> {
  _$JournalCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? query = freezed,
    Object? createdTimestamp = null,
    Object? modifiedTimestamp = null,
    Object? elementId = null,
    Object? shape = null,
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
      query: freezed == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String?,
      createdTimestamp: null == createdTimestamp
          ? _value.createdTimestamp
          : createdTimestamp // ignore: cast_nullable_to_non_nullable
              as int,
      modifiedTimestamp: null == modifiedTimestamp
          ? _value.modifiedTimestamp
          : modifiedTimestamp // ignore: cast_nullable_to_non_nullable
              as int,
      elementId: null == elementId
          ? _value.elementId
          : elementId // ignore: cast_nullable_to_non_nullable
              as int,
      shape: null == shape
          ? _value.shape
          : shape // ignore: cast_nullable_to_non_nullable
              as SpreadShape,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$$JournalImplCopyWith<$Res> implements $JournalCopyWith<$Res> {
  factory _$$$JournalImplCopyWith(
          _$$JournalImpl value, $Res Function(_$$JournalImpl) then) =
      __$$$JournalImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String name,
      String? query,
      int createdTimestamp,
      int modifiedTimestamp,
      int elementId,
      SpreadShape shape});
}

/// @nodoc
class __$$$JournalImplCopyWithImpl<$Res>
    extends _$JournalCopyWithImpl<$Res, _$$JournalImpl>
    implements _$$$JournalImplCopyWith<$Res> {
  __$$$JournalImplCopyWithImpl(
      _$$JournalImpl _value, $Res Function(_$$JournalImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? query = freezed,
    Object? createdTimestamp = null,
    Object? modifiedTimestamp = null,
    Object? elementId = null,
    Object? shape = null,
  }) {
    return _then(_$$JournalImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      query: freezed == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String?,
      createdTimestamp: null == createdTimestamp
          ? _value.createdTimestamp
          : createdTimestamp // ignore: cast_nullable_to_non_nullable
              as int,
      modifiedTimestamp: null == modifiedTimestamp
          ? _value.modifiedTimestamp
          : modifiedTimestamp // ignore: cast_nullable_to_non_nullable
              as int,
      elementId: null == elementId
          ? _value.elementId
          : elementId // ignore: cast_nullable_to_non_nullable
              as int,
      shape: null == shape
          ? _value.shape
          : shape // ignore: cast_nullable_to_non_nullable
              as SpreadShape,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$$JournalImpl implements $Journal {
  _$$JournalImpl(
      {this.id,
      required this.name,
      this.query,
      required this.createdTimestamp,
      required this.modifiedTimestamp,
      required this.elementId,
      required this.shape});

  factory _$$JournalImpl.fromJson(Map<String, dynamic> json) =>
      _$$$JournalImplFromJson(json);

  @override
  final int? id;
  @override
  final String name;
  @override
  final String? query;
  @override
  final int createdTimestamp;
  @override
  final int modifiedTimestamp;
  @override
  final int elementId;
  @override
  final SpreadShape shape;

  @override
  String toString() {
    return 'Journal(id: $id, name: $name, query: $query, createdTimestamp: $createdTimestamp, modifiedTimestamp: $modifiedTimestamp, elementId: $elementId, shape: $shape)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$$JournalImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.createdTimestamp, createdTimestamp) ||
                other.createdTimestamp == createdTimestamp) &&
            (identical(other.modifiedTimestamp, modifiedTimestamp) ||
                other.modifiedTimestamp == modifiedTimestamp) &&
            (identical(other.elementId, elementId) ||
                other.elementId == elementId) &&
            (identical(other.shape, shape) || other.shape == shape));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, query,
      createdTimestamp, modifiedTimestamp, elementId, shape);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$$JournalImplCopyWith<_$$JournalImpl> get copyWith =>
      __$$$JournalImplCopyWithImpl<_$$JournalImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$$JournalImplToJson(
      this,
    );
  }
}

abstract class $Journal implements Journal {
  factory $Journal(
      {final int? id,
      required final String name,
      final String? query,
      required final int createdTimestamp,
      required final int modifiedTimestamp,
      required final int elementId,
      required final SpreadShape shape}) = _$$JournalImpl;

  factory $Journal.fromJson(Map<String, dynamic> json) =
      _$$JournalImpl.fromJson;

  @override
  int? get id;
  @override
  String get name;
  @override
  String? get query;
  @override
  int get createdTimestamp;
  @override
  int get modifiedTimestamp;
  @override
  int get elementId;
  @override
  SpreadShape get shape;
  @override
  @JsonKey(ignore: true)
  _$$$JournalImplCopyWith<_$$JournalImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
