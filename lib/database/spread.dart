// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'entity.dart';

class Spread extends Entity {
  List<String> cards;
  List<String> readings;

  Spread({
    super.id,
    required super.name,
    required this.cards,
    required this.readings,
  });

  Spread copyWith({
    String? name,
    List<String>? cards,
    List<String>? readings,
    bool withId = false,
  }) {
    return Spread(
      id: withId ? id : null,
      name: name ?? this.name,
      cards: cards ?? this.cards,
      readings: readings ?? this.readings,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'cards': cards,
      'readings': readings,
    };
  }

  factory Spread.fromMap(Map<String, dynamic> map) {
    return Spread(
      id: map['id'] as int,
      name: map['name'] as String,
      cards: List<String>.from(map['cards'] as List<String>),
      readings: List<String>.from(map['readings'] as List<String>),
    );
  }

  @override
  String toJson() => json.encode(toMap());

  factory Spread.fromJson(String source) =>
      Spread.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Spread(name: $name, cards: $cards, readings: $readings)';

  @override
  bool operator ==(covariant Spread other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        listEquals(other.cards, cards) &&
        listEquals(other.readings, readings);
  }

  @override
  int get hashCode => name.hashCode ^ cards.hashCode ^ readings.hashCode;
}
