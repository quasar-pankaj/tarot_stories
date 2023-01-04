import 'package:freezed_annotation/freezed_annotation.dart';

import 'enum_spread_shape.dart';

part 'journal.freezed.dart';
part 'journal.g.dart';

@freezed
class Journal with _$Journal {
  factory Journal({
    int? id,
    required String name,
    String? query,
    required int createdTimestamp,
    required int modifiedTimestamp,
    required int elementId,
    required SpreadShape shape,
  }) = $Journal;

  factory Journal.fromJson(Map<String, Object?> json) =>
      _$JournalFromJson(json);
}
