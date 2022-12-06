import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../database/entities/spread.dart';
import '../database/repository.dart';
import 'open_project_provider.dart';
import 'spreads_repository_provider.dart';

final spreadInMemoryProvider = StateNotifierProvider.autoDispose<
    Future<SpreadInMemoryNotifier>, Iterable<Spread>>((ref) async {
  final openProject = ref.watch(openProjectProvider);
  final repo = ref.watch(spreadsRepositoryProvider);
  final Iterable<Spread> spreads = await repo.getAllUnsorted();
  final int? projectId = openProject?.id;
  return SpreadInMemoryNotifier(repo, openProject?.id,
      spreads.where((element) => element.projectId == projectId));
});

class SpreadInMemoryNotifier extends StateNotifier<Iterable<Spread>> {
  final Repository<Spread> _repository;
  final int _projectId;
  SpreadInMemoryNotifier(
    Repository<Spread> repository,
    int? projectId,
    Iterable<Spread> spreads,
  )   : _repository = repository,
        _projectId = projectId!,
        super(spreads);

  Future<void> addNew() async {
    final Spread spread = Spread(
      name: 'no name',
      createdTimestamp: DateTime.now().millisecondsSinceEpoch,
      modifiedTimestamp: DateTime.now().millisecondsSinceEpoch,
      projectId: _projectId,
      layoutType: LayoutType.none,
      readings: [],
    );

    final spreads = [
      ...state,
      spread,
    ];
    await add(spread);

    state = spreads;
  }

  Future<void> add(Spread spread) async {
    final newSpread = await _repository.insert(spread);
    final spreads = [...state, newSpread];
    state = spreads;
  }

  Future<void> remove(Spread spread) async {
    final spreads = [...state.where((element) => element.id != spread.id)];
    await _repository.delete(spread);
    state = spreads;
  }

  Future<void> update(Spread spread) async {
    final spreads = [
      for (Spread item in state)
        if (item.id == spread.id) spread else item
    ];
    await _repository.update(spread);
    state = spreads;
  }
}
