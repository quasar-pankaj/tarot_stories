import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../database/entities/enum_spread_category.dart';

final spreadCategoryProvider = StateProvider<SpreadCategory>((ref) {
  return SpreadCategory.all;
});
