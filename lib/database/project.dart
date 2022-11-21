import 'dart:convert';

import 'entity.dart';

class Project extends Entity {
  Project({
    super.id,
    required super.name,
  });

  Project copyWith({
    String? name,
    bool withId = false,
  }) {
    return Project(
      id: withId ? id : null,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  factory Project.fromMap(Map<String, dynamic> map) {
    return Project(
      id: map['id'] as int,
      name: map['name'] as String,
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

    return other.name == name;
  }

  @override
  int get hashCode => name.hashCode;
}
