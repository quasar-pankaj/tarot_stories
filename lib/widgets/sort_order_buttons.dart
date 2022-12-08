import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/sort_order_buttons_notifier.dart';

class SortOrderButtons extends ConsumerWidget {
  final StateNotifierProvider<SortOrderButtonsNotifier, List<bool>>
      _sortOrderButtonsProvider;
  final StateProvider<SortOrder> _sortOrderProvider;
  const SortOrderButtons({
    super.key,
    required StateNotifierProvider<SortOrderButtonsNotifier, List<bool>>
        sortOrderButtonsProvider,
    required StateProvider<SortOrder> sortOrderProvider,
  })  : _sortOrderButtonsProvider = sortOrderButtonsProvider,
        _sortOrderProvider = sortOrderProvider;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ToggleButtons(
      isSelected: ref.watch(_sortOrderButtonsProvider),
      onPressed: (index) {
        ref.read(_sortOrderButtonsProvider.notifier).onSelected(index);
        ref
            .read(_sortOrderProvider.notifier)
            .update((state) => SortOrder.values[index]);
      },
      direction: Axis.horizontal,
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      selectedBorderColor: Colors.red[700],
      selectedColor: Colors.white,
      fillColor: Colors.red[200],
      color: Colors.red[400],
      constraints: const BoxConstraints(
        minHeight: 30.0,
        minWidth: 50.0,
      ),
      children: const [
        Icon(Icons.arrow_circle_down),
        Icon(Icons.arrow_circle_up),
      ],
    );
  }
}
