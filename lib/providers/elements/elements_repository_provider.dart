import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../database/app_database.dart';
import '../../database/entities/element.dart';
import '../../database/repository.dart';

final elementRepositoryProvider = Provider<Repository<Element>>((ref) {
  return Repository<Element>(
    storeName: AppDatabase.elements,
    getEntity: (json) => Element.fromJson(json),
    getId: (entity) => entity.id!,
    getMap: (entity) => entity.toJson(),
    setId: (entity, id) {
      final element = entity.copyWith(id: id);
      return element;
    },
  );
});
