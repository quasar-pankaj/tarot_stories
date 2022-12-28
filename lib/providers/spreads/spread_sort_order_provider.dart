import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../sort_order_buttons_notifier.dart';

final spreadSortOrderProvider = StateProvider<SortOrder>((ref) {
  return SortOrder.descending;
});
