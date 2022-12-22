import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../database/entities/enum_spread_shape.dart';
import '../database/entities/spread.dart';
import '../database/repository.dart';
import 'generic_state_notifiers.dart';
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

class SpreadInMemoryNotifier extends AsyncGenericStateNotifier<Spread> {
  final Repository<Spread> _repository;
  final int _elementId;

  SpreadInMemoryNotifier(
    Repository<Spread> repository,
    int? elementId,
  )   : _repository = repository,
        _elementId = elementId!,
        super(repository, (e) => e.elementId == elementId) {
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

  Future<void> remove(Spread spread) async {
    await super.delete(spread, (entity) => entity.id == spread.id);
  }

  Future<void> update(Spread spread) async {
    await super.modify(spread, (entity) => entity.id == spread.id);
  }
}
