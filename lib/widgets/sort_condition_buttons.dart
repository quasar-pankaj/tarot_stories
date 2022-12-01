import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/project_sort_and_filter_providers.dart';

class SortConditionButtons extends ConsumerWidget {
  const SortConditionButtons({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ToggleButtons(
      isSelected: ref.watch(projectSortConditionButtonsProvider),
      onPressed: (index) {
        ref
            .read(projectSortConditionButtonsProvider.notifier)
            .onSelected(index);
        ref
            .read(projectSortConditionProvider.notifier)
            .update((state) => ProjectSortCondition.values[index]);
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
