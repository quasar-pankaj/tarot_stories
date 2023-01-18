import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../database/repository.dart';

abstract class GenericNotifier<P>
    extends AutoDisposeFamilyAsyncNotifier<Iterable<P>, int> {
  @override
  FutureOr<Iterable<P>> build(int arg) async {
    // if foreign key is empty then it is the root node so load all
    if (fKField.isEmpty) {
      return await repository.getAllUnsorted();
    } else {
      return await repository.getAllWhereFKFieldEquals(fKField, arg);
    }
  }

  Repository<P> get repository;
  String get fKField;
  Future<void> deleteChildren(P item);

  Future<P> add(P item) async {
    final P s = await repository.insert(item);
    final items = [...?state.value, s];
    state = AsyncValue.data(items);

    return s;
  }

  Future<void> deleteBase(P item, bool Function(P item) test) async {
    if (state.value != null) {
      final spreads = state.value!.where(test);
      state = AsyncValue.data(spreads);
    }

    await deleteChildren(item);
    await repository.delete(item);
  }

  Future<void> saveBase(P item, bool Function(P item) test) async {
    final items = [
      for (P entity in state.value!)
        if (test(entity)) item else entity
    ];
    state = AsyncValue.data(items);
    await repository.update(item);
  }
}
