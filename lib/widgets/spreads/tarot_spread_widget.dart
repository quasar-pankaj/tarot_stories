import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/cards_provider.dart';
import 'tarot_card.dart';

abstract class TarotSpreadWidget extends ConsumerWidget {
  const TarotSpreadWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cp = ref.watch(cardProvider);
    int index = 0;
    final Iterable<Widget> cards = cp.when(
      data: (data) => data.map(
        (card) => TarotCard(
          name: card.name,
          suit: card.suit,
          index: '${index++}',
        ),
      ),
      error: (error, stacktrace) => [Text(error.toString())],
      loading: () => [const CircularProgressIndicator()],
    );
    return layoutCards(cards);
  }

  Widget layoutCards(Iterable<Widget> widgets);
}
