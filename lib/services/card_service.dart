// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:math';

import 'package:flutter/services.dart';

import 'card_model.dart';

class CardService {
  static const _totalCards = 78;
  static bool _loaded = false;

  static final List<int> _used = [];

  late final List<CardModel> _cards = [];

  static final CardService _instance = CardService._internal();

  static Future<CardService> get instance async {
    if (!_loaded) {
      await _instance._readJson();
      _loaded = true;
    }

    return _instance;
  }

  CardService._internal();

  Future<void> _readJson() async {
    final String response =
        await rootBundle.loadString('assets/text/deck.json');
    final data = await json.decode(response);
    final List array = List.from(data['cards']);

    for (var element in array) {
      _cards.add(CardModel.fromMap(element));
    }
  }

  List<CardModel> get allCards => _cards;

  CardModel get nextCard {
    final Random rng = Random();
    int rnd = rng.nextInt(_totalCards);

    while (_used.contains(rnd)) {
      rnd = rng.nextInt(_totalCards);
    }

    _used.add(rnd);

    return _cards[rnd];
  }

  void reset() => _used.clear();

  CardModel fetchByName(String name) {
    return _cards.firstWhere((element) => element.name == name);
  }
}
