import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tarot_stories/database/repository.dart';

import '../../database/entities/spread.dart';
import '../generic_notifier.dart';
import 'spread_repository_provider.dart';

final spreadProvider = AsyncNotifierProvider.family
    .autoDispose<SpreadNotifier, Iterable<Spread>, int>(SpreadNotifier.new);

class SpreadNotifier extends GenericNotifier<Spread> {
  @override
  Future<void> deleteChildren(Spread item) async {}

  @override
  String get fKField => 'journalId';

  @override
  Repository<Spread> get repository => ref.read(spreadRepositoryProvider);

  Future<void> save(Spread spread) =>
      saveBase(spread, (item) => spread.id == item.id);

  Future<void> delete(Spread spread) =>
      deleteBase(spread, (item) => spread.id != item.id);
}
