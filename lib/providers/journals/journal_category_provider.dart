import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../database/entities/enum_journal_category.dart';

final journalCategoryProvider = StateProvider<JournalCategory>((ref) {
  return JournalCategory.character;
});
