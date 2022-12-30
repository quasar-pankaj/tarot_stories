// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'layout.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Layout _$LayoutFromJson(Map<String, dynamic> json) {
  return $Layout.fromJson(json);
}

/// @nodoc
mixin _$Layout {
  int? get id => throw _privateConstructorUsedError;
  int get spreadId => throw _privateConstructorUsedError;
  List<String>? get cards => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LayoutCopyWith<Layout> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LayoutCopyWith<$Res> {
  factory $LayoutCopyWith(Layout value, $Res Function(Layout) then) =
      _$LayoutCopyWithImpl<$Res, Layout>;
  @useResult
  $Res call({int? id, int spreadId, List<String>? cards});
}

/// @nodoc
class _$LayoutCopyWithImpl<$Res, $Val extends Layout>
    implements $LayoutCopyWith<$Res> {
  _$LayoutCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? spreadId = null,
    Object? cards = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      spreadId: null == spreadId
          ? _value.spreadId
          : spreadId // ignore: cast_nullable_to_non_nullable
              as int,
      cards: freezed == cards
          ? _value.cards
          : cards // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$$LayoutCopyWith<$Res> implements $LayoutCopyWith<$Res> {
  factory _$$$LayoutCopyWith(_$$Layout value, $Res Function(_$$Layout) then) =
      __$$$LayoutCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, int spreadId, List<String>? cards});
}

/// @nodoc
class __$$$LayoutCopyWithImpl<$Res>
    extends _$LayoutCopyWithImpl<$Res, _$$Layout>
    implements _$$$LayoutCopyWith<$Res> {
  __$$$LayoutCopyWithImpl(_$$Layout _value, $Res Function(_$$Layout) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? spreadId = null,
    Object? cards = freezed,
  }) {
    return _then(_$$Layout(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      spreadId: null == spreadId
          ? _value.spreadId
          : spreadId // ignore: cast_nullable_to_non_nullable
              as int,
      cards: freezed == cards
          ? _value._cards
          : cards // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$$Layout implements $Layout {
  _$$Layout({this.id, required this.spreadId, final List<String>? cards})
      : _cards = cards;

  factory _$$Layout.fromJson(Map<String, dynamic> json) =>
      _$$$LayoutFromJson(json);

  @override
  final int? id;
  @override
  final int spreadId;
  final List<String>? _cards;
  @override
  List<String>? get cards {
    final value = _cards;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Layout(id: $id, spreadId: $spreadId, cards: $cards)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$$Layout &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.spreadId, spreadId) ||
                other.spreadId == spreadId) &&
            const DeepCollectionEquality().equals(other._cards, _cards));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, spreadId, const DeepCollectionEquality().hash(_cards));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$$LayoutCopyWith<_$$Layout> get copyWith =>
      __$$$LayoutCopyWithImpl<_$$Layout>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$$LayoutToJson(
      this,
    );
  }
}

abstract class $Layout implements Layout {
  factory $Layout(
      {final int? id,
      required final int spreadId,
      final List<String>? cards}) = _$$Layout;

  factory $Layout.fromJson(Map<String, dynamic> json) = _$$Layout.fromJson;

  @override
  int? get id;
  @override
  int get spreadId;
  @override
  List<String>? get cards;
  @override
  @JsonKey(ignore: true)
  _$$$LayoutCopyWith<_$$Layout> get copyWith =>
      throw _privateConstructorUsedError;
}
