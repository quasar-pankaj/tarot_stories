import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../database/app_database.dart';
import '../../database/entities/spread.dart';
import '../../database/repository.dart';

final spreadRepositoryProvider = Provider<Repository<Spread>>((ref) {
  return Repository<Spread>(
    storeName: AppDatabase.spreads,
    getEntity: (json) => Spread.fromJson(json),
    getId: (entity) => entity.id!,
    getMap: (entity) => entity.toJson(),
    setId: (entity, id) {
      final spread = entity.copyWith(id: id);
      return spread;
    },
  );
});
