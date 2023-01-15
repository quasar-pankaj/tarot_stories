import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../database/entities/reading.dart';
import '../../database/repository.dart';
import '../generic_notifier.dart';
import 'readings_repository_provider.dart';

final readingsProvider = AsyncNotifierProvider.family
    .autoDispose<ReadingsNotifier, Iterable<Reading>, int>(ReadingsNotifier.new);

class ReadingsNotifier extends GenericNotifier<Reading> {
  @override
  Future<void> deleteChildren(Reading item) async {}

  @override
  String get fKField => 'journalId';

  @override
  Repository<Reading> get repository => ref.read(readingsRepositoryProvider);

  Future<void> save(Reading reading) =>
      saveBase(reading, (item) => reading.id == item.id);

  Future<void> delete(Reading reading) =>
      deleteBase(reading, (item) => reading.id != item.id);
}

// class ReadingsNotifier extends AutoDisposeFamilyAsyncNotifier<Reading, int> {
//   @override
//   FutureOr<Reading> build(int arg) async {
//     final repo = ref.watch(readingsRepositoryProvider);

//     final readings = await repo.getAllWhereFKFieldEquals('journalId', arg);

//     if (readings.isNotEmpty) {
//       return readings.first;
//     } else {
//       final reading = Reading(journalId: arg, readings: '');
//       final r = await repo.insert(reading);
//       return r;
//     }
//   }

//   Future<void> save(Reading readings) async {
//     await ref.read(readingsRepositoryProvider).update(readings);
//     state = AsyncValue.data(readings);
//   }

//   Future<void> delete() async {
//     final reading = state.value;
//     await ref.read(readingsRepositoryProvider).delete(reading!);
//   }
// }
