import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../sort_condition_buttons_notifier.dart';

final journalSortConditionButtonsProvider =
    StateNotifierProvider<SortConditionButtonsNotifier, List<bool>>(
        (ref) => SortConditionButtonsNotifier());
