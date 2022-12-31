import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../database/entities/journal.dart';
import '../sort_condition_buttons_notifier.dart';
import '../sort_order_buttons_notifier.dart';
import 'journal_sort_condition_provider.dart';
import 'journal_sort_order_provider.dart';
import 'journals_provider.dart';

final sortedFilteredJournalListProvider =
    FutureProvider.autoDispose<List<Journal>>((ref) async {
  final condition = ref.watch(journalSortConditionProvider);
  final order = ref.watch(journalSortOrderProvider);

  final spreads = ref.watch(journalProvider).value;

  late final List<Journal> sortedSpreads;

  switch (condition) {
    case SortCondition.name:
      if (order == SortOrder.ascending) {
        sortedSpreads = spreads!.toList()
          ..sort(
            (a, b) => a.name.compareTo(b.name),
          );
      } else {
        sortedSpreads = spreads!.toList()
          ..sort(
            (b, a) => a.name.compareTo(b.name),
          );
      }
      break;
    case SortCondition.dateCreated:
      if (order == SortOrder.ascending) {
        sortedSpreads = spreads!.toList()
          ..sort(
            (a, b) => a.createdTimestamp.compareTo(b.createdTimestamp),
          );
      } else {
        sortedSpreads = spreads!.toList()
          ..sort(
            (b, a) => a.createdTimestamp.compareTo(b.createdTimestamp),
          );
      }
      break;
    case SortCondition.dateModified:
      if (order == SortOrder.ascending) {
        sortedSpreads = spreads!.toList()
          ..sort(
            (a, b) => a.modifiedTimestamp.compareTo(b.modifiedTimestamp),
          );
      } else {
        sortedSpreads = spreads!.toList()
          ..sort(
            (b, a) => a.modifiedTimestamp.compareTo(b.modifiedTimestamp),
          );
      }
      break;
  }

  return sortedSpreads.toList();
});
