import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../database/entities/reading.dart';
import '../journals/open_journal_provider.dart';
import 'readings_repository_provider.dart';

final readingsProvider = FutureProvider<Reading>((ref) async {
  final repo = ref.watch(readingsRepositoryProvider);
  final journal = ref.watch(openJournalProvider);
  final readings = await repo.getAllUnsorted();
  return readings.firstWhere((element) => element.journalId == journal!.id!);
});