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

final elementsProvider = AsyncNotifierProvider.autoDispose
    .family<ElementsNotifier, Iterable<Element>, int>(
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
