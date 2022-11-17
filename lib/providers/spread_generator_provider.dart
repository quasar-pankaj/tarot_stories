import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../services/card_model.dart';
import '../services/card_service.dart';
import 'cards_provider.dart';

final spreadGeneratorProvider =
    StateNotifierProvider.family<SpreadGeneratorNotifier, List<CardModel>, int>(
        (ref, count) {
  final watch = ref.watch(cardServiceProvider).value;
  final notifier = SpreadGeneratorNotifier(service: watch!)..generate(cards: count);
  return notifier;
});

class SpreadGeneratorNotifier extends StateNotifier<List<CardModel>> {
  final CardService _service;

  SpreadGeneratorNotifier({
    required CardService service,
  })  : _service = service,
        super([]);

  void generate({int cards = 1}) {
    final List<CardModel> cardlist = [];
    for (var i = 0; i < cards; i++) {
      cardlist.add(_service.nextCard);
    }

    state = cardlist;
  }
}
