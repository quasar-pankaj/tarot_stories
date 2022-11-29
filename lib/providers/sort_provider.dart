import 'package:flutter_riverpod/flutter_riverpod.dart';

final sortOrderProvider = StateNotifierProvider<SortOrderNotifier, List<bool>>(
    (ref) => SortOrderNotifier());

class SortOrderNotifier extends StateNotifier<List<bool>> {
  SortOrderNotifier() : super(<bool>[true, false]);
  void onSelected(int index) {
    List<bool> selected = state;

    for (int i = 0; i < state.length; i++) {
      selected[i] = i == index;
    }

    state = selected;
  }
}

final sortConditionProvider =
    StateNotifierProvider<SortConditionNotifier, List<bool>>(
        (ref) => SortConditionNotifier());

class SortConditionNotifier extends StateNotifier<List<bool>> {
  SortConditionNotifier() : super(<bool>[true, false, false]);

  void onSelected(int index) {
    List<bool> selected = state;

    for (int i = 0; i < state.length; i++) {
      selected[i] = i == index;
    }

    state = selected;
  }
}
