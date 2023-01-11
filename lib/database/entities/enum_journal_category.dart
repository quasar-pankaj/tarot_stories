import 'enum_spread_shape.dart';

enum JournalCategory {
  character('Character', [
    SpreadShape.horiz1,
    SpreadShape.goalMotivationConflict,
    SpreadShape.characterCross,
    SpreadShape.backstory,
    SpreadShape.celticCross,
  ]),
  sceneSequel('Scene/Sequel', [
    SpreadShape.horiz1,
    SpreadShape.goalConflictDisaster,
    SpreadShape.reactionDilemmaDecision,
    SpreadShape.backstory,
  ]),
  location('Location', [
    SpreadShape.horiz1,
    SpreadShape.backstory,
    SpreadShape.celticCross,
  ]),
  prop('Prop', [
    SpreadShape.horiz1,
    SpreadShape.backstory,
    SpreadShape.celticCross,
  ]),
  structure('Structure', [
    SpreadShape.herosJourney12Circular,
    SpreadShape.herosJourney16Circular,
    SpreadShape.herosJourney12MByN,
    SpreadShape.herosJourney16MByN,
    SpreadShape.celticCross,
    SpreadShape.threeDisasterFourAct,
  ]),
  relationship('Relationship', [
    SpreadShape.horiz1,
    SpreadShape.relationship3Way,
  ]);

  final String _name;
  final List<SpreadShape> _spreads;

  const JournalCategory(
    String name,
    final List<SpreadShape> spreads,
  )   : _name = name,
        _spreads = spreads;

  List<SpreadShape> get spreads => _spreads;

  @override
  String toString() => _name;
}
