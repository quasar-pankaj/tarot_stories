import 'package:hive_flutter/hive_flutter.dart';

import 'project.dart';
import 'spread.dart';

class AppDatabase {
  static const projects = 'projects';
  static const spreads  = 'spreads';

  static Future<void> init() async {
    await Hive.initFlutter('PowerWorkflow');

    // Register adapters
    Hive.registerAdapter<Project>(ProjectAdapter());
    Hive.registerAdapter<Spread>(SpreadAdapter());

    // open boxes
    await Hive.openBox<Project>(projects);
    await Hive.openBox<Spread>(spreads);
  }

  static Future<void> close() async {
    await Hive.close();
  }
}
