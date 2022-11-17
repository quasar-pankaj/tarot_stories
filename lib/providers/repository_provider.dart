import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

class RepositoryNotifier<E extends HiveObject> extends StateNotifier<E> {
  final String repoName;
  RepositoryNotifier(E entity, this.repoName) : super(entity);

  void execute(void Function(E entity) visit) {
    final e = state;
    visit(e);
    state = e;
  }

  void save() {
    if (!state.isInBox) {
      final box = Hive.box<E>(repoName);
      box.add(state);
    } else {
      state.save();
    }
  }

  void delete() {
    if (state.isInBox) {
      state.delete();
    }
  }
}
