import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tarot_stories/database/entities/spread.dart';

import 'sort_condition_buttons_notifier.dart';
import 'sort_order_buttons_notifier.dart';
import 'spreads_in_memory_notifier_provider.dart';

enum SpreadCategoryFilter {
  all('All'),
  character('Character'),
  plot('Plot'),
  scene('Scene'),
  sequel('Sequel'),
  theme('Theme'),
  arc('Arc'),
  structure('Structure'),
  relationship('Relationship');

  final String _name;
  const SpreadCategoryFilter(String name) : _name = name;

  @override
  String toString() => _name;
}

final spreadSortOrderButtonsProvider =
    StateNotifierProvider<SortOrderButtonsNotifier, List<bool>>(
        (ref) => SortOrderButtonsNotifier());

final spreadSortConditionButtonsProvider =
    StateNotifierProvider<SortConditionButtonsNotifier, List<bool>>(
        (ref) => SortConditionButtonsNotifier());

final spreadFilterTextProvider = StateProvider<String>((ref) {
  return "";
});

final spreadCategoryProvider = StateProvider<SpreadCategoryFilter>((ref) {
  return SpreadCategoryFilter.all;
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
    case SpreadCategoryFilter.all:
      filteredSpreads = sortedSpreads;
      break;
    case SpreadCategoryFilter.character:
      filteredSpreads = sortedSpreads
          .where(
              (element) => element.layoutType == SpreadCategoryFilter.character)
          .toList();
      break;
    case SpreadCategoryFilter.plot:
      filteredSpreads = sortedSpreads
          .where((element) => element.layoutType == SpreadCategoryFilter.plot)
          .toList();
      break;
    case SpreadCategoryFilter.scene:
      filteredSpreads = sortedSpreads
          .where((element) => element.layoutType == SpreadCategoryFilter.scene)
          .toList();
      break;
    case SpreadCategoryFilter.sequel:
      filteredSpreads = sortedSpreads
          .where((element) => element.layoutType == SpreadCategoryFilter.sequel)
          .toList();
      break;
    case SpreadCategoryFilter.theme:
      filteredSpreads = sortedSpreads
          .where((element) => element.layoutType == SpreadCategoryFilter.theme)
          .toList();
      break;
    case SpreadCategoryFilter.arc:
      filteredSpreads = sortedSpreads
          .where((element) => element.layoutType == SpreadCategoryFilter.arc)
          .toList();
      break;
    case SpreadCategoryFilter.structure:
      filteredSpreads = sortedSpreads
          .where(
              (element) => element.layoutType == SpreadCategoryFilter.structure)
          .toList();
      break;
    case SpreadCategoryFilter.relationship:
      filteredSpreads = sortedSpreads
          .where((element) =>
              element.layoutType == SpreadCategoryFilter.relationship)
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
