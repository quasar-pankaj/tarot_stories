import 'package:flutter_riverpod/flutter_riverpod.dart';

class SortOrderButtonsNotifier extends StateNotifier<List<bool>> {
  SortOrderButtonsNotifier() : super(<bool>[true, false]);

  void onSelected(int index) {
    List<bool> selected = [...state];

    for (int i = 0; i < state.length; i++) {
      selected[i] = i == index;
    }

    state = selected;
  }
}

enum SortOrder {
  descending,
  ascending,
}
