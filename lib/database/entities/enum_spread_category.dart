import 'enum_spread_shape.dart';

enum SpreadCategory {
  character('Character', [
    SpreadShape.horiz1,
    SpreadShape.goalMotivationConflict,
    SpreadShape.characterCross,
    SpreadShape.backstory,
  ]),
  sceneSequel('Scene/Sequel', [
    SpreadShape.horiz1,
    SpreadShape.goalConflictDisaster,
    SpreadShape.reactionDilemmaDecision,
  ]),
  location('Location', [
    SpreadShape.horiz1,
    SpreadShape.backstory,
  ]),
  prop('Prop', [
    SpreadShape.horiz1,
    SpreadShape.backstory,
  ]),
  structure('Structure', [
    SpreadShape.blakeSnyderBeatSheet,
    SpreadShape.fourteenPointStructure,
    SpreadShape.herosJourney12Circular,
    SpreadShape.herosJourney16Circular,
    SpreadShape.herosJourney12MByN,
    SpreadShape.herosJourney16MByN,
  ]),
  relationship('Relationship', [
    SpreadShape.horiz1,
    SpreadShape.relationship3Way,
  ]),
  all('All', SpreadShape.values);

  final String _name;
  final List<SpreadShape> _spreads;

  const SpreadCategory(
    String name,
    final List<SpreadShape> spreads,
  )   : _name = name,
        _spreads = spreads;

  List<SpreadShape> get spreads => _spreads;

  @override
  String toString() => _name;
}
