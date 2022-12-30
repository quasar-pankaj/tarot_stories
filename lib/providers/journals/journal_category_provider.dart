import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../database/entities/enum_spread_category.dart';

final journalCategoryProvider = StateProvider<JournalCategory>((ref) {
  return JournalCategory.all;
});
