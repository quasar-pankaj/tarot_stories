import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../database/entities/enum_spread_shape.dart';
import '../../database/entities/journal.dart';
import '../../database/entities/reading.dart';
import '../../database/entities/spread.dart';
import '../../database/repository.dart';
import '../../services/card_model.dart';
import '../cards_provider.dart';
import '../elements/selected_element_provider.dart';
import '../generic_notifier.dart';
import '../readings/readings_provider.dart';
import '../readings/readings_repository_provider.dart';
import '../spreads/spread_provider.dart';
import '../spreads/spread_repository_provider.dart';
import 'journals_repository_provider.dart';

final journalProvider = AsyncNotifierProvider.family
    .autoDispose<JournalNotifier, Iterable<Journal>, int>(JournalNotifier.new);

class JournalNotifier extends GenericNotifier<Journal> {
  @override
  Future<void> deleteChildren(Journal item) async {
    final spreads = await ref.read(spreadProvider(item.id!).future);
    for (var spread in spreads) {
      ref.read(spreadProvider(item.id!).notifier).delete(spread);
    }

    final readings = await ref.read(readingsProvider(item.id!).future);
    for (var reading in readings) {
      ref.read(readingsProvider(item.id!).notifier).delete(reading);
    }
  }

  @override
  String get fKField => 'elementId';

  @override
  Repository<Journal> get repository => ref.read(journalsRepositoryProvider);

  Future<void> delete(Journal journal) =>
      deleteBase(journal, (item) => journal.id != item.id);

  Future<void> save(Journal journal) =>
      saveBase(journal, (item) => journal.id == item.id);

  Future<Journal> addNew(SpreadShape layoutType) async {
    final selectedElement = ref.read(selectedElementProvider);
    final journal = Journal(
      name: 'No Name',
      createdTimestamp: DateTime.now().millisecondsSinceEpoch,
      modifiedTimestamp: DateTime.now().millisecondsSinceEpoch,
      shape: layoutType,
      elementId: selectedElement!.id!,
    );

    final cardsProvider = await ref.read(cardServiceProvider.future);
    final j = await add(journal);

    final List<CardModel> cards = List.generate(
      journal.shape.numCards,
      (index) => cardsProvider.nextCard,
      growable: false,
    );

    final List<String> cardNames = cards.map((e) => e.name).toList();

    final spread = Spread(journalId: j.id!, cards: cardNames);
    await ref.read(spreadRepositoryProvider).insert(spread);
    final readings = Reading(
      journalId: j.id!,
      readings: '',
    );

    await ref.read(readingsRepositoryProvider).insert(readings);
    return j;
  }
}
