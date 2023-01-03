import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../database/entities/spread.dart';
import 'spread_repository_provider.dart';

final spreadProvider = AsyncNotifierProvider.family
    .autoDispose<SpreadNotifier, Spread, int>(SpreadNotifier.new);

class SpreadNotifier extends AutoDisposeFamilyAsyncNotifier<Spread, int> {
  @override
  FutureOr<Spread> build(int arg) async {
    final repo = ref.watch(spreadRepositoryProvider);

    final spreads = await repo.getAllWhereFieldMatches('journalId', '$arg');

    return spreads.first;
  }

  Future<void> save(List<String> cards) async {
    final spread = state.value;
    late final Spread modifiedReading;
    if (spread == null) {
      modifiedReading = Spread(journalId: arg, cards: []);
    } else {
      modifiedReading = spread.copyWith(cards: cards);
    }
    await ref.read(spreadRepositoryProvider).update(modifiedReading);
    state = AsyncValue.data(modifiedReading);
  }

  Future<void> delete() async {
    final spread = state.value;
    await ref.read(spreadRepositoryProvider).delete(spread!);
  }
}
