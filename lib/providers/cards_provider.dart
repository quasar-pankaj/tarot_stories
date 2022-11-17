import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../services/card_service.dart';

final cardServiceProvider = FutureProvider<CardService>((ref) async {
  return CardService.instance;
});
