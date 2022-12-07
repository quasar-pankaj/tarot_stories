import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/project_sort_and_filter_providers.dart';
import '../providers/sort_condition_buttons_notifier.dart';

class ProjectSortConditionButtons extends ConsumerWidget {
  const ProjectSortConditionButtons({super.key});

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
