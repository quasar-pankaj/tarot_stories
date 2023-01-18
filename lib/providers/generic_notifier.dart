import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:undo/undo.dart';

import '../database/repository.dart';

abstract class GenericNotifier<P>
    extends AutoDisposeFamilyAsyncNotifier<Iterable<P>, int> {
  final _changes = ChangeStack();

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
    late final P s;
    _changes.add(
      Change(
        state,
        () async {
          s = await repository.insert(item);
          final items = [...?state.value, s];
          state = AsyncValue.data(items);
        },
        (oldValue) async {
          await repository.delete(item);
          state = oldValue;
        },
      ),
    );
    return s;
  }

  Future<void> deleteBase(P item, bool Function(P item) test) async {
    P oldValue = state.value!.firstWhere((element) => !test(element));

    _changes.add(
      Change(
        oldValue,
        () async {
          if (state.value != null) {
            final spreads = state.value!.where(test);
            state = AsyncValue.data(spreads);
          }

          await deleteChildren(item);
          await repository.delete(item);
        },
        (oldValue) async {
          if (state.value != null) {
            final spreads = [...?state.value, oldValue];
            state = AsyncValue.data(spreads);
          }

          await repository.insert(oldValue);
        },
      ),
    );
  }

  Future<void> saveBase(P item, bool Function(P item) test) async {
    P oldValue = state.value!.firstWhere((element) => !test(element));

    _changes.add(
      Change(
        oldValue,
        () async {
          final items = [
            for (P entity in state.value!)
              if (test(entity)) item else entity
          ];
          state = AsyncValue.data(items);
          await repository.update(item);
        },
        (oldValue) async {
          final items = [
            for (P entity in state.value!)
              if (test(entity)) oldValue else entity
          ];
          state = AsyncValue.data(items);
          await repository.update(oldValue);
        },
      ),
    );
  }

  bool get canUndo {
    return _changes.canUndo;
  }

  void undo() {
    _changes.undo();
  }

  bool get canRedo {
    return _changes.canRedo;
  }

  void redo() {
    _changes.redo();
  }
}
