import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../database/entities/element.dart';
import '../../database/entities/enum_journal_category.dart';
import '../../database/repository.dart';
import '../generic_notifier.dart';
import '../journals/journals_provider.dart';
import '../project/open_project_provider.dart';
import 'elements_repository_provider.dart';
import 'selected_element_provider.dart';

final elementsProvider =
    AsyncNotifierProvider.autoDispose<ElementsNotifier, Iterable<Element>>(
  ElementsNotifier.new,
);

class ElementsNotifier extends GenericNotifier<Element> {
  @override
  Future<void> deleteChildren(Element item) async {
    final journals = await ref.read(journalProvider(item.id!).future);

    for (var journal in journals) {
      ref.read(journalProvider(item.id!).notifier).delete(journal);
    }
  }

  @override
  String get fKField => 'projectId';

  @override
  Repository<Element> get repository => ref.read(elementRepositoryProvider);

  Future<Element> addNew(JournalCategory type) async {
    final project = ref.read(openProjectProvider);
    final element = Element(
      projectId: project!.id!,
      name: 'No Name',
      elementType: type,
    );
    final elem = await add(element);
    ref.read(selectedElementProvider.notifier).state = elem;
    return elem;
  }

  Future<void> save(Element element) =>
      saveBase(element, (item) => element.id == item.id);

  Future<void> delete(Element element) =>
      deleteBase(element, (item) => element.id != item.id);
}

// class ElementsNotifier extends AutoDisposeAsyncNotifier<Iterable<Element>> {
//   @override
//   FutureOr<Iterable<Element>> build() async {
//     state = const AsyncValue.loading();
//     final elementsRepo = ref.watch(elementRepositoryProvider);
//     return await elementsRepo.getAllUnsorted();
//   }

//   Future<Element> addNew(JournalCategory type) async {
//     final project = ref.read(openProjectProvider);
//     final element = Element(
//       projectId: project!.id!,
//       name: 'No Name',
//       elementType: type,
//     );
//     final elem = await add(element);
//     ref.read(selectedElementProvider.notifier).state = elem;
//     return elem;
//   }

//   Future<Element> add(Element element) async {
//     state = const AsyncValue.loading();

//     final elem = await ref.read(elementRepositoryProvider).insert(element);

//     final elements = [...?state.value, elem];

//     state = AsyncValue.data(elements);

//     return elem;
//   }

//   Future<void> save(Element element) async {
//     state = const AsyncValue.loading();

//     await ref.read(elementRepositoryProvider).update(element);

//     final elements = [
//       for (Element item in state.value!)
//         if (item.id == element.id) element else item
//     ];

//     state = AsyncValue.data(elements);
//   }

//   Future<void> delete(Element element) async {
//     state = const AsyncValue.loading();

//     await ref
//         .read(journalProvider(element.id!).notifier)
//         .deleteAllForElement(element.id!);

//     await ref.read(elementRepositoryProvider).delete(element);

//     final elements = [
//       for (Element item in state.value!)
//         if (item.id != element.id) item
//     ];

//     state = AsyncValue.data(elements);
//   }

//   Future<void> deleteAllForProject(int projectId) async {
//     final elements = await ref
//         .read(elementRepositoryProvider)
//         .getAllWhereFKFieldEquals('projectId', projectId);

//     for (var element in elements) {
//       await ref
//           .read(journalProvider(element.id!).notifier)
//           .deleteAllForElement(element.id!);
//     }

//     await ref
//         .read(elementRepositoryProvider)
//         .deleteWhereFieldMatches('projectId', '$projectId');
//   }

//   Iterable<Element> filterByType(JournalCategory type) =>
//       state.value!.where((element) => element.elementType == type);
// }
