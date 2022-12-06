import 'package:freezed_annotation/freezed_annotation.dart';

import 'position_template.dart';

part 'reading.freezed.dart';
part 'reading.g.dart';

@freezed
class Reading with _$Reading {
  factory Reading({
    required String cardId,
    required PositionTemplate context,
    required String text,
  }) = $Reading;

  factory Reading.fromJson(Map<String, Object?> json) =>
      _$ReadingFromJson(json);
}
