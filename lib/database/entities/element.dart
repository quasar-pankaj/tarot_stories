import 'package:freezed_annotation/freezed_annotation.dart';

import 'enum_journal_category.dart';

part 'element.freezed.dart';
part 'element.g.dart';

@freezed
class Element with _$Element {
  factory Element({
    int? id,
    required int projectId,
    required String name,
    String? synopsis,
    required JournalCategory elementType,
  }) = $Element;

  factory Element.fromJson(Map<String, Object?> json) =>
      _$ElementFromJson(json);
}
