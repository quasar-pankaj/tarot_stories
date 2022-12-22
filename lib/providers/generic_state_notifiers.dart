import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../database/repository.dart';

class GenericStateNotifier<E> extends StateNotifier<List<E>> {
  final Repository<E> _repository;
  bool _initialized = false;

  GenericStateNotifier(
    Repository<E> repo,
  )   : _repository = repo,
        super([]);

  bool get isInitialized => _initialized;

  void initialize(List<E> initialList) {
    state = initialList;
    _initialized = true;
  }

  Future<void> add(E entity) async {
    final entityCopy = await _repository.insert(entity);

    final entities = [
      ...state,
      entityCopy,
    ];

    state = entities;
  }

  Future<void> delete(E entity, bool Function(E entity) test) async {
    final entities = [
      for (E item in state)
        if (!test(item)) item
    ];

    await _repository.delete(entity);

    state = entities;
  }

  Future<void> modify(E entity, bool Function(E entity) test) async {
    final projects = [
      for (E item in state)
        if (test(item)) entity else item
    ];

    await _repository.update(entity);

    state = projects;
  }
}

// AsyncValue
class AsyncGenericStateNotifier<E>
    extends StateNotifier<AsyncValue<Iterable<E>>> {
  final Repository<E> _repository;

  AsyncGenericStateNotifier(
    Repository<E> repo,
    bool Function(E entity) test,
  )   : _repository = repo,
        super(const AsyncValue.loading()) {
    _init(test);
  }

  Future<void> _init(bool Function(E entity) test) async {
    try {
      final entities = await _repository.getAllUnsorted();
      state = AsyncValue.data(
        entities.where(test),
      );
    } on Exception catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future<void> add(E entity) async {
    final newSpread = await _repository.insert(entity);
    final spreads = [...state.value!, newSpread];
    state = AsyncValue.data(spreads);
  }

  Future<void> delete(E entity, bool Function(E entity) test) async {
    final entities = [
      for (E item in state.value!)
        if (!test(item)) item
    ];
    await _repository.delete(entity);
    state = AsyncValue.data(entities);
  }

  Future<void> modify(E entity, bool Function(E entity) test) async {
    final entities = [
      for (E item in state.value!)
        if (test(item)) entity else item
    ];
    await _repository.update(entity);
    state = AsyncValue.data(entities);
  }
}
