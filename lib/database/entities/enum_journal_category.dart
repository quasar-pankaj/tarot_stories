import 'enum_spread_shape.dart';

enum JournalCategory {
  character('Character', [
    SpreadShape.horiz1,
    SpreadShape.horiz2,
    SpreadShape.horiz3,
    SpreadShape.horiz4,
    SpreadShape.horiz5,
    SpreadShape.vert2,
    SpreadShape.vert3,
    SpreadShape.vert4,
    SpreadShape.goalMotivationConflict,
    SpreadShape.characterCross,
    SpreadShape.backstory,
    SpreadShape.celticCross,
  ]),
  sceneSequel('Scene/Sequel', [
    SpreadShape.horiz1,
    SpreadShape.horiz2,
    SpreadShape.horiz3,
    SpreadShape.horiz4,
    SpreadShape.horiz5,
    SpreadShape.vert2,
    SpreadShape.vert3,
    SpreadShape.vert4,
    SpreadShape.goalConflictDisaster,
    SpreadShape.reactionDilemmaDecision,
    SpreadShape.backstory,
  ]),
  location('Location', [
    SpreadShape.horiz1,
    SpreadShape.horiz2,
    SpreadShape.horiz3,
    SpreadShape.horiz4,
    SpreadShape.horiz5,
    SpreadShape.vert2,
    SpreadShape.vert3,
    SpreadShape.vert4,
    SpreadShape.backstory,
    SpreadShape.celticCross,
  ]),
  prop('Prop', [
    SpreadShape.horiz1,
    SpreadShape.horiz2,
    SpreadShape.horiz3,
    SpreadShape.horiz4,
    SpreadShape.horiz5,
    SpreadShape.vert2,
    SpreadShape.vert3,
    SpreadShape.vert4,
    SpreadShape.backstory,
    SpreadShape.celticCross,
  ]),
  structure('Structure', [
    SpreadShape.herosJourney12MByN,
    SpreadShape.herosJourney16MByN,
    SpreadShape.celticCross,
    SpreadShape.threeDisasterFourAct,
  ]),
  relationship('Relationship', [
    SpreadShape.horiz1,
    SpreadShape.horiz2,
    SpreadShape.horiz3,
    SpreadShape.horiz4,
    SpreadShape.horiz5,
    SpreadShape.vert2,
    SpreadShape.vert3,
    SpreadShape.vert4,
    SpreadShape.relationship3Way,
    SpreadShape.relationship2Way,
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
