// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Project _$ProjectFromJson(Map<String, dynamic> json) {
  return $Project.fromJson(json);
}

/// @nodoc
mixin _$Project {
  int? get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get synopsis => throw _privateConstructorUsedError;
  int get createdTimestamp => throw _privateConstructorUsedError;
  int get modifiedTimestamp => throw _privateConstructorUsedError;

  /// Serializes this Project to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Project
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProjectCopyWith<Project> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectCopyWith<$Res> {
  factory $ProjectCopyWith(Project value, $Res Function(Project) then) =
      _$ProjectCopyWithImpl<$Res, Project>;
  @useResult
  $Res call(
      {int? id,
      String name,
      String synopsis,
      int createdTimestamp,
      int modifiedTimestamp});
}

/// @nodoc
class _$ProjectCopyWithImpl<$Res, $Val extends Project>
    implements $ProjectCopyWith<$Res> {
  _$ProjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Project
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? synopsis = null,
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
      synopsis: null == synopsis
          ? _value.synopsis
          : synopsis // ignore: cast_nullable_to_non_nullable
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
abstract class _$$$ProjectImplCopyWith<$Res> implements $ProjectCopyWith<$Res> {
  factory _$$$ProjectImplCopyWith(
          _$$ProjectImpl value, $Res Function(_$$ProjectImpl) then) =
      __$$$ProjectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String name,
      String synopsis,
      int createdTimestamp,
      int modifiedTimestamp});
}

/// @nodoc
class __$$$ProjectImplCopyWithImpl<$Res>
    extends _$ProjectCopyWithImpl<$Res, _$$ProjectImpl>
    implements _$$$ProjectImplCopyWith<$Res> {
  __$$$ProjectImplCopyWithImpl(
      _$$ProjectImpl _value, $Res Function(_$$ProjectImpl) _then)
      : super(_value, _then);

  /// Create a copy of Project
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? synopsis = null,
    Object? createdTimestamp = null,
    Object? modifiedTimestamp = null,
  }) {
    return _then(_$$ProjectImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      synopsis: null == synopsis
          ? _value.synopsis
          : synopsis // ignore: cast_nullable_to_non_nullable
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
class _$$ProjectImpl implements $Project {
  _$$ProjectImpl(
      {this.id,
      required this.name,
      required this.synopsis,
      required this.createdTimestamp,
      required this.modifiedTimestamp});

  factory _$$ProjectImpl.fromJson(Map<String, dynamic> json) =>
      _$$$ProjectImplFromJson(json);

  @override
  final int? id;
  @override
  final String name;
  @override
  final String synopsis;
  @override
  final int createdTimestamp;
  @override
  final int modifiedTimestamp;

  @override
  String toString() {
    return 'Project(id: $id, name: $name, synopsis: $synopsis, createdTimestamp: $createdTimestamp, modifiedTimestamp: $modifiedTimestamp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$$ProjectImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.synopsis, synopsis) ||
                other.synopsis == synopsis) &&
            (identical(other.createdTimestamp, createdTimestamp) ||
                other.createdTimestamp == createdTimestamp) &&
            (identical(other.modifiedTimestamp, modifiedTimestamp) ||
                other.modifiedTimestamp == modifiedTimestamp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, synopsis, createdTimestamp, modifiedTimestamp);

  /// Create a copy of Project
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$$ProjectImplCopyWith<_$$ProjectImpl> get copyWith =>
      __$$$ProjectImplCopyWithImpl<_$$ProjectImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$$ProjectImplToJson(
      this,
    );
  }
}

abstract class $Project implements Project {
  factory $Project(
      {final int? id,
      required final String name,
      required final String synopsis,
      required final int createdTimestamp,
      required final int modifiedTimestamp}) = _$$ProjectImpl;

  factory $Project.fromJson(Map<String, dynamic> json) =
      _$$ProjectImpl.fromJson;

  @override
  int? get id;
  @override
  String get name;
  @override
  String get synopsis;
  @override
  int get createdTimestamp;
  @override
  int get modifiedTimestamp;

  /// Create a copy of Project
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$$ProjectImplCopyWith<_$$ProjectImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
