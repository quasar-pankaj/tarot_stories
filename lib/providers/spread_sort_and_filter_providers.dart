enum SpreadSortOrder {
  descending,
  ascending,
}

enum SpreadSortCondition {
  name,
  dateCreated,
  dateModified,
}

enum SpreadFilterCondition {
  all('All'),
  character('Character'),
  plot('Plot'),
  scene('Scene'),
  sequel('Sequel'),
  theme('Theme'),
  arc('Arc'),
  structure('Structure'),
  relationship('Relationship');

  final String _name;
  const SpreadFilterCondition(String name) : _name = name;

  @override
  String toString() => _name;
}

enum LayoutType {
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
  herosJourney("Hero's Journey"),
  circularN('Circular N'),
  triangle('Triangle'),
  square('Square');

  final String _name;
  const LayoutType(String name) : _name = name;

  @override
  String toString() => _name;
}

