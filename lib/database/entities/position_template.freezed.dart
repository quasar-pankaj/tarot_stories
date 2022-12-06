// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'position_template.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PositionTemplate _$PositionTemplateFromJson(Map<String, dynamic> json) {
  return $PositionTemplate.fromJson(json);
}

/// @nodoc
mixin _$PositionTemplate {
  int? get id => throw _privateConstructorUsedError;
  String get context => throw _privateConstructorUsedError;
  int get index => throw _privateConstructorUsedError;
  int get modifiedIndex => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PositionTemplateCopyWith<PositionTemplate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PositionTemplateCopyWith<$Res> {
  factory $PositionTemplateCopyWith(
          PositionTemplate value, $Res Function(PositionTemplate) then) =
      _$PositionTemplateCopyWithImpl<$Res, PositionTemplate>;
  @useResult
  $Res call({int? id, String context, int index, int modifiedIndex});
}

/// @nodoc
class _$PositionTemplateCopyWithImpl<$Res, $Val extends PositionTemplate>
    implements $PositionTemplateCopyWith<$Res> {
  _$PositionTemplateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? context = null,
    Object? index = null,
    Object? modifiedIndex = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as String,
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      modifiedIndex: null == modifiedIndex
          ? _value.modifiedIndex
          : modifiedIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$$PositionTemplateCopyWith<$Res>
    implements $PositionTemplateCopyWith<$Res> {
  factory _$$$PositionTemplateCopyWith(
          _$$PositionTemplate value, $Res Function(_$$PositionTemplate) then) =
      __$$$PositionTemplateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String context, int index, int modifiedIndex});
}

/// @nodoc
class __$$$PositionTemplateCopyWithImpl<$Res>
    extends _$PositionTemplateCopyWithImpl<$Res, _$$PositionTemplate>
    implements _$$$PositionTemplateCopyWith<$Res> {
  __$$$PositionTemplateCopyWithImpl(
      _$$PositionTemplate _value, $Res Function(_$$PositionTemplate) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? context = null,
    Object? index = null,
    Object? modifiedIndex = null,
  }) {
    return _then(_$$PositionTemplate(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as String,
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      modifiedIndex: null == modifiedIndex
          ? _value.modifiedIndex
          : modifiedIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$$PositionTemplate implements $PositionTemplate {
  _$$PositionTemplate(
      {required this.id,
      required this.context,
      required this.index,
      required this.modifiedIndex});

  factory _$$PositionTemplate.fromJson(Map<String, dynamic> json) =>
      _$$$PositionTemplateFromJson(json);

  @override
  final int? id;
  @override
  final String context;
  @override
  final int index;
  @override
  final int modifiedIndex;

  @override
  String toString() {
    return 'PositionTemplate(id: $id, context: $context, index: $index, modifiedIndex: $modifiedIndex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$$PositionTemplate &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.modifiedIndex, modifiedIndex) ||
                other.modifiedIndex == modifiedIndex));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, context, index, modifiedIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$$PositionTemplateCopyWith<_$$PositionTemplate> get copyWith =>
      __$$$PositionTemplateCopyWithImpl<_$$PositionTemplate>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$$PositionTemplateToJson(
      this,
    );
  }
}

abstract class $PositionTemplate implements PositionTemplate {
  factory $PositionTemplate(
      {required final int? id,
      required final String context,
      required final int index,
      required final int modifiedIndex}) = _$$PositionTemplate;

  factory $PositionTemplate.fromJson(Map<String, dynamic> json) =
      _$$PositionTemplate.fromJson;

  @override
  int? get id;
  @override
  String get context;
  @override
  int get index;
  @override
  int get modifiedIndex;
  @override
  @JsonKey(ignore: true)
  _$$$PositionTemplateCopyWith<_$$PositionTemplate> get copyWith =>
      throw _privateConstructorUsedError;
}
