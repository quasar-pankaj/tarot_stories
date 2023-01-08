import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../database/entities/reading.dart';
import 'readings_repository_provider.dart';

final readingsProvider = AsyncNotifierProvider.family
    .autoDispose<ReadingsNotifier, Reading, int>(ReadingsNotifier.new);

class ReadingsNotifier extends AutoDisposeFamilyAsyncNotifier<Reading, int> {
  @override
  FutureOr<Reading> build(int arg) async {
    final repo = ref.watch(readingsRepositoryProvider);

    final readings = await repo.getAllWhereFKFieldEquals('journalId', arg);

    if (readings.isNotEmpty) {
      return readings.first;
    } else {
      final reading = Reading(journalId: arg, readings: []);
      final r = await repo.insert(reading);
      return r;
    }
  }

  Future<void> save(List<String> readings) async {
    final reading = state.value;
    final modifiedReading = reading!.copyWith(readings: readings);
    await ref.read(readingsRepositoryProvider).update(modifiedReading);
    state = AsyncValue.data(modifiedReading);
  }

  Future<void> saveWith(String reading, int index) async {
    final readings = state.value;
    readings!.readings[index] = reading;
    final modifiedReading = readings.copyWith(readings: readings.readings);
    await ref.read(readingsRepositoryProvider).update(modifiedReading);
    state = AsyncValue.data(modifiedReading);
  }

  Future<void> delete() async {
    final reading = state.value;
    await ref.read(readingsRepositoryProvider).delete(reading!);
  }
}
