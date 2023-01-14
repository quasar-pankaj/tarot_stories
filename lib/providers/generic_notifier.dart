import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../database/repository.dart';

abstract class GenericNotifier<P, C>
    extends AutoDisposeFamilyAsyncNotifier<Iterable<P>, int> {
  @override
  FutureOr<Iterable<P>> build(int arg) async {
    if (fKField.isEmpty) {
      return await repository.getAllUnsorted();
    } else {
      return await repository.getAllWhereFKFieldEquals(fKField, arg);
    }
  }

  Repository<P> get repository;
  String get fKField;
  Repository<C>? get child1Reposotory;

  Future<P> add(P item) async {
    state = const AsyncValue.loading();
    final s = await repository.insert(item);
    final items = [...?state.value, s];
    state = AsyncValue.data(items);
    return s;
  }

  Future<void> delete(P item, bool Function(P item) test) async {
    final spreads = state.value!.where(test);
    state = AsyncValue.data(spreads);
    await repository.delete(item);
  }

  Future<void> save(P item, bool Function(P item) test) async {
    final spreads = [
      for (P entity in state.value!)
        if (test(entity)) item else entity
    ];
    state = AsyncValue.data(spreads);
    await repository.update(item);
  }
}
