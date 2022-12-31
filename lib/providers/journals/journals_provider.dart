import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tarot_stories/database/entities/enum_spread_shape.dart';
import 'package:tarot_stories/providers/elements/selected_element_provider.dart';

import '../../database/entities/journal.dart';
import 'journals_repository_provider.dart';

final journalProvider =
    AsyncNotifierProvider<JournalNotifier, Iterable<Journal>>(
        JournalNotifier.new);

class JournalNotifier extends AsyncNotifier<Iterable<Journal>> {
  @override
  FutureOr<Iterable<Journal>> build() async {
    final spreads = ref.watch(journalsRepositoryProvider);
    return await spreads.getAllUnsorted();
  }

  Future<Journal> addNew(SpreadShape layoutType) async {
    final selectedElement = ref.watch(selectedElementProvider);
    final spread = Journal(
      name: 'No Name',
      createdTimestamp: DateTime.now().millisecondsSinceEpoch,
      modifiedTimestamp: DateTime.now().millisecondsSinceEpoch,
      elementId: selectedElement!.id!,
    );

    final s = await add(spread);
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
