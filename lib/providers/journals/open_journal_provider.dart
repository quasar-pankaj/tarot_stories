import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../database/entities/journal.dart';

final openJournalProvider = StateProvider<Journal?>((ref) {
  return null;
});
