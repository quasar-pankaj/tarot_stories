import 'package:freezed_annotation/freezed_annotation.dart';

part 'reading.freezed.dart';
part 'reading.g.dart';

@freezed
class Reading with _$Reading {
  factory Reading({
    int? id,
    required int journalId,
    required List<String> readings,
  }) = $Reading;

  factory Reading.fromJson(Map<String, Object?> json) =>
      _$ReadingFromJson(json);
}
