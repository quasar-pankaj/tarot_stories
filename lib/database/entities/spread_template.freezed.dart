// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'spread_template.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SpreadTemplate _$SpreadTemplateFromJson(Map<String, dynamic> json) {
  return $SpreadTemplate.fromJson(json);
}

/// @nodoc
mixin _$SpreadTemplate {
  int? get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get numCards => throw _privateConstructorUsedError;
  SpreadShape get shape => throw _privateConstructorUsedError;
  List<PositionTemplate> get positions => throw _privateConstructorUsedError;
  List<Reading> get readings => throw _privateConstructorUsedError;
  List<int> get cardOrdering => throw _privateConstructorUsedError;
  List<JournalCategory> get categories => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SpreadTemplateCopyWith<SpreadTemplate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpreadTemplateCopyWith<$Res> {
  factory $SpreadTemplateCopyWith(
          SpreadTemplate value, $Res Function(SpreadTemplate) then) =
      _$SpreadTemplateCopyWithImpl<$Res, SpreadTemplate>;
  @useResult
  $Res call(
      {int? id,
      String name,
      int numCards,
      SpreadShape shape,
      List<PositionTemplate> positions,
      List<Reading> readings,
      List<int> cardOrdering,
      List<JournalCategory> categories});
}

/// @nodoc
class _$SpreadTemplateCopyWithImpl<$Res, $Val extends SpreadTemplate>
    implements $SpreadTemplateCopyWith<$Res> {
  _$SpreadTemplateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? numCards = null,
    Object? shape = null,
    Object? positions = null,
    Object? readings = null,
    Object? cardOrdering = null,
    Object? categories = null,
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
      numCards: null == numCards
          ? _value.numCards
          : numCards // ignore: cast_nullable_to_non_nullable
              as int,
      shape: null == shape
          ? _value.shape
          : shape // ignore: cast_nullable_to_non_nullable
              as SpreadShape,
      positions: null == positions
          ? _value.positions
          : positions // ignore: cast_nullable_to_non_nullable
              as List<PositionTemplate>,
      readings: null == readings
          ? _value.readings
          : readings // ignore: cast_nullable_to_non_nullable
              as List<Reading>,
      cardOrdering: null == cardOrdering
          ? _value.cardOrdering
          : cardOrdering // ignore: cast_nullable_to_non_nullable
              as List<int>,
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<JournalCategory>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$$SpreadTemplateCopyWith<$Res>
    implements $SpreadTemplateCopyWith<$Res> {
  factory _$$$SpreadTemplateCopyWith(
          _$$SpreadTemplate value, $Res Function(_$$SpreadTemplate) then) =
      __$$$SpreadTemplateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String name,
      int numCards,
      SpreadShape shape,
      List<PositionTemplate> positions,
      List<Reading> readings,
      List<int> cardOrdering,
      List<JournalCategory> categories});
}

/// @nodoc
class __$$$SpreadTemplateCopyWithImpl<$Res>
    extends _$SpreadTemplateCopyWithImpl<$Res, _$$SpreadTemplate>
    implements _$$$SpreadTemplateCopyWith<$Res> {
  __$$$SpreadTemplateCopyWithImpl(
      _$$SpreadTemplate _value, $Res Function(_$$SpreadTemplate) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? numCards = null,
    Object? shape = null,
    Object? positions = null,
    Object? readings = null,
    Object? cardOrdering = null,
    Object? categories = null,
  }) {
    return _then(_$$SpreadTemplate(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      numCards: null == numCards
          ? _value.numCards
          : numCards // ignore: cast_nullable_to_non_nullable
              as int,
      shape: null == shape
          ? _value.shape
          : shape // ignore: cast_nullable_to_non_nullable
              as SpreadShape,
      positions: null == positions
          ? _value._positions
          : positions // ignore: cast_nullable_to_non_nullable
              as List<PositionTemplate>,
      readings: null == readings
          ? _value._readings
          : readings // ignore: cast_nullable_to_non_nullable
              as List<Reading>,
      cardOrdering: null == cardOrdering
          ? _value._cardOrdering
          : cardOrdering // ignore: cast_nullable_to_non_nullable
              as List<int>,
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<JournalCategory>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$$SpreadTemplate implements $SpreadTemplate {
  _$$SpreadTemplate(
      {this.id,
      required this.name,
      required this.numCards,
      required this.shape,
      required final List<PositionTemplate> positions,
      required final List<Reading> readings,
      required final List<int> cardOrdering,
      required final List<JournalCategory> categories})
      : _positions = positions,
        _readings = readings,
        _cardOrdering = cardOrdering,
        _categories = categories;

  factory _$$SpreadTemplate.fromJson(Map<String, dynamic> json) =>
      _$$$SpreadTemplateFromJson(json);

  @override
  final int? id;
  @override
  final String name;
  @override
  final int numCards;
  @override
  final SpreadShape shape;
  final List<PositionTemplate> _positions;
  @override
  List<PositionTemplate> get positions {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_positions);
  }

  final List<Reading> _readings;
  @override
  List<Reading> get readings {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_readings);
  }

  final List<int> _cardOrdering;
  @override
  List<int> get cardOrdering {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cardOrdering);
  }

  final List<JournalCategory> _categories;
  @override
  List<JournalCategory> get categories {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  String toString() {
    return 'SpreadTemplate(id: $id, name: $name, numCards: $numCards, shape: $shape, positions: $positions, readings: $readings, cardOrdering: $cardOrdering, categories: $categories)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$$SpreadTemplate &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.numCards, numCards) ||
                other.numCards == numCards) &&
            (identical(other.shape, shape) || other.shape == shape) &&
            const DeepCollectionEquality()
                .equals(other._positions, _positions) &&
            const DeepCollectionEquality().equals(other._readings, _readings) &&
            const DeepCollectionEquality()
                .equals(other._cardOrdering, _cardOrdering) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      numCards,
      shape,
      const DeepCollectionEquality().hash(_positions),
      const DeepCollectionEquality().hash(_readings),
      const DeepCollectionEquality().hash(_cardOrdering),
      const DeepCollectionEquality().hash(_categories));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$$SpreadTemplateCopyWith<_$$SpreadTemplate> get copyWith =>
      __$$$SpreadTemplateCopyWithImpl<_$$SpreadTemplate>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$$SpreadTemplateToJson(
      this,
    );
  }
}

abstract class $SpreadTemplate implements SpreadTemplate {
  factory $SpreadTemplate(
      {final int? id,
      required final String name,
      required final int numCards,
      required final SpreadShape shape,
      required final List<PositionTemplate> positions,
      required final List<Reading> readings,
      required final List<int> cardOrdering,
      required final List<JournalCategory> categories}) = _$$SpreadTemplate;

  factory $SpreadTemplate.fromJson(Map<String, dynamic> json) =
      _$$SpreadTemplate.fromJson;

  @override
  int? get id;
  @override
  String get name;
  @override
  int get numCards;
  @override
  SpreadShape get shape;
  @override
  List<PositionTemplate> get positions;
  @override
  List<Reading> get readings;
  @override
  List<int> get cardOrdering;
  @override
  List<JournalCategory> get categories;
  @override
  @JsonKey(ignore: true)
  _$$$SpreadTemplateCopyWith<_$$SpreadTemplate> get copyWith =>
      throw _privateConstructorUsedError;
}
