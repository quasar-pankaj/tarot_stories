// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:sembast/timestamp.dart';

import 'entity.dart';

@immutable
class Spread extends Entity {
  final List<String> cards;
  final List<String> readings;
  final int projectId;

  Spread({
    super.id,
    required super.name,
    required super.created,
    required super.modified,
    required this.cards,
    required this.readings,
    required this.projectId,
  });

  Spread copyWith({
    String? name,
    Timestamp? created,
    Timestamp? modified,
    List<String>? cards,
    List<String>? readings,
    int? projectId,
    bool withId = false,
  }) {
    return Spread(
      id: withId ? id : null,
      name: name ?? this.name,
      created: created ?? this.created,
      modified: modified ?? this.modified,
      cards: cards ?? this.cards,
      readings: readings ?? this.readings,
      projectId: projectId ?? this.projectId,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'created': created,
      'modified': modified,
      'cards': cards,
      'readings': readings,
      'projectId': projectId,
    };
  }

  factory Spread.fromMap(Map<String, dynamic> map) {
    return Spread(
      // id: map['id'] as int,
      name: map['name'] as String,
      created: map['created'] as Timestamp,
      modified: map['modified'] as Timestamp,
      cards: List<String>.from(map['cards'] as List<String>),
      readings: List<String>.from(map['readings'] as List<String>),
      projectId: map['projectId'] as int,
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

    return other.id == id &&
        other.projectId == projectId &&
        other.name == name &&
        listEquals(other.cards, cards) &&
        listEquals(other.readings, readings);
  }

  @override
  int get hashCode =>
      id.hashCode ^
      projectId.hashCode ^
      name.hashCode ^
      cards.hashCode ^
      readings.hashCode;
}
