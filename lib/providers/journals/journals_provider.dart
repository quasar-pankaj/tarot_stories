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
    final spread = await ref.read(spreadProvider(item.id!).future);
    ref.read(spreadProvider(item.id!).notifier).delete(spread);

    final reading = await ref.read(readingsProvider(item.id!).future);
    ref.read(readingsProvider(item.id!).notifier).delete(reading);
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

// class JournalNotifier
//     extends AutoDisposeFamilyAsyncNotifier<Iterable<Journal>, int> {
//   @override
//   FutureOr<Iterable<Journal>> build(int arg) async {
//     final journals = ref.watch(journalsRepositoryProvider);
//     return await journals.getAllWhereFKFieldEquals('elementId', arg);
//   }

//   Future<Journal> addNew(SpreadShape layoutType) async {
//     final selectedElement = ref.read(selectedElementProvider);
//     final journal = Journal(
//       name: 'No Name',
//       createdTimestamp: DateTime.now().millisecondsSinceEpoch,
//       modifiedTimestamp: DateTime.now().millisecondsSinceEpoch,
//       shape: layoutType,
//       elementId: selectedElement!.id!,
//     );

//     final cardsProvider = await ref.read(cardServiceProvider.future);
//     final j = await add(journal);

//     final List<CardModel> cards = List.generate(
//       journal.shape.numCards,
//       (index) => cardsProvider.nextCard,
//       growable: false,
//     );

//     final List<String> cardNames = cards.map((e) => e.name).toList();

//     final spread = Spread(journalId: j.id!, cards: cardNames);
//     await ref.read(spreadRepositoryProvider).insert(spread);
//     final readings = Reading(
//       journalId: j.id!,
//       readings: '',
//     );

//     await ref.read(readingsRepositoryProvider).insert(readings);
//     return j;
//   }

//   Future<Journal> add(Journal spread) async {
//     state = const AsyncValue.loading();
//     final s = await ref.read(journalsRepositoryProvider).insert(spread);
//     final spreads = [...?state.value, s];
//     state = AsyncValue.data(spreads);
//     return s;
//   }

//   Future<void> delete(Journal spread) async {
//     await ref.read(journalsRepositoryProvider).delete(spread);
//     final spreads = state.value!.where((journal) => journal.id != spread.id);
//     state = AsyncValue.data(spreads);

//     await ref.read(spreadProvider(spread.id!).notifier).delete();
//     await ref.read(readingsProvider(spread.id!).notifier).delete();
//   }

//   Future<void> deleteAllForElement(int elementId) async {
//     final journals = await ref
//         .read(journalsRepositoryProvider)
//         .getAllWhereFKFieldEquals('elementId', elementId);

//     for (var journal in journals) {
//       await ref.read(spreadProvider(journal.id!).notifier).delete();
//       await ref.read(readingsProvider(journal.id!).notifier).delete();
//     }

//     await ref
//         .read(journalsRepositoryProvider)
//         .deleteWhereFieldMatches('elementId', '$elementId');
//   }

//   Future<void> save(Journal spread) async {
//     await ref.read(journalsRepositoryProvider).update(spread);
//     final spreads = [
//       for (Journal item in state.value!)
//         if (spread.id == item.id) spread else item
//     ];
//     state = AsyncValue.data(spreads);
//   }
// }
