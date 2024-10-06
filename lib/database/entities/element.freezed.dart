// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'element.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Element _$ElementFromJson(Map<String, dynamic> json) {
  return $Element.fromJson(json);
}

/// @nodoc
mixin _$Element {
  int? get id => throw _privateConstructorUsedError;
  int get projectId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get synopsis => throw _privateConstructorUsedError;
  JournalCategory get elementType => throw _privateConstructorUsedError;

  /// Serializes this Element to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Element
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ElementCopyWith<Element> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ElementCopyWith<$Res> {
  factory $ElementCopyWith(Element value, $Res Function(Element) then) =
      _$ElementCopyWithImpl<$Res, Element>;
  @useResult
  $Res call(
      {int? id,
      int projectId,
      String name,
      String? synopsis,
      JournalCategory elementType});
}

/// @nodoc
class _$ElementCopyWithImpl<$Res, $Val extends Element>
    implements $ElementCopyWith<$Res> {
  _$ElementCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Element
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? projectId = null,
    Object? name = null,
    Object? synopsis = freezed,
    Object? elementType = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      projectId: null == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      synopsis: freezed == synopsis
          ? _value.synopsis
          : synopsis // ignore: cast_nullable_to_non_nullable
              as String?,
      elementType: null == elementType
          ? _value.elementType
          : elementType // ignore: cast_nullable_to_non_nullable
              as JournalCategory,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$$ElementImplCopyWith<$Res> implements $ElementCopyWith<$Res> {
  factory _$$$ElementImplCopyWith(
          _$$ElementImpl value, $Res Function(_$$ElementImpl) then) =
      __$$$ElementImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      int projectId,
      String name,
      String? synopsis,
      JournalCategory elementType});
}

/// @nodoc
class __$$$ElementImplCopyWithImpl<$Res>
    extends _$ElementCopyWithImpl<$Res, _$$ElementImpl>
    implements _$$$ElementImplCopyWith<$Res> {
  __$$$ElementImplCopyWithImpl(
      _$$ElementImpl _value, $Res Function(_$$ElementImpl) _then)
      : super(_value, _then);

  /// Create a copy of Element
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? projectId = null,
    Object? name = null,
    Object? synopsis = freezed,
    Object? elementType = null,
  }) {
    return _then(_$$ElementImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      projectId: null == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      synopsis: freezed == synopsis
          ? _value.synopsis
          : synopsis // ignore: cast_nullable_to_non_nullable
              as String?,
      elementType: null == elementType
          ? _value.elementType
          : elementType // ignore: cast_nullable_to_non_nullable
              as JournalCategory,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$$ElementImpl implements $Element {
  _$$ElementImpl(
      {this.id,
      required this.projectId,
      required this.name,
      this.synopsis,
      required this.elementType});

  factory _$$ElementImpl.fromJson(Map<String, dynamic> json) =>
      _$$$ElementImplFromJson(json);

  @override
  final int? id;
  @override
  final int projectId;
  @override
  final String name;
  @override
  final String? synopsis;
  @override
  final JournalCategory elementType;

  @override
  String toString() {
    return 'Element(id: $id, projectId: $projectId, name: $name, synopsis: $synopsis, elementType: $elementType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$$ElementImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.synopsis, synopsis) ||
                other.synopsis == synopsis) &&
            (identical(other.elementType, elementType) ||
                other.elementType == elementType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, projectId, name, synopsis, elementType);

  /// Create a copy of Element
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$$ElementImplCopyWith<_$$ElementImpl> get copyWith =>
      __$$$ElementImplCopyWithImpl<_$$ElementImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$$ElementImplToJson(
      this,
    );
  }
}

abstract class $Element implements Element {
  factory $Element(
      {final int? id,
      required final int projectId,
      required final String name,
      final String? synopsis,
      required final JournalCategory elementType}) = _$$ElementImpl;

  factory $Element.fromJson(Map<String, dynamic> json) =
      _$$ElementImpl.fromJson;

  @override
  int? get id;
  @override
  int get projectId;
  @override
  String get name;
  @override
  String? get synopsis;
  @override
  JournalCategory get elementType;

  /// Create a copy of Element
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$$ElementImplCopyWith<_$$ElementImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
