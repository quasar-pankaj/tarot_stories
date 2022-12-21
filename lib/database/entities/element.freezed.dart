// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'element.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Element _$ElementFromJson(Map<String, dynamic> json) {
  return $Element.fromJson(json);
}

/// @nodoc
mixin _$Element {
  int? get id => throw _privateConstructorUsedError;
  int get projectId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get synopsis => throw _privateConstructorUsedError;
  List<Spread> get spreads => throw _privateConstructorUsedError;
  ElementType get elementType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
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
      List<Spread> spreads,
      ElementType elementType});
}

/// @nodoc
class _$ElementCopyWithImpl<$Res, $Val extends Element>
    implements $ElementCopyWith<$Res> {
  _$ElementCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? projectId = null,
    Object? name = null,
    Object? synopsis = freezed,
    Object? spreads = null,
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
      spreads: null == spreads
          ? _value.spreads
          : spreads // ignore: cast_nullable_to_non_nullable
              as List<Spread>,
      elementType: null == elementType
          ? _value.elementType
          : elementType // ignore: cast_nullable_to_non_nullable
              as ElementType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$$ElementCopyWith<$Res> implements $ElementCopyWith<$Res> {
  factory _$$$ElementCopyWith(
          _$$Element value, $Res Function(_$$Element) then) =
      __$$$ElementCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      int projectId,
      String name,
      String? synopsis,
      List<Spread> spreads,
      ElementType elementType});
}

/// @nodoc
class __$$$ElementCopyWithImpl<$Res>
    extends _$ElementCopyWithImpl<$Res, _$$Element>
    implements _$$$ElementCopyWith<$Res> {
  __$$$ElementCopyWithImpl(_$$Element _value, $Res Function(_$$Element) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? projectId = null,
    Object? name = null,
    Object? synopsis = freezed,
    Object? spreads = null,
    Object? elementType = null,
  }) {
    return _then(_$$Element(
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
      spreads: null == spreads
          ? _value._spreads
          : spreads // ignore: cast_nullable_to_non_nullable
              as List<Spread>,
      elementType: null == elementType
          ? _value.elementType
          : elementType // ignore: cast_nullable_to_non_nullable
              as ElementType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$$Element implements $Element {
  _$$Element(
      {this.id,
      required this.projectId,
      required this.name,
      this.synopsis,
      required final List<Spread> spreads,
      required this.elementType})
      : _spreads = spreads;

  factory _$$Element.fromJson(Map<String, dynamic> json) =>
      _$$$ElementFromJson(json);

  @override
  final int? id;
  @override
  final int projectId;
  @override
  final String name;
  @override
  final String? synopsis;
  final List<Spread> _spreads;
  @override
  List<Spread> get spreads {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_spreads);
  }

  @override
  final ElementType elementType;

  @override
  String toString() {
    return 'Element(id: $id, projectId: $projectId, name: $name, synopsis: $synopsis, spreads: $spreads, elementType: $elementType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$$Element &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.synopsis, synopsis) ||
                other.synopsis == synopsis) &&
            const DeepCollectionEquality().equals(other._spreads, _spreads) &&
            (identical(other.elementType, elementType) ||
                other.elementType == elementType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, projectId, name, synopsis,
      const DeepCollectionEquality().hash(_spreads), elementType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$$ElementCopyWith<_$$Element> get copyWith =>
      __$$$ElementCopyWithImpl<_$$Element>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$$ElementToJson(
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
      required final List<Spread> spreads,
      required final ElementType elementType}) = _$$Element;

  factory $Element.fromJson(Map<String, dynamic> json) = _$$Element.fromJson;

  @override
  int? get id;
  @override
  int get projectId;
  @override
  String get name;
  @override
  String? get synopsis;
  @override
  List<Spread> get spreads;
  @override
  ElementType get elementType;
  @override
  @JsonKey(ignore: true)
  _$$$ElementCopyWith<_$$Element> get copyWith =>
      throw _privateConstructorUsedError;
}
