enum SpreadShape {
  horiz1('Horizontal One Card'),
  horiz2('Horizontal Two Card'),
  horiz3('Horizontal Three Card'),
  horiz4('Horizontal Four Card'),
  horiz5('Horizontal Five Card'),
  vert2('Vertical Two Card'),
  vert3('Vertical Three Card'),
  vert4('Vertical Four Card'),
  goalMotivationConflict('Goal-Motivation-Conflict'),
  goalConflictDisaster('Goal-Conflict-Disaster'),
  reactionDilemmaDecision('Reaction-Dilemma-Decision'),
  actionReactionMovement('Action-Reaction-Movement'),
  thesisAntithesisSynthesis('Thesis-Antithesis-Synthesis'),
  fiveSenses('5 Senses'),
  characterCross('Character Cross'),
  backstory('Backstory'),
  celticCross('Celtic Cross'),
  ankh('Ankh'),
  cross4('Four Card Cross'),
  cross5('Five Card Cross'),
  cross6('Six Card Cross'),
  pentagram('Pentagram'),
  hexagram('Hexagram'),
  heptagram('Heptagram'),
  herosJourney12Circular("Hero's Journey 12 Card Circular"),
  herosJourney16Circular("Hero's Journey 16 Card Circular"),
  herosJourney12MByN("Hero's Journey 12 Card 4x3"),
  herosJourney16MByN("Hero's Journey 16 Card 4x4"),
  blakeSnyderBeatSheet('Blake Snyder\'s Beat Sheet'),
  threeDisasterFourAct('3 Disaster 4 Act'),
  superStructure('Superstructure'),
  fourteenPointStructure('Fourteen Point Structure'),
  freytagPyramid('Freytag\'s Pyramid'),
  horseShoe('Horseshoe'),
  relationship3Way('Three Way Relationship'),
  relationship5Way('Five Way Relationship'),
  circularN('Circular N'),
  triangle('Triangle'),
  square('Square');

  final String _name;

  const SpreadShape(String name) : _name = name;

  @override
  String toString() => _name;
}
