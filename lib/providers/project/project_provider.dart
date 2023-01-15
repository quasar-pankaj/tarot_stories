import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../database/entities/project.dart';
import '../../database/repository.dart';
import '../elements/elements_provider.dart';
import '../generic_notifier.dart';
import 'project_repository_provider.dart';

final projectsProvider = AsyncNotifierProvider.autoDispose
    .family<ProjetcsNotifier, Iterable<Project>, int>(
  ProjetcsNotifier.new,
);

class ProjetcsNotifier extends GenericNotifier<Project> {
  @override
  Future<void> deleteChildren(Project item) async {
    final elements = await ref.read(elementsProvider(item.id!).future);

    for (var element in elements) {
      ref.read(elementsProvider(item.id!).notifier).delete(element);
    }
  }

  @override
  String get fKField => '';

  @override
  Repository<Project> get repository => ref.read(projectRepositoryProvider);

  Future<Project> addNew() async {
    final project = Project(
      name: 'No Name',
      synopsis: '',
      createdTimestamp: DateTime.now().millisecondsSinceEpoch,
      modifiedTimestamp: DateTime.now().millisecondsSinceEpoch,
    );

    final p = await add(project);
    return p;
  }

  Future<void> save(Project project) =>
      saveBase(project, (item) => item.id == project.id);

  Future<void> delete(Project project) =>
      deleteBase(project, (item) => item.id != project.id);
}

// class ProjetcsNotifier extends AutoDisposeAsyncNotifier<Iterable<Project>> {
//   @override
//   FutureOr<Iterable<Project>> build() async {
//     state = const AsyncLoading();
//     final repo = ref.watch(projectRepositoryProvider);
//     final projects = await repo.getAllUnsorted();
//     return projects;
//   }

  // Future<Project> addNew() async {
  //   final project = Project(
  //     name: 'No Name',
  //     synopsis: '',
  //     createdTimestamp: DateTime.now().millisecondsSinceEpoch,
  //     modifiedTimestamp: DateTime.now().millisecondsSinceEpoch,
  //   );

  //   final p = await add(project);
  //   return p;
  // }

//   Future<Project> add(Project project) async {
//     state = const AsyncValue.loading();

//     final p = await ref.read(projectRepositoryProvider).insert(project);
//     final projects = [...state.value!, p];

//     state = AsyncValue.data(projects);

//     return p;
//   }

//   Future<void> save(Project project) async {
//     state = const AsyncValue.loading();

//     await ref.read(projectRepositoryProvider).update(project);
//     final projects = [
//       for (Project item in state.value!)
//         if (item.id == project.id) project else item
//     ];

//     state = AsyncValue.data(projects);
//   }

//   Future<void> delete(Project project) async {
//     state = const AsyncValue.loading();

//     ref.read(elementsProvider.notifier).deleteAllForProject(project.id!);

//     await ref.read(projectRepositoryProvider).delete(project);
//     final projects = state.value!.where((element) => element.id != project.id);

//     state = AsyncData(projects);
//   }
// }
