import 'package:freezed_annotation/freezed_annotation.dart';

import 'enum_spread_shape.dart';
import 'reading.dart';

part 'spread.freezed.dart';
part 'spread.g.dart';

@freezed
class Spread with _$Spread {
  factory Spread({
    int? id,
    required String name,
    required int createdTimestamp,
    required int modifiedTimestamp,
    required int projectId,
    required SpreadShape layoutType,
    required List<Reading> readings,
  }) = $Spread;

  factory Spread.fromJson(Map<String, Object?> json) => _$SpreadFromJson(json);
}
