import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../database/entities/spread.dart';
import '../spreads_repository_provider.dart';

class SpreadNotifier extends AsyncNotifier<Iterable<Spread>> {
  @override
  FutureOr<Iterable<Spread>> build() async{
    final spreads = ref.watch(spreadsRepositoryProvider);
    return await spreads.getAllUnsorted();
  }
}
