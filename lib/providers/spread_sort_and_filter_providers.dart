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


