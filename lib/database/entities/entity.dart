import 'package:sembast/timestamp.dart';

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

  @override
  String toString() {
    return 'Entity(id: $id, name: $name, created: $created, modified: $modified)';
  }
}
