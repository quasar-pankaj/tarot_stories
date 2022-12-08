import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/sort_condition_buttons_notifier.dart';
import '../providers/sort_order_buttons_notifier.dart';
import 'sort_condition_buttons.dart';
import 'sort_order_buttons.dart';

class Toolbar extends ConsumerWidget {
  final TextEditingController _controller = TextEditingController(text: '');
  final StateNotifierProvider<SortOrderButtonsNotifier, List<bool>>
      _sortOrderButtonsProvider;
  final StateProvider<SortOrder> _sortOrderProvider;
  final StateNotifierProvider<SortConditionButtonsNotifier, List<bool>>
      _sortConditionButtonsProvider;
  final StateProvider<SortCondition> _sortConditionProvider;
  final StateProvider<String> _filterTextProvider;
  Toolbar({
    super.key,
    required StateNotifierProvider<SortOrderButtonsNotifier, List<bool>>
        sortOrderButtonsProvider,
    required StateProvider<SortOrder> sortOrderProvider,
    required StateNotifierProvider<SortConditionButtonsNotifier, List<bool>>
        sortConditionButtonsProvider,
    required StateProvider<SortCondition> sortConditionProvider,
    required StateProvider<String> filterTextProvider,
  })  : _sortConditionButtonsProvider = sortConditionButtonsProvider,
        _sortConditionProvider = sortConditionProvider,
        _sortOrderButtonsProvider = sortOrderButtonsProvider,
        _sortOrderProvider = sortOrderProvider,
        _filterTextProvider = filterTextProvider;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        const Spacer(),
        Expanded(
          child: ListTile(
            leading: const Icon(Icons.search),
            trailing: IconButton(
              onPressed: _controller.clear,
              icon: const Icon(
                Icons.close,
              ),
            ),
            title: TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter text to search',
                hintText: 'Search',
              ),
              controller: _controller,
              onChanged: (value) =>
                  ref.read(_filterTextProvider.notifier).update(
                        (state) => value,
                      ),
            ),
          ),
        ),
        SortOrderButtons(
            sortOrderButtonsProvider: _sortOrderButtonsProvider,
            sortOrderProvider: _sortOrderProvider),
        const VerticalDivider(
          color: Colors.amber,
          width: 10.0,
          thickness: 5.5,
        ),
        SortConditionButtons(
            sortConditionButtonsProvider: _sortConditionButtonsProvider,
            sortConditionProvider: _sortConditionProvider),
      ],
    );
  }
}
