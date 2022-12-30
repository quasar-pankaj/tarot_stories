import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tarot_stories/services/card_model.dart';

import '../../database/entities/spread.dart';
import '../cards_provider.dart';
import '../journals/open_journal_provider.dart';
import 'spread_repository_provider.dart';

final spreadGeneratorProvider =
    FutureProvider.family<Spread, int>((ref, int count) async {
  final repo = ref.watch(spreadRepositoryProvider);
  final journal = ref.watch(openJournalProvider);
  final cardsService = await ref.watch(cardServiceProvider.future);
  final List<String> cards = [];
  for (int i = 0; i < count; i++) {
    CardModel card = cardsService.nextCard;
    cards.add(card.name);
  }
  final spread = Spread(
    journalId: journal!.id!,
    cards: cards,
  );
  final s = repo.insert(spread);
  return s;
});
