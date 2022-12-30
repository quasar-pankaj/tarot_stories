import 'dart:convert';

class CardModel {
  final String name;
  final int index;
  final String fullName;
  final Suit suit;
  final Arcana arcana;
  final String description;
  final List<String> keySymbols;
  final Map<String, List<String>> keywords;
  final List<String> astrologicalAssociations;
  final List<String> mythAndLegends;
  final List<String> literaryArchetypes;

  CardModel({
    required this.name,
    required this.index,
    required this.fullName,
    required this.suit,
    required this.arcana,
    required this.description,
    required this.keySymbols,
    required this.keywords,
    required this.astrologicalAssociations,
    required this.mythAndLegends,
    required this.literaryArchetypes,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'index': index,
      'full name': fullName,
      'suit': suit.index,
      'arcana': arcana.index,
      'description': description,
      'key symbols': keySymbols,
      'keywords': keywords,
      'astrological associations': astrologicalAssociations,
      'myth and legends': mythAndLegends,
      'literary archetypes': literaryArchetypes,
    };
  }

  factory CardModel.fromMap(Map<String, dynamic> map) {
    return CardModel(
      name: map['name'] as String,
      index: map['index'] as int,
      fullName: map['full name'] as String,
      suit: Suit.values[map['suit'] as int],
      arcana: Arcana.values[map['arcana'] as int],
      description: map['description'] as String,
      keySymbols: List<String>.from(map['key symbols']),
      keywords: Map<String, List<dynamic>>.from(map['keywords']).map(
        (key, value) => MapEntry(
          key,
          List<String>.from(value),
        ),
      ),
      astrologicalAssociations:
          List<String>.from(map['astrological associations']),
      mythAndLegends: List<String>.from(map['myth and legend']),
      literaryArchetypes: List<String>.from(map['literary archetypes']),
    );
  }

  String toJson() => json.encode(toMap());

  factory CardModel.fromJson(String source) =>
      CardModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

enum Suit {
  trumps,
  wands,
  cups,
  swords,
  pentacles,
}

enum Arcana {
  major,
  minor,
}
