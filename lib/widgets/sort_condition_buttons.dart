import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/sort_and_filter_providers.dart';

class SortConditionButtons extends ConsumerWidget {
  const SortConditionButtons({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ToggleButtons(
      isSelected: ref.watch(sortConditionButtonsProvider),
      onPressed: (index) {
        ref.read(sortConditionButtonsProvider.notifier).onSelected(index);
        ref
            .read(sortConditionProvider.notifier)
            .update((state) => SortCondition.values[index]);
      },
      direction: Axis.horizontal,
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      selectedBorderColor: Colors.green[700],
      selectedColor: Colors.white,
      fillColor: Colors.green[200],
      color: Colors.green[400],
      constraints: const BoxConstraints(
        minHeight: 40.0,
        minWidth: 80.0,
      ),
      children: const [
        Icon(Icons.abc),
        Icon(Icons.checklist),
        Icon(Icons.checklist_rtl),
      ],
    );
  }
}
