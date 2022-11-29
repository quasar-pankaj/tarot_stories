import 'package:sembast/timestamp.dart';

import 'app_database.dart';
import 'project.dart';
import 'spread.dart';

abstract class Entity {
  int? id;
  final String name;
  final Timestamp created;
  final Timestamp modified;

  Entity({
    this.id,
    required this.name,
    required this.created,
    required this.modified,
  });

  Map<String, dynamic> toMap();

  String toJson();

  factory Entity.fromMap(String storeName, Map<String, dynamic> map) {
    switch (storeName) {
      case AppDatabase.projects:
        return Project.fromMap(map);
      case AppDatabase.spreads:
        return Spread.fromMap(map);
    }
    throw NullThrownError();
  }

  factory Entity.fromJson(String storeName, String source) {
    switch (storeName) {
      case AppDatabase.projects:
        return Project.fromJson(source);
      case AppDatabase.spreads:
        return Spread.fromJson(source);
    }
    throw NullThrownError();
  }

  @override
  String toString() {
    return 'Entity(id: $id, name: $name, created: $created, modified: $modified)';
  }

  @override
  bool operator ==(covariant Entity other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.created == created &&
        other.modified == modified;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ created.hashCode ^ modified.hashCode;
  }
}
