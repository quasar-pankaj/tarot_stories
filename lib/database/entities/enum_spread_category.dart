enum SpreadCategory {
  character('Character'),
  plot('Plot'),
  scene('Scene'),
  sequel('Sequel'),
  theme('Theme'),
  arc('Arc'),
  structure('Structure'),
  relationship('Relationship');

  final String _name;
  const SpreadCategory(String name) : _name = name;

  @override
  String toString() => _name;
}
