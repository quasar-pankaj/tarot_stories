import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../database/entities/element.dart';
import '../../database/entities/enum_element_type.dart';
import 'elements_notifier_provider.dart';

final charactersFilterProvider = FutureProvider<Iterable<Element>>((ref) async {
  final Iterable<Element> all = await ref.watch(elementsProvider.future);
  return all.where((element) => element.elementType == ElementType.character);
});

final beatsFilterProvider = FutureProvider<Iterable<Element>>((ref) async {
  final Iterable<Element> all = await ref.watch(elementsProvider.future);
  return all.where((element) => element.elementType == ElementType.beat);
});

final placesFilterProvider = FutureProvider<Iterable<Element>>((ref) async {
  final Iterable<Element> all = await ref.watch(elementsProvider.future);
  return all.where((element) => element.elementType == ElementType.place);
});

final propsFilterProvider = FutureProvider<Iterable<Element>>((ref) async {
  final Iterable<Element> all = await ref.watch(elementsProvider.future);
  return all.where((element) => element.elementType == ElementType.prop);
});

final recycledFilterProvider = FutureProvider<Iterable<Element>>((ref) async {
  final Iterable<Element> all = await ref.watch(elementsProvider.future);
  return all.where((element) => element.elementType == ElementType.recycled);
});

final relationshipsFilterProvider =
    FutureProvider<Iterable<Element>>((ref) async {
  final Iterable<Element> all = await ref.watch(elementsProvider.future);
  return all
      .where((element) => element.elementType == ElementType.relationship);
});

final scenesFilterProvider = FutureProvider<Iterable<Element>>((ref) async {
  final Iterable<Element> all = await ref.watch(elementsProvider.future);
  return all.where((element) => element.elementType == ElementType.scene);
});

final structuresFilterProvider = FutureProvider<Iterable<Element>>((ref) async {
  final Iterable<Element> all = await ref.watch(elementsProvider.future);
  return all.where((element) => element.elementType == ElementType.structure);
});

final unassociatedFilterProvider =
    FutureProvider<Iterable<Element>>((ref) async {
  final Iterable<Element> all = await ref.watch(elementsProvider.future);
  return all
      .where((element) => element.elementType == ElementType.unassociated);
});
