import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../database/app_database.dart';
import '../database/repository.dart';
import '../database/spread.dart';

final spreadsRepositoryProvider = Provider<Repository<Spread>>((ref) {
  return Repository<Spread>(storeName: AppDatabase.spreads) ;
});