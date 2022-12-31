import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../database/entities/spread.dart';
import '../../services/card_model.dart';
import '../cards_provider.dart';
import '../journals/open_journal_provider.dart';
import 'spread_repository_provider.dart';

final spreadProvider = AsyncNotifierProviderFamily<SpreadNotifier, Spread, int>(
  SpreadNotifier.new,
);

class SpreadNotifier extends FamilyAsyncNotifier<Spread, int> {
  @override
  FutureOr<Spread> build(int arg) async {
    final spread = await _loadSpread();
    if (spread == null) {
      return await _generate(arg);
    } else {
      return spread;
    }
  }

  Future<Spread?> _loadSpread() async {
    final repo = ref.watch(spreadRepositoryProvider);
    final journal = ref.watch(openJournalProvider);
    final persistentSpreads = await repo.getAllUnsorted();
    final loadedSpread =
        persistentSpreads.where((element) => element.journalId == journal!.id!);
    if (loadedSpread.isNotEmpty) {
      return loadedSpread.first;
    } else {
      return null;
    }
  }

  Future<Spread> _generate(int count) async {
    state = const AsyncValue.loading();
    final journal = ref.watch(openJournalProvider);
    final repo = ref.watch(spreadRepositoryProvider);

    final List<String> cards = await _createCards(count);
    final spread = Spread(
      journalId: journal!.id!,
      cards: cards,
    );
    final s = await repo.insert(spread);
    state = AsyncValue.data(s);
    return s;
  }

  Future<Spread> regenerate(int count) async {
    state = const AsyncValue.loading();
    final spread = await _loadSpread();

    if (spread == null) {
      return await _generate(count);
    }

    final repo = ref.watch(spreadRepositoryProvider);

    List<String> cards = await _createCards(count);
    final s = spread.copyWith(cards: cards);
    await repo.update(spread);
    return s;
  }

  Future<List<String>> _createCards(int count) async {
    final cardsService = await ref.watch(cardServiceProvider.future);
    final List<String> cards = [];
    for (int i = 0; i < count; i++) {
      CardModel card = cardsService.nextCard;
      cards.add(card.name);
    }
    return cards;
  }
}
