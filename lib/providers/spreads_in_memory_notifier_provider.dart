import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../database/entities/enum_spread_shape.dart';
import '../database/entities/spread.dart';
import '../database/repository.dart';
import 'open_project_provider.dart';
import 'spreads_repository_provider.dart';

final spreadInMemoryProvider = StateNotifierProvider.autoDispose<
    SpreadInMemoryNotifier, AsyncValue<Iterable<Spread>>>((ref) {
  final openProject = ref.watch(openProjectProvider); // need to change this!!!!
  final repo = ref.watch(spreadsRepositoryProvider);

  return SpreadInMemoryNotifier(
    repo,
    openProject?.id,
  );
});

class SpreadInMemoryNotifier
    extends StateNotifier<AsyncValue<Iterable<Spread>>> {
  final Repository<Spread> _repository;
  final int _elementId;
  SpreadInMemoryNotifier(
    Repository<Spread> repository,
    int? elementId,
  )   : _repository = repository,
        _elementId = elementId!,
        super(const AsyncValue.loading()) {
    _init();
  }

  Future<void> _init() async {
    try {
      final spreads = await _repository.getAllUnsorted();
      state = AsyncValue.data(
        spreads.where((element) => element.elementId == _elementId),
      );
    } on Exception catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future<void> addNew() async {
    state = const AsyncValue.loading();
    final Spread spread = Spread(
      name: 'no name',
      createdTimestamp: DateTime.now().millisecondsSinceEpoch,
      modifiedTimestamp: DateTime.now().millisecondsSinceEpoch,
      elementId: _elementId,
      layoutType: SpreadShape.horiz1,
      readings: [],
    );

    final spreads = [
      ...state.value!,
      spread,
    ];
    await add(spread);

    state = AsyncValue.data(spreads);
  }

  Future<void> add(Spread spread) async {
    final newSpread = await _repository.insert(spread);
    final spreads = [...state.value!, newSpread];
    state = AsyncValue.data(spreads);
  }

  Future<void> remove(Spread spread) async {
    final spreads = [
      ...state.value!.where((element) => element.id != spread.id)
    ];
    await _repository.delete(spread);
    state = AsyncValue.data(spreads);
  }

  Future<void> update(Spread spread) async {
    final spreads = [
      for (Spread item in state.value!)
        if (item.id == spread.id) spread else item
    ];
    await _repository.update(spread);
    state = AsyncValue.data(spreads);
  }
}
