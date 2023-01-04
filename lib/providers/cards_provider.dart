import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../services/card_model.dart';
import '../services/card_service.dart';
import 'journals/open_journal_provider.dart';
import 'spreads/spread_provider.dart';

final cardServiceProvider = FutureProvider<CardService>((ref) async {
  return CardService.instance;
});

final pictorialKeyProvider =
    FutureProvider.family<String, String>((ref, cardId) async {
  final String response =
      await rootBundle.loadString('assets/text/pictorial_key.json');
  final data = await json.decode(response);
  final deck = data['deck'];
  final List array = List.from(deck['card']);

  final card = array.firstWhere((element) => element['_id'] == cardId);

  return card['description']['paragraph'];
});

final cardProvider = FutureProvider.autoDispose<List<CardModel>>((ref) async {
  final openJournal = ref.watch(openJournalProvider);
  final spread = await ref.watch(spreadProvider(openJournal!.id!).future);
  final cardService = await ref.watch(cardServiceProvider.future);

  final List<CardModel> cards = [];

  for (int i = 0; i < spread.cards!.length; i++) {
    cards.add(cardService.fetchByName(spread.cards![i]));
  }

  return cards;
});
