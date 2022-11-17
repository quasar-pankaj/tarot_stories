// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive/hive.dart';

import 'app_database.dart';
import 'entity.dart';
import 'spread.dart';


part 'project.g.dart';

@HiveType(typeId: 0)
class Project extends HiveObject implements Entity {
  @override
  @HiveField(0)
  String name;

  Project({
    required this.name,
  });

  @HiveField(1)
  HiveList<Spread> spreads = HiveList(Hive.box(AppDatabase.spreads));
}
