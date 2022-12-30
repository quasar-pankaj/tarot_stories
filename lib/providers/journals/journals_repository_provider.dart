import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../database/app_database.dart';
import '../../database/entities/journal.dart';
import '../../database/repository.dart';

final journalsRepositoryProvider = Provider<Repository<Journal>>((ref) {
  return Repository<Journal>(
    storeName: AppDatabase.spreads,
    getEntity: (map) => Journal.fromJson(map),
    getId: (entity) => entity.id!,
    getMap: (entity) => entity.toJson(),
    setId: (entity, id) {
      final spread = entity.copyWith(id: id);
      return spread;
    },
  );
});
