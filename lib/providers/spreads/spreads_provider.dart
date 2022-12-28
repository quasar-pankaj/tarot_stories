import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tarot_stories/database/entities/enum_spread_shape.dart';
import 'package:tarot_stories/providers/elements/selected_element_provider.dart';

import '../../database/entities/spread.dart';
import 'spreads_repository_provider.dart';

final spreadProvider =
    AsyncNotifierProvider<SpreadNotifier, Iterable<Spread>>(SpreadNotifier.new);

class SpreadNotifier extends AsyncNotifier<Iterable<Spread>> {
  @override
  FutureOr<Iterable<Spread>> build() async {
    final spreads = ref.watch(spreadsRepositoryProvider);
    return await spreads.getAllUnsorted();
  }

  Future<void> addNew(SpreadShape layoutType) async {
    final selectedElement = ref.watch(selectedElementProvider);
    final spread = Spread(
      name: 'No Name',
      createdTimestamp: DateTime.now().millisecondsSinceEpoch,
      modifiedTimestamp: DateTime.now().millisecondsSinceEpoch,
      elementId: selectedElement!.id!,
      layoutType: layoutType,
      readings: [],
    );

    await add(spread);
  }

  Future<void> add(Spread spread) async {
    state = const AsyncValue.loading();
    final s = await ref.read(spreadsRepositoryProvider).insert(spread);
    final spreads = [...?state.value, s];
    state = AsyncValue.data(spreads);
  }

  Future<void> delete(Spread spread) async {
    state = const AsyncValue.loading();
    await ref.read(spreadsRepositoryProvider).delete(spread);
    final spreads = state.value!.where((element) => element.id != spread.id);
    state = AsyncValue.data(spreads);
  }

  Future<void> save(Spread spread) async {
    state = const AsyncValue.loading();
    await ref.read(spreadsRepositoryProvider).update(spread);
    final spreads = [
      for (Spread item in state.value!)
        if (spread.id == item.id) spread else item
    ];
    state = AsyncValue.data(spreads);
  }
}
