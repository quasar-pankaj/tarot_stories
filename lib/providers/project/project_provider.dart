import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../database/entities/project.dart';
import 'project_repository_provider.dart';

final projectsProvider =
    AsyncNotifierProvider<ProjetcsNotifier, Iterable<Project>>(
  ProjetcsNotifier.new,
);

class ProjetcsNotifier extends AsyncNotifier<Iterable<Project>> {
  @override
  FutureOr<Iterable<Project>> build() async {
    state = const AsyncLoading();
    final repo = ref.watch(projectRepositoryProvider);
    final projects = await repo.getAllUnsorted();
    return projects;
  }

  Future<void> save({Project? project}) async {
    project ??= Project(
      name: 'no name',
      synopsis: '',
      createdTimestamp: DateTime.now().millisecondsSinceEpoch,
      modifiedTimestamp: DateTime.now().millisecondsSinceEpoch,
    );

    if (project.id == null) {
      await ref.read(projectRepositoryProvider).insert(project);
    } else {
      await ref.read(projectRepositoryProvider).update(project);
    }
  }

  Future<void> delete(Project project) async {
    await ref.read(projectRepositoryProvider).delete(project);
  }
}
