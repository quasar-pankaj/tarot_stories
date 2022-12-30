import 'package:freezed_annotation/freezed_annotation.dart';

part 'spread.freezed.dart';
part 'spread.g.dart';

@freezed
class Spread with _$Spread {
  factory Spread({
    int? id,
    required int journalId,
    List<String>? cards,
  }) = $Spread;

  factory Spread.fromJson(Map<String, Object?> json) => _$SpreadFromJson(json);
}
