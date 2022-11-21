// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:tarot_stories/database/app_database.dart';
import 'package:tarot_stories/database/project.dart';
import 'package:tarot_stories/database/spread.dart';

abstract class Entity {
  int? id;
  String name;

  Entity({
    this.id,
    required this.name,
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
}
