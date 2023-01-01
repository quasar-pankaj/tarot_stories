import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../database/entities/spread.dart';
import 'spread_repository_provider.dart';

final spreadProvider = AsyncNotifierProvider.family
    .autoDispose<SpreadNotifier, Spread, int>(SpreadNotifier.new);

class SpreadNotifier extends FamilyAsyncNotifier<Spread, int> {
  @override
  FutureOr<Spread> build(int arg) async {
    final repo = ref.watch(spreadRepositoryProvider);

    final spreads = await repo.getAllWhereFieldMatches('journalId', '$arg');

    if (spreads.isNotEmpty) {
      return spreads.first;
    } else {
      final reading = Spread(journalId: arg, cards: []);
      final r = await repo.insert(reading);
      return r;
    }
  }

  Future<void> save(List<String> cards) async {
    final spread = state.value;
    final modifiedReading = spread!.copyWith(cards: cards);
    await ref.read(spreadRepositoryProvider).update(modifiedReading);
    state = AsyncValue.data(modifiedReading);
  }

  Future<void> delete() async {
    final spread = state.value;
    await ref.read(spreadRepositoryProvider).delete(spread!);
  }
}
