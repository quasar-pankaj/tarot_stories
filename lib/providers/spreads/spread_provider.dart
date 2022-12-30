import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tarot_stories/providers/journals/open_journal_provider.dart';

import '../../database/entities/spread.dart';
import 'spread_repository_provider.dart';

final spreadProvider = FutureProvider<Spread>((ref) async {
  final repo = ref.watch(spreadRepositoryProvider);
  final journal = ref.watch(openJournalProvider);
  final spreads = await repo.getAllUnsorted();
  return spreads.firstWhere((element) => element.journalId == journal!.id!);
});
