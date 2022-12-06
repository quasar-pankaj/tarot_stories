import 'package:freezed_annotation/freezed_annotation.dart';

part 'position_template.freezed.dart';
part 'position_template.g.dart';

@freezed
class PositionTemplate with _$PositionTemplate {
  factory PositionTemplate({
    required int? id,
    required String context,
    required int index,
    required int modifiedIndex,
  }) = $PositionTemplate;

  factory PositionTemplate.fromJson(Map<String, Object?> json) =>
      _$PositionTemplateFromJson(json);
}
