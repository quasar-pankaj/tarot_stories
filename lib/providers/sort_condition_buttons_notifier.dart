import 'package:flutter_riverpod/flutter_riverpod.dart';

class SortConditionButtonsNotifier extends StateNotifier<List<bool>> {
  SortConditionButtonsNotifier() : super(<bool>[false, false, true]);

  void onSelected(int index) {
    List<bool> selected = [...state];

    for (int i = 0; i < state.length; i++) {
      selected[i] = i == index;
    }

    state = selected;
  }
}

enum SortCondition {
  name,
  dateCreated,
  dateModified,
}
