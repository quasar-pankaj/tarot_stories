import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../database/entities/enum_spread_shape.dart';
import '../../database/entities/journal.dart';
import '../elements/selected_element_provider.dart';
import '../readings/readings_provider.dart';
import '../spreads/spread_provider.dart';
import 'journals_repository_provider.dart';

final journalProvider = AsyncNotifierProvider.family
    .autoDispose<JournalNotifier, Iterable<Journal>, int>(JournalNotifier.new);

class JournalNotifier
    extends AutoDisposeFamilyAsyncNotifier<Iterable<Journal>, int> {
  @override
  FutureOr<Iterable<Journal>> build(int arg) async {
    final journals = ref.watch(journalsRepositoryProvider);
    return await journals.getAllWhereFieldMatches('elementId', '$arg');
  }

  Future<Journal> addNew(SpreadShape layoutType) async {
    final selectedElement = ref.watch(selectedElementProvider);
    final journal = Journal(
      name: 'No Name',
      createdTimestamp: DateTime.now().millisecondsSinceEpoch,
      modifiedTimestamp: DateTime.now().millisecondsSinceEpoch,
      elementId: selectedElement!.id!,
    );

    final s = await add(journal);
    return s;
  }

  Future<Journal> add(Journal spread) async {
    state = const AsyncValue.loading();
    final s = await ref.read(journalsRepositoryProvider).insert(spread);
    final spreads = [...?state.value, s];
    state = AsyncValue.data(spreads);
    return s;
  }

  Future<void> delete(Journal spread) async {
    state = const AsyncValue.loading();
    await ref.read(journalsRepositoryProvider).delete(spread);
    final spreads = state.value!.where((element) => element.id != spread.id);
    state = AsyncValue.data(spreads);

    await ref.read(spreadProvider(spread.id!).notifier).delete();
    await ref.read(readingsProvider(spread.id!).notifier).delete();
  }

  Future<void> deleteAllForElement(int elementId) async {
    state = const AsyncValue.loading();
    final journals = await ref
        .read(journalsRepositoryProvider)
        .getAllWhereFieldMatches('elementId', '$elementId');

    for (var journal in journals) {
      await ref.read(spreadProvider(journal.id!).notifier).delete();
      await ref.read(readingsProvider(journal.id!).notifier).delete();
    }

    await ref
        .read(journalsRepositoryProvider)
        .deleteWhereFieldMatches('elementId', '$elementId');
  }

  Future<void> save(Journal spread) async {
    state = const AsyncValue.loading();
    await ref.read(journalsRepositoryProvider).update(spread);
    final spreads = [
      for (Journal item in state.value!)
        if (spread.id == item.id) spread else item
    ];
    state = AsyncValue.data(spreads);
  }
}
