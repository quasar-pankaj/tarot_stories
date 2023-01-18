import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:undo/undo.dart';

import 'generic_notifier.dart';

mixin HistoryMixin<E> on GenericNotifier<E> {
  final ChangeStack _changeStack = ChangeStack();

  @override
  Future<E> add(item) {
    // TODO: implement add
    return super.add(item);
  }

  @override
  Future<void> deleteBase(E item, bool Function(E item) test) {
    // TODO: implement deleteBase
    return super.deleteBase(item, test);
  }

  @override
  Future<void> saveBase(E item, bool Function(E item) test) {
    // TODO: implement saveBase
    return super.saveBase(item, test);
  }
}
