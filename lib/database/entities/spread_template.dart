import 'dart:core';

import 'package:freezed_annotation/freezed_annotation.dart';

import 'enum_spread_category.dart';
import 'enum_spread_shape.dart';
import 'position_template.dart';
import 'reading.dart';

part 'spread_template.freezed.dart';
part 'spread_template.g.dart';

@freezed
class SpreadTemplate with _$SpreadTemplate {
  factory SpreadTemplate({
    int? id,
    required String name,
    required int numCards,
    required SpreadShape shape,
    required List<PositionTemplate> positions,
    required List<Reading> readings,
    required List<int> cardOrdering,
    required List<JournalCategory> categories,
  }) = $SpreadTemplate;

  factory SpreadTemplate.fromJson(Map<String, Object?> json) =>
      _$SpreadTemplateFromJson(json);
}
