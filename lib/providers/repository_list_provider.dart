import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

class RepositoryListNotifier<E extends HiveObject>
    extends StateNotifier<List<E>> {
  String repoName;
  RepositoryListNotifier(List<E> list, this.repoName) : super(list);

  void execute(void Function(List<E> list) visit) {
    final list = state;
    visit(list);
    state = list;
  }

  void add(E item) {
    final list = state;
    list.add(item);
    if (!item.isInBox) {
      final box = Hive.box<E>(repoName);
      box.add(item);
    } else {
      item.save();
    }
    state = list;
  }

  void delete(E item) {
    final list = state;
    list.remove(item);
    if (item.isInBox) {
      final box = Hive.box<E>(repoName);
      box.delete(item.key);
    }
    state = list;
  }
}
