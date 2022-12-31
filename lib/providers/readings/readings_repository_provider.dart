import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../database/app_database.dart';
import '../../database/entities/reading.dart';
import '../../database/repository.dart';

final readingsRepositoryProvider = Provider<Repository<Reading>>((ref) {
  return Repository<Reading>(
    storeName: AppDatabase.projects,
    getEntity: (json) => Reading.fromJson(json),
    getId: (entity) => entity.id!,
    getMap: (entity) => entity.toJson(),
    setId: (entity, id) {
      final reading = entity.copyWith(id: id);
      return reading;
    },
  );
});
