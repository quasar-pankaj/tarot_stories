import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../sort_condition_buttons_notifier.dart';

final journalSortConditionProvider = StateProvider<SortCondition>((ref) {
  return SortCondition.dateModified;
});
