import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../services/card_service.dart';

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
