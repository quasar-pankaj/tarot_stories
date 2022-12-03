import 'package:freezed_annotation/freezed_annotation.dart';

part 'spread.freezed.dart';
part 'spread.g.dart';

@freezed
class Spread with _$Spread {
  factory Spread({
    int? id,
    required String name,
    required int createdTimestamp,
    required int modifiedTimestamp,
  }) = $Spread;

  factory Spread.fromJson(Map<String, Object?> json) => _$SpreadFromJson(json);
}
