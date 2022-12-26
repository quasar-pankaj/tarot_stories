import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../database/app_database.dart';
import '../../database/entities/project.dart';
import '../../database/repository.dart';

final projectRepositoryProvider = Provider<Repository<Project>>((ref) {
  return Repository<Project>(
    storeName: AppDatabase.projects,
    getEntity: (json) => Project.fromJson(json),
    getId: (entity) => entity.id!,
    getMap: (entity) => entity.toJson(),
    setId: (entity, id) {
      final project = entity.copyWith(id: id);
      return project;
    },
  );
});
