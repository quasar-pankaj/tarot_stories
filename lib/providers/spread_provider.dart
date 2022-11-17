import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../database/app_database.dart';
import '../database/spread.dart';
import 'project_notifier_provider.dart';
import 'repository_provider.dart';

final spreadProvider =
    StateNotifierProvider.family<SpreadNotifier, List<Spread>, int>(
        (ref, index) {
  final watch = ref.watch(projectNotifierProvider(index));
  return SpreadNotifier(watch.spreads[index]);
});

class SpreadNotifier extends RepositoryNotifier<Spread> {
  SpreadNotifier(Spread spread)
      : super(
          spread,
          AppDatabase.spreads,
        );
}
