import 'dart:convert';

import 'package:sembast/timestamp.dart';

import 'entity.dart';

class Project extends Entity {
  final String synopsis;

  Project({
    super.id,
    required super.name,
    required super.created,
    required super.modified,
    this.synopsis = '',
  });

  Project copyWith({
    String? name,
    String? synopsis,
    Timestamp? created,
    Timestamp? modified,
    bool withId = false,
  }) {
    return Project(
      id: withId ? id : null,
      name: name ?? this.name,
      synopsis: synopsis ?? this.synopsis,
      created: created ?? this.created,
      modified: modified ?? this.modified,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'synopsis': synopsis,
      'created': created,
      'modified': modified,
    };
  }

  factory Project.fromMap(Map<String, dynamic> map) {
    return Project(
      // id: map['id'] as int,
      name: map['name'] as String,
      synopsis: map['synopsis'] as String,
      created: map['created'] as Timestamp,
      modified: map['modified'] as Timestamp,
    );
  }

  @override
  String toJson() => json.encode(toMap());

  factory Project.fromJson(String source) =>
      Project.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Project(name: $name)';

  @override
  bool operator ==(covariant Project other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
