import 'package:freezed_annotation/freezed_annotation.dart';

import 'enum_element_type.dart';
import 'spread.dart';

part 'element.freezed.dart';
part 'element.g.dart';

@freezed
class Element with _$Element {
  factory Element({
    int? id,
    required int projectId,
    required String name,
    String? synopsis,
    required ElementType elementType,
  }) = $Element;

  factory Element.fromJson(Map<String, Object?> json) =>
      _$ElementFromJson(json);
}
