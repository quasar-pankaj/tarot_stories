import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../database/app_database.dart';
import '../database/project.dart';
import '../database/repository.dart';

final projectRepositoryProvider = Provider<Repository<Project>>((ref) {
  return Repository<Project>(storeName: AppDatabase.projects);
});
