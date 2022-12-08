import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/sort_condition_buttons_notifier.dart';

class SortConditionButtons extends ConsumerWidget {
  final StateNotifierProvider<SortConditionButtonsNotifier, List<bool>>
      _sortConditionButtonsProvider;
  final StateProvider<SortCondition> _sortConditionProvider;
  const SortConditionButtons({
    super.key,
    required StateNotifierProvider<SortConditionButtonsNotifier, List<bool>>
        sortConditionButtonsProvider,
    required StateProvider<SortCondition> sortConditionProvider,
  })  : _sortConditionButtonsProvider = sortConditionButtonsProvider,
        _sortConditionProvider = sortConditionProvider;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ToggleButtons(
      isSelected: ref.watch(_sortConditionButtonsProvider),
      onPressed: (index) {
        ref.read(_sortConditionButtonsProvider.notifier).onSelected(index);
        ref
            .read(_sortConditionProvider.notifier)
            .update((state) => SortCondition.values[index]);
      },
      direction: Axis.horizontal,
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      selectedBorderColor: Colors.green[700],
      selectedColor: Colors.white,
      fillColor: Colors.green[200],
      color: Colors.green[400],
      constraints: const BoxConstraints(
        minHeight: 30.0,
        minWidth: 50.0,
      ),
      children: const [
        Icon(Icons.abc),
        Icon(Icons.checklist),
        Icon(Icons.checklist_rtl),
      ],
    );
  }
}
