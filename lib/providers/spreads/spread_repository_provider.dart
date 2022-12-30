import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../database/app_database.dart';
import '../../database/entities/spread.dart';
import '../../database/repository.dart';

final spreadRepositoryProvider = Provider<Repository<Spread>>((ref) {
  return Repository<Spread>(
    storeName: AppDatabase.projects,
    getEntity: (json) => Spread.fromJson(json),
    getId: (entity) => entity.id!,
    getMap: (entity) => entity.toJson(),
    setId: (entity, id) {
      final project = entity.copyWith(id: id);
      return project;
    },
  );
});
