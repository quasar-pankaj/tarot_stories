import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/sort_condition_buttons_notifier.dart';
import '../providers/sort_order_buttons_notifier.dart';
import 'sort_condition_buttons.dart';
import 'sort_order_buttons.dart';

class Toolbar extends ConsumerWidget {
  final Widget? _optionalWidget;
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
    Widget? optionalWidget,
    required StateNotifierProvider<SortOrderButtonsNotifier, List<bool>>
        sortOrderButtonsProvider,
    required StateProvider<SortOrder> sortOrderProvider,
    required StateNotifierProvider<SortConditionButtonsNotifier, List<bool>>
        sortConditionButtonsProvider,
    required StateProvider<SortCondition> sortConditionProvider,
    required StateProvider<String> filterTextProvider,
  })  : _optionalWidget = optionalWidget,
        _sortConditionButtonsProvider = sortConditionButtonsProvider,
        _sortConditionProvider = sortConditionProvider,
        _sortOrderButtonsProvider = sortOrderButtonsProvider,
        _sortOrderProvider = sortOrderProvider,
        _filterTextProvider = filterTextProvider;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Row(
        children: <Widget>[
          const Spacer(),
          if (_optionalWidget != null) _optionalWidget!,
          const VerticalDivider(
            width: 8,
            thickness: 6,
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                isDense: true,
                contentPadding: const EdgeInsets.all(0),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                labelText: 'Enter text to search',
                hintText: 'Search',
                prefixIcon: const Icon(Icons.search),
                suffix: IconButton(
                  padding: const EdgeInsets.all(0),
                  onPressed: () {
                    _controller.clear();
                    ref
                        .read(_filterTextProvider.notifier)
                        .update((state) => '');
                  },
                  icon: const Icon(
                    Icons.close,
                  ),
                ),
              ),
              controller: _controller,
              onChanged: (value) =>
                  ref.read(_filterTextProvider.notifier).update(
                        (state) => value,
                      ),
            ),
          ),
          const VerticalDivider(
            color: Colors.amber,
            width: 10.0,
            thickness: 5.5,
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
      ),
    );
  }
}
