import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/sort_and_filter_providers.dart';

class SortOrderButtons extends ConsumerWidget {
  const SortOrderButtons({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ToggleButtons(
      isSelected: ref.watch(sortOrderButtonsProvider),
      onPressed: (index) {
        ref.read(sortOrderButtonsProvider.notifier).onSelected(index);
        ref
            .read(sortOrderProvider.notifier)
            .update((state) => SortOrder.values[index]);
      },
      direction: Axis.horizontal,
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      selectedBorderColor: Colors.red[700],
      selectedColor: Colors.white,
      fillColor: Colors.red[200],
      color: Colors.red[400],
      constraints: const BoxConstraints(
        minHeight: 40.0,
        minWidth: 80.0,
      ),
      children: const [
        Icon(Icons.arrow_circle_down),
        Icon(Icons.arrow_circle_up),
      ],
    );
  }
}
