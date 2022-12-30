import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../database/entities/enum_spread_category.dart';
import '../../database/entities/journal.dart';
import '../sort_condition_buttons_notifier.dart';
import '../sort_order_buttons_notifier.dart';
import 'journal_category_provider.dart';
import 'journal_filter_text_provider.dart';
import 'journal_sort_condition_provider.dart';
import 'journal_sort_order_provider.dart';
import 'journals_provider.dart';

final sortedFilteredJournalListProvider =
    FutureProvider.autoDispose<List<Journal>>((ref) async {
  final condition = ref.watch(journalSortConditionProvider);
  final order = ref.watch(journalSortOrderProvider);

  final spreads = ref.watch(journalProvider).value;
  final filterPattern = ref.watch(journalFilterTextProvider);
  final filterCondition = ref.watch(journalCategoryProvider);

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

  late final List<Journal> filteredSpreads;

  switch (filterCondition) {
    case JournalCategory.all:
      filteredSpreads = sortedSpreads;
      break;
    case JournalCategory.character:
      filteredSpreads = sortedSpreads
          .where((element) => element.layoutType == JournalCategory.character)
          .toList();
      break;
    case JournalCategory.structure:
      filteredSpreads = sortedSpreads
          .where((element) => element.layoutType == JournalCategory.structure)
          .toList();
      break;
    case JournalCategory.relationship:
      filteredSpreads = sortedSpreads
          .where(
              (element) => element.layoutType == JournalCategory.relationship)
          .toList();
      break;
    case JournalCategory.sceneSequel:
      filteredSpreads = sortedSpreads
          .where((element) => element.layoutType == JournalCategory.sceneSequel)
          .toList();
      break;
    case JournalCategory.location:
      filteredSpreads = sortedSpreads
          .where((element) => element.layoutType == JournalCategory.location)
          .toList();
      break;
    case JournalCategory.prop:
      filteredSpreads = sortedSpreads
          .where((element) => element.layoutType == JournalCategory.prop)
          .toList();
      break;
  }

  return filteredSpreads
      .where(
        (element) => element.name.contains(
          filterPattern,
        ),
      )
      .toList();
});
