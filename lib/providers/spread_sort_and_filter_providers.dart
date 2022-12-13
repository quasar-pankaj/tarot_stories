import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tarot_stories/database/entities/spread.dart';

import '../database/entities/enum_spread_category.dart';
import 'sort_condition_buttons_notifier.dart';
import 'sort_order_buttons_notifier.dart';
import 'spreads_in_memory_notifier_provider.dart';

final spreadSortOrderButtonsProvider =
    StateNotifierProvider<SortOrderButtonsNotifier, List<bool>>(
        (ref) => SortOrderButtonsNotifier());

final spreadSortConditionButtonsProvider =
    StateNotifierProvider<SortConditionButtonsNotifier, List<bool>>(
        (ref) => SortConditionButtonsNotifier());

final spreadFilterTextProvider = StateProvider<String>((ref) {
  return "";
});

final spreadCategoryProvider = StateProvider<SpreadCategory>((ref) {
  return SpreadCategory.all;
});

final spreadSortOrderProvider = StateProvider<SortOrder>((ref) {
  return SortOrder.descending;
});

final spreadSortConditionProvider = StateProvider<SortCondition>((ref) {
  return SortCondition.dateModified;
});

final sortedFilteredSpreadListProvider =
    FutureProvider.autoDispose<List<Spread>>((ref) async {
  final condition = ref.watch(spreadSortConditionProvider);
  final order = ref.watch(spreadSortOrderProvider);

  final spreads = ref.watch(spreadInMemoryProvider).value;
  final filterPattern = ref.watch(spreadFilterTextProvider);
  final filterCondition = ref.watch(spreadCategoryProvider);

  late final List<Spread> sortedSpreads;

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

  late final List<Spread> filteredSpreads;

  switch (filterCondition) {
    case SpreadCategory.all:
      filteredSpreads = sortedSpreads;
      break;
    case SpreadCategory.character:
      filteredSpreads = sortedSpreads
          .where((element) => element.layoutType == SpreadCategory.character)
          .toList();
      break;
    case SpreadCategory.structure:
      filteredSpreads = sortedSpreads
          .where((element) => element.layoutType == SpreadCategory.structure)
          .toList();
      break;
    case SpreadCategory.relationship:
      filteredSpreads = sortedSpreads
          .where((element) => element.layoutType == SpreadCategory.relationship)
          .toList();
      break;
    case SpreadCategory.sceneSequel:
      filteredSpreads = sortedSpreads
          .where((element) => element.layoutType == SpreadCategory.sceneSequel)
          .toList();
      break;
    case SpreadCategory.location:
      filteredSpreads = sortedSpreads
          .where((element) => element.layoutType == SpreadCategory.location)
          .toList();
      break;
    case SpreadCategory.prop:
      filteredSpreads = sortedSpreads
          .where((element) => element.layoutType == SpreadCategory.prop)
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
