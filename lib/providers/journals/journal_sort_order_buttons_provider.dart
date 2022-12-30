import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../sort_order_buttons_notifier.dart';

final journalSortOrderButtonsProvider =
    StateNotifierProvider<SortOrderButtonsNotifier, List<bool>>(
        (ref) => SortOrderButtonsNotifier());
