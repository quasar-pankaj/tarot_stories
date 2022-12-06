import 'package:freezed_annotation/freezed_annotation.dart';

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
    required LayoutType layoutType,
    required List<Reading> readings,
  }) = $Spread;

  factory Spread.fromJson(Map<String, Object?> json) => _$SpreadFromJson(json);
}

enum LayoutType {
  none('None'),
  single('Single'),
  double('Double'),
  triple('Triple'),
  quad('Quad'),
  cross('Cross'),
  mByN('M by N'),
  celticCross('Celtic Cross'),
  pentagram('Pentagram'),
  hexagram('Hexagram'),
  heptagram('Heptagram'),
  herosJourney12Circular("Hero's Journey 12 Card Circular"),
  herosJourney16Circular("Hero's Journey 16 Card Circular"),
  herosJourney12MByN("Hero's Journey 12 Card 4x3"),
  herosJourney16MByN("Hero's Journey 16 Card 4x4"),
  circularN('Circular N'),
  triangle('Triangle'),
  square('Square');

  final String _name;
  const LayoutType(String name) : _name = name;

  @override
  String toString() => _name;
}
